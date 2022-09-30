using System;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace P9Fuzzing {
    public class EchoClient {
        public static void StartClient(string client_type) {
            
            byte[] bytes = new byte[1024];

            try {
                // Connect to a remote server - here we select localhost
                IPHostEntry host = Dns.GetHostEntry("localhost");

                // Host can have multiple addresses, so a list is returned
                // Here we choose index 1, as this is IPv4, which is what python uses
                IPAddress ipAddress = host.AddressList[1];

                // Create EndPoint at local host - make sure port is the same in Python (65432)
                IPEndPoint remoteEP = new IPEndPoint(ipAddress, 65432);

                // Create a Socket using the TCP protocol (so does Python)
                Socket sender = new Socket(ipAddress.AddressFamily, SocketType.Stream, ProtocolType.Tcp);

                try {
                    // Connect to the End Point
                    sender.Connect(remoteEP);
                    Console.WriteLine("Socket connected to {0}", sender.RemoteEndPoint.ToString());
                    
                    // Encode message
                    byte[] msg = Encoding.ASCII.GetBytes("Hello from " + client_type + "!<EOF>");
                    
                    // Send it
                    int bytesSent = sender.Send(msg);

                    // Server echoes it back
                    int bytesRec = sender.Receive(bytes);
                    Console.WriteLine("Server Echo: {0}",Encoding.ASCII.GetString(bytes, 0, bytesRec));

                    // Close down
                    sender.Shutdown(SocketShutdown.Both);
                    sender.Close();

                }
                catch (ArgumentNullException ane) {
                    Console.WriteLine("ArgumentNullException : {0}", ane.ToString());
                }
                catch (SocketException se) {
                    Console.WriteLine("SocketException : {0}", se.ToString());
                }
                catch (Exception e) {
                    Console.WriteLine("Unexpected exception : {0}", e.ToString());
                }
            }
            catch (Exception e) {
                Console.WriteLine(e.ToString());
            }
        }
    }
}
