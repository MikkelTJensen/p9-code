import thread
import socket


HOST = "127.0.0.1"
PORT = 65432


def on_new_client(conn, addr):
	with conn:
		status = None
		while True:
			data = conn.recv(1024)
			if data:
				msg = f"{data!r}"


def main():
	with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
		s.bind((HOST, PORT))
		s.listen(10)
		while True:
			conn, addr = s.accept()
			thread.start_new_thread(on_new_client, (conn, addr))


if __name__ == "__main__":
	main()
