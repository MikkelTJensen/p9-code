import socket

# Localhost
HOST = "127.0.0.1"
# Port to listen on (non-privileged ports are > 1023)  
PORT = 65432

# AF_INET specifies address family for IPv4
# SOCK_STREAM is for TCP
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    # Bind the socket to the EndPoint
    s.bind((HOST, PORT))
    # Amount of messages the server can listen to, before it sends back busy response
    s.listen(10)
    # Accepting returns an object holding the connection to the client
    conn, addr = s.accept()
    with conn:
        print(f"Connected by {addr}")
        while True:
            # Data is a bytes object
            data = conn.recv(1024)
            if not data:
                break
            conn.sendall(data)
