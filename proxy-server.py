import socket
import threading


HOST = "127.0.0.1"
PORT = 65432


class Server():
	def __init__():
		pass


class SocketConnection():
	def __init__(self, conn, addr):
		self.conn = conn
		self.addr = addr
		self.conn_type = None

	def run(self):
		with self.conn:
			while True:
				data = self.conn.recv(1024)
				if data and not self.handleMessage(data):
					break

	def handleMessage(self, data):
		msg = f"{data!r}"
		print(msg)
		self.conn.sendall(data)
		return False


def on_new_client(conn, addr):
	socket_connection = SocketConnection(conn, addr)
	socket_connection.run()
	

def main():
	with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
		s.bind((HOST, PORT))
		s.listen(2)
		while True:
			conn, addr = s.accept()
			new_thread = threading.Thread(target=on_new_client, args=(conn, addr))
			new_thread.start()


if __name__ == "__main__":
	main()
