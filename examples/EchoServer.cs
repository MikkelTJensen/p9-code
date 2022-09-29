using System;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace P9Fuzzing {
    public class EchoServer {
        public static void StartServer() {
            // Connect to a remote server - here we select localhost
            IPHostEntry host = Dns.GetHostEntry("localhost");

            // Host can have multiple addresses, so a list is returned
            // Here we choose index 1, as this is IPv4, which is what python uses
            IPAddress ipAddress = host.AddressList[1];

            // Create EndPoint at local host - make sure port is the same in Python (65432)
            IPEndPoint localEndPoint = new IPEndPoint(ipAddress, 65432);

            try {
                // Create a Socket using the TCP protocol (so does Python)
                Socket listener = new Socket(ipAddress.AddressFamily, SocketType.Stream, ProtocolType.Tcp);
                // Bind the socket to the EndPoint
                listener.Bind(localEndPoint);
                // Amount of messages the server can listen to, before it sends back busy response
                listener.Listen(10);

                Console.WriteLine("Waiting for a connection...");
                // Accepting returns an object holding the connection to the client
                Socket handler = listener.Accept();

                // For incoming data
                string data = null;
                byte[] bytes = null;

                // Read bytes untill <EOF> is recieved
                while (true) {
                    bytes = new byte[1024];
                    int bytesRec = handler.Receive(bytes);
                    data += Encoding.ASCII.GetString(bytes, 0, bytesRec);
                    if (data.IndexOf("<EOF>") > -1) {
                        break;
                    }
                }

                Console.WriteLine("Text received : {0}", data);

                // Echo message back to client
                byte[] msg = Encoding.ASCII.GetBytes(data);
                handler.Send(msg);

                // Close down
                handler.Shutdown(SocketShutdown.Both);
                handler.Close();

            }
            catch (Exception e) {
                Console.WriteLine(e.ToString());
            }
            Console.WriteLine("\n Press any key to continue...");
            Console.ReadKey();
        }
    }
}