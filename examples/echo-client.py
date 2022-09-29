import socket

# Localhost
HOST = "127.0.0.1"
# Port to listen on (non-privileged ports are > 1023)  
PORT = 65432

# AF_INET specifies address family for IPv4
# SOCK_STREAM is for TCP
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    # Connect to the End Point
    s.connect((HOST, PORT))
    # Send message to the End Point
    # b turns the string to a byte size object
    s.sendall(b"Hello, world<EOF>")
    # Receive message back
    data = s.recv(1024)

# !r calls the __repr__ of the bytes object, turning it into a string object
print(f"Received {data!r}")
