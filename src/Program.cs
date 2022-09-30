namespace P9Fuzzing{
    public class Program {
        public static int Main(string[] args) {

            string client_type = args[0];
            
            if (client_type == "sender") {
                EchoClient.StartClient("SENDER");
            } else if (client_type == "receiver") {
                EchoClient.StartClient("RECEIVER");
            }
            else {
                Console.WriteLine("Did not detect sender or receiver. Shutting down.");
            }
            return 0;
        }
    }
}
