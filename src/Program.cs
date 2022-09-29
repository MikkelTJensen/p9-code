namespace P9Fuzzing{
    public class Program {
        public static int Main(string[] args) {

            string client_type = args[0];
            
            if (client_type == "sender") {
                Console.WriteLine("Sender!");
            } else if (client_type == "receiver") {
                Console.WriteLine("Receiver!");
            }
            else {
                Console.WriteLine("Did not detect sender or receiver. Shutting down.");
            }
            return 0;
        }
    }
}