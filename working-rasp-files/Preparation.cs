using System;
using System.Collections.Generic;
using System.Security.Cryptography.X509Certificates;

using dk.gov.oiosi.common;
using dk.gov.oiosi.communication;
using dk.gov.oiosi.communication.configuration;
using dk.gov.oiosi.security.revocation;
using dk.gov.oiosi.uddi;
using dk.gov.oiosi.security;
using dk.gov.oiosi.security.ldap;
using dk.gov.oiosi.security.lookup;
using dk.gov.oiosi.security.oces;
using dk.gov.oiosi.xml.documentType;
using dk.gov.oiosi.test.request;
using dk.gov.oiosi.raspProfile.communication;
using dk.gov.oiosi.samples.ClientExample;
using dk.gov.oiosi.addressing;

namespace dk.gov.oiosi.samples.consoleClientExample {

    /// <summary>
    /// Extended Request example
    /// 
    /// This example demonstrates how to perform the UDDI, LDAP and OCSP/CRL lookups needed
    /// to make a full OIOSI RASP service call.
    /// 
    /// Lessons
    /// --------
    ///     UDDI Lookup - region 1
    ///         We use the type of document we're sending and the EAN number it contains to
    ///         find a remote endpoint address and a remote endpoint certificate in the UDDI 
    ///         registry
    /// 
    ///     LDAP Lookup - region 2
    ///         We use LDAP to download the certificate returned by the UDDI registry
    /// 
    ///     Revocation Lookup - region 3
    ///         We make sure that the certificate we downloaded is valid by looking it up
    ///         on an OCSP server or a CRL
    /// 
    /// </summary>
    public class Preparation {

        public IRaspRequest PrepareRequest(OiosiMessage message, UddiType uddiType) {

            // First we need to find out what type of object we are sending
            DocumentTypeConfigSearcher typeSearcher = new DocumentTypeConfigSearcher();
            DocumentTypeConfig docTypeConfig = typeSearcher.FindUniqueDocumentType(message.MessageXml);

            // 1. Lookup the endpoint address and certificate using UDDI this.Uddi(message, docTypeConfig)
            UddiLookupResponse uddiResponse = new UddiLookupResponse();
            EndpointAddressHttp EndpointAddress = new EndpointAddressHttp(new Uri("http://localhost/RaspNet/TestService.svc"));
            uddiResponse.EndpointAddress = EndpointAddress;
            
            // 2. Download the server certificate using LDAP
            //X509Certificate2 serverCert = this.Ldap(uddiResponse.CertificateSubjectSerialNumber);

            // 3. Check the validity status of the certificate using OCSP
            //this.Revocation(serverCert);


            // 4. Let the user configure the client certificate
            Console.WriteLine("\nPlease configure the certificate used for sending\n----------------------------------------------------");
            X509Certificate2 clientCert = this.GetCertificate(uddiType);
            X509Certificate2 serverCert = clientCert;
            Console.WriteLine($"configure {clientCert}");

            Credentials credentials = new Credentials(new OcesX509Certificate(clientCert), new OcesX509Certificate(serverCert));

            // Create request
            RaspRequest raspRequest = new RaspRequest(new Request(uddiResponse.EndpointAddress.GetAsUri(), credentials));


            return raspRequest;
        }

        #region 1 - UDDI
        
        //static IUddiLookupClient uddiClient;


        private UddiLookupResponse Uddi(OiosiMessage message, DocumentTypeConfig docTypeConfig) {
            
            // Create a uddi client
            RegistryLookupClientFactory uddiClientFactory = new RegistryLookupClientFactory();
            IUddiLookupClient uddiClient = uddiClientFactory.CreateUddiLookupClient();

            // Get the UDDI parameters with which to call the UDDI server
            LookupParameters parameters = this.GetUddiParameters(message, docTypeConfig);

            // Perform the actual UDDI lookup
            UddiLookupResponse uddiResponse = this.PerformUddiLookup(parameters, uddiClient);
            EndpointAddressHttp EndpointAddress = new EndpointAddressHttp(new Uri("http://localhost/RaspNet/TestService.svc"));
            uddiResponse.EndpointAddress = EndpointAddress;
            // Print out info
            Console.Write("\n  1. Got UDDI reply\n       ");
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.WriteLine(uddiResponse.EndpointAddress.GetKeyAsString());
            Console.ForegroundColor = ConsoleColor.White;

            return uddiResponse;
        }


