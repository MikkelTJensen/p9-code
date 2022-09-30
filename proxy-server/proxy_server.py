import socket
import threading


from socket_connection import SocketConnection
from message_buffer import MessageBuffer


class ProxyServer():
	def __init__(self, HOST, PORT):
		self.HOST = HOST
		self.PORT = PORT
		self.MAX_CONNECTIONS = 2
		self.message_buffer = MessageBuffer()
		self.current_id = 0

	def on_new_client(self, conn, addr):
		self.current_id += 1
		socket_connection = SocketConnection(conn, addr, self.message_buffer, self.current_id)
		socket_connection.run()	

	def run(self):
		with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
			s.bind((self.HOST, self.PORT))
			s.listen(self.MAX_CONNECTIONS)
			while True:
				conn, addr = s.accept()
				new_thread = threading.Thread(target=self.on_new_client, args=(conn, addr))
				new_thread.start()
