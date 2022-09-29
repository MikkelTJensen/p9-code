import socket
import threading


HOST = "127.0.0.1"
PORT = 65432


def on_new_client(conn, addr):
	with conn:
		status = None
		while True:
			data = conn.recv(1024)
			if data:
				conn.sendall(data)
				break


def main():
	with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
		s.bind((HOST, PORT))
		s.listen(10)
		while True:
			conn, addr = s.accept()
			new_thread = threading.Thread(target=on_new_client, args=(conn, addr))
			new_thread.start()


if __name__ == "__main__":
	main()