        private LookupParameters GetUddiParameters(OiosiMessage message, DocumentTypeConfig docTypeConfig) {

            // Use an OIOSI utility to find the endpoint type in the XML document to be sent
            string endpointKeyTypeCode = Utilities.GetEndpointKeyTypeCode(message, docTypeConfig);

            // Use the XPath expression from the UBL type configuration (found in the RaspConfiguration.xml file) 
            // to find the endpoint identifier in the XML document to be sent
            dk.gov.oiosi.addressing.Identifier endpointKey = Utilities.GetEndpointKeyByXpath(
                message.MessageXml,
                docTypeConfig.EndpointType.Key.XPath,
                docTypeConfig.Namespaces,
                endpointKeyTypeCode
            );

            // Find the UDDI identifier for the service contract used by the remote endpoint
            UddiId serviceContractTModel;
            try {
                serviceContractTModel = IdentifierUtility.GetUddiIDFromString(docTypeConfig.ServiceContractTModel);
            }
            catch (Exception) {
                throw new Exception("Could not find the service contract TModel for the UDDI lookup");
            }


            LookupParameters uddiLookupParameters = new LookupParameters(
                endpointKey,
                serviceContractTModel,
                new List<EndpointAddressTypeCode>() {EndpointAddressTypeCode.http});
            
            
            return uddiLookupParameters;
        }


        private UddiLookupResponse PerformUddiLookup(LookupParameters uddiLookupParameters, IUddiLookupClient uddiClient)
        {
            UddiLookupResponse selectedUddiResponse = null;

            // Do the actual UDDI call
            List<UddiLookupResponse> uddiResponses = uddiClient.Lookup(uddiLookupParameters);

            // Pick the first response gotten
            if (uddiResponses.Count == 0)
            {
                // No endpoint found in the uddi(s).
                throw new Exception("Endpoint does not exixt. " + uddiLookupParameters.Identifier.KeyTypeCode.ToString()+ ": " + uddiLookupParameters.Identifier + ". ");

            }
            else if (uddiResponses.Count == 1)
            {
                selectedUddiResponse = uddiResponses[0];
                // Make sure the UDDI call returned the reference to a certificate and an endpoint address
                if (selectedUddiResponse.CertificateSubjectSerialNumber == null)
                {
                    throw new Exception("The UDDI call didn't return a certificate serial number");
                }
                if (selectedUddiResponse.EndpointAddress == null)
                {
                    throw new Exception("The UDDI call didn't return any endpoint");
                }
            }
            else
            {
                // more the one - not good
                Console.WriteLine("To many endpoints found (" + uddiResponses.Count + "), for " + uddiLookupParameters.Identifier.KeyTypeCode.ToString() + ": " + uddiLookupParameters.Identifier + ". Using the first one.");
                selectedUddiResponse = uddiResponses[0];
                // Make sure the UDDI call returned the reference to a certificate and an endpoint address
                if (selectedUddiResponse.CertificateSubjectSerialNumber == null)
                {
                    throw new Exception("The UDDI call didn't return a certificate serial number");
                }
                if (selectedUddiResponse.EndpointAddress == null)
                {
                    throw new Exception("The UDDI call didn't return any endpoint");
                }
            }

            return selectedUddiResponse;
        }

        
        #endregion

        #region 2 - LDAP
        private X509Certificate2 Ldap(CertificateSubject certSubject) {
            
            // Create the LDAP client
            LdapLookupFactory ldapClientFactory = new LdapLookupFactory();
            ICertificateLookup ldapClient = ldapClientFactory.CreateLdapLookupClient();

            // Lookup the certificate using LDAP
            X509Certificate2 certificate = ldapClient.GetCertificate(certSubject);

            // Print out info
            Console.Write("  2. Downloaded certificate with LDAP\n       ");
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.WriteLine(certificate.Subject);
            Console.ForegroundColor = ConsoleColor.White;

            return certificate;

        }
        #endregion

        #region 3 - Revocation
        private void Revocation(X509Certificate2 certificate) {
            
            // Create the OCSP client
            RevocationLookupFactory revocationLookupFactory = new RevocationLookupFactory();
            IRevocationLookup revocationClient = revocationLookupFactory.CreateRevocationLookupClient();

            // Check the validity status of the certificate using OCSP
            RevocationResponse revocationResponse = revocationClient.CheckCertificate(certificate);

            // Print out info
            Console.Write("  3. Certificate status returned by RevocationLookup.\n       Is valid: ");
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.WriteLine(revocationResponse.IsValid.ToString());
            Console.ForegroundColor = ConsoleColor.White;

            // Make sure the cert was valid
            if (!revocationResponse.IsValid)
                throw new Exception("The certificate returned by RevocationLookup was not valid");
        }
        #endregion

        #region 4 - Certificate
        public X509Certificate2 GetCertificate(UddiType UddiType)
        {
            //Console.Write("Serial number: 45 a2 f4 a1");
            //string serial = "45 a2 f4 a1";
            // Test certificate - Must be importet into windows key store

            /*
             * Certificat - Virksomhedscertificat
             * Issued To      Christian Pedersen
             * Issued by      TDC OCES Systemtest CA II
             * Valid From     26-05-2010
             * Valid To       26-05-2012
             * Serial number  40 37 86 cc
             * StoreName      My
             * StoreLocation  CurrentUser
             * 
             * can not be used - is not a funktionscertificat
             */

            /*
            * Certificat 
            * Issued To      Testendpoint (funktionscertifikat)
            * Issued by      TDC OCES Systemtest CA II
            * Valid From     17-04-2008
            * Valid To       17-04-2010
            * Serial number  40 36 d8 5e
            * StoreName      My
            * StoreLocation  CurrentUser
            * 
            *  Can not be used - Is a funktionscertificat, but it has expired
            */

            /* 
            * Certificat 
            * Issued To      FOCES1 (funktionscertifikat)
            * Issued by      TDC OCES Systemtest CA II
            * Valid From     16-10-2011
            * Valid To       16-10-2009
            * Serial number  40 37 60 8e
            * StoreName      My
            * StoreLocation  CurrentUser
            * 
            *  Installed from https://www.certifikat.dk/export/sites/dk.certifikat.oc/da/developer/eksempler/
            */

            /*
           * Certificat 
           * Issued To      TU GENEREL FOCES gyldig (funktionscertifikat)
           * Issued by      TRUST2408 Systemtest VIII CA
           * Valid From     26-10-2011
           * Valid To       26-10-2015
           * Serial number  4c 05 5a 37
           * StoreName      My
           * StoreLocation  CurrentUser
           * 
           *  Installed from http://view.svn.softwareborsen.dk/cgi-bin/index.cgi/openebusiness/dk.gov.oiosi/common/resources/Certificates/
           */

            X509Certificate2 clientCert = null;
            string serial = null;

            // You can define the default certificate to use here:
            switch (UddiType)
            {
                case UddiType.Production:
                    {
                        serial = "5f9b2eb2"; // 
                        
                        break;
                    }
                case UddiType.Test:
                    {
                        //serial = "40 37 fb 49";
                        serial = "4c 05 5a 37"; //
                        break;
                    }
                default:
                    {
                        throw new NotImplementedException("The uddi type '" + UddiType.ToString() + "' is unknown.");
                    }
            }

            StoreName storeName = StoreName.My;
            StoreLocation storeLocation = StoreLocation.LocalMachine; //currentuser
            string storeNameString = string.Empty;
            int storeNameInt;
            string storeLocationString = string.Empty;
            int storeLocationInt;
            string certificateString = string.Empty;
            int certificateInt;
            X509Store certStore;
            //bool selectAgain = false;
            bool selectNewStore = false;
            while (clientCert == null)
            {
                Console.Write("Store ");
                Console.ForegroundColor = ConsoleColor.Gray;
                Console.Write("[" + StoreName.My + "/" + StoreName.Root + "/" + StoreName.AddressBook + "/" + StoreName.CertificateAuthority + "]: ");
                Console.ForegroundColor = ConsoleColor.White;
                Console.WriteLine(storeName.ToString());

                Console.Write("Store Location ");
                Console.ForegroundColor = ConsoleColor.Gray;
                Console.Write("[" + StoreLocation.CurrentUser + "/" + StoreLocation.LocalMachine + "]: ");
                Console.ForegroundColor = ConsoleColor.White;
                Console.WriteLine(storeLocation.ToString());

                if (selectNewStore == false)
                {
                    // try to retrive the certificate

                    Console.WriteLine("Serial number: " + serial);

                    certStore = new X509Store(storeName, storeLocation);
                    certStore.Open(OpenFlags.ReadOnly);

                    X509Certificate2Collection collection = certStore.Certificates.Find(X509FindType.FindBySerialNumber, serial, true);
                    certStore.Close();
                    clientCert = null;

                    if (collection.Count > 0)
                    {
                        clientCert = collection[0];
                    }
                }
                
                if ( clientCert == null)
                {
                    // the certificate not found
                    //Console.WriteLine("Certificate not found, type in new serial number: ");
                    //serial = Console.ReadLine();

                    // store name
                    do
                    {
                        Console.WriteLine();
                        Console.WriteLine("Select StoreName (type the index/int):");
                        Console.WriteLine("1 - StoreName.My");
                        Console.WriteLine("2 - StoreName.Root");
                        Console.WriteLine("3 - StoreName.AddressBook");
                        Console.WriteLine("4 - StoreName.CertificateAuthority");
                        storeNameString = Console.ReadLine();
                        if (int.TryParse(storeNameString, out storeNameInt))
                        {
                            switch (storeNameInt)
                            {
                                case 1:
                                    {
                                        storeName = StoreName.My;
                                        break;
                                    }
                                case 2:
                                    {
                                        storeName = StoreName.Root;
                                        break;
                                    }
                                case 3:
                                    {
                                        storeName = StoreName.AddressBook;
                                        break;
                                    }
                                case 4:
                                    {
                                        storeName = StoreName.CertificateAuthority;
                                        break;
                                    }
                                default:
                                    {
                                        Console.WriteLine("Not in range.");
                                        storeNameString = string.Empty;
                                        break;
                                    }
                            }
                        }
                        else
                        {
                            Console.WriteLine("Not a int!!!");
                            storeNameString = string.Empty;
                        }
                    }
                    while (string.IsNullOrEmpty(storeNameString));

                    // StoreLocation
                    do
                    {
                        Console.WriteLine();
                        Console.WriteLine("Select StoreLocation (type the index/int):");
                        Console.WriteLine("1 - StoreName.CurrentUser");
                        Console.WriteLine("2 - StoreName.LocalMachine");
                        storeLocationString = Console.ReadLine();
                        if (int.TryParse(storeLocationString, out storeLocationInt))
                        {
                            switch (storeLocationInt)
                            {
                                case 1:
                                    {
                                        storeLocation = StoreLocation.CurrentUser;
                                        break;
                                    }
                                case 2:
                                    {
                                        storeLocation = StoreLocation.LocalMachine;
                                        break;
                                    }
                                default:
                                    {
                                        Console.WriteLine("Not in range.");
                                        storeLocationString = string.Empty;
                                        break;
                                    }
                            }
                        }
                        else
                        {
                            Console.WriteLine("Not a int!!!");
                            storeLocationString = string.Empty;
                        }

                    }
                    while (string.IsNullOrEmpty(storeLocationString));

                    // StoreLocation

                    do
                    {
                        serial = string.Empty;
                        Console.WriteLine();
                        Console.WriteLine("Select certificate (type the index/int) (0 for new certificate location):");
                        Console.WriteLine("Index - Serial number - ExpireDate");
                        certStore = new X509Store(storeName, storeLocation);
                        certStore.Open(OpenFlags.ReadOnly);
                        X509Certificate2Enumerator x509Certificate2Enumerator = certStore.Certificates.GetEnumerator();

                        int index = 1;
                        X509Certificate x509Certificate;
                        IDictionary<int, X509Certificate> map = new Dictionary<int, X509Certificate>();
                        //int subjectMax = 45;
                        while (x509Certificate2Enumerator.MoveNext())
                        {
                            x509Certificate = x509Certificate2Enumerator.Current;
                            map.Add(index, x509Certificate);
                            Console.ForegroundColor = ConsoleColor.Yellow;
                            Console.Write(" " + index + " - ");
                            //Console.ForegroundColor = ConsoleColor.Gray;
                            Console.Write(x509Certificate.GetSerialNumberString() + " - ");
                            Console.WriteLine(x509Certificate.GetExpirationDateString());
                            Console.ForegroundColor = ConsoleColor.White;
                            //if (x509Certificate.Subject.Length <= subjectMax)
                            //{
                            Console.WriteLine(x509Certificate.Subject);
                            /*}
                            else
                            {
                                Console.WriteLine(x509Certificate.Subject.Substring(0, subjectMax));
                            }*/

                            index++;
                        }
                        certStore.Close();
                        if (index == 1)
                        {
                            Console.WriteLine("No certificate a selected location");
                            //serial = "No certificate a selected location";
                            selectNewStore = true;
                        }
                        else
                        {
                            certificateString = Console.ReadLine();

                            if (int.TryParse(certificateString, out certificateInt))
                            {
                                if (certificateInt == 0)
                                {
                                    serial = "try Again - certificate not found";
                                    selectNewStore = true;
                                }
                                else if (map.ContainsKey(certificateInt))
                                {
                                    serial = map[certificateInt].GetSerialNumberString();
                                    selectNewStore = false;
                                }
                                else
                                {
                                    Console.WriteLine("Index out of range.");
                                }
                            }
                            else
                            {
                                Console.WriteLine("Not a int!!!");
                            }
                        }
                    }
                    while (!selectNewStore && string.IsNullOrEmpty(serial));
                }
            }

            Console.WriteLine("Expire: " + clientCert.GetExpirationDateString());

            return clientCert;
        }

        #endregion
    }
}
