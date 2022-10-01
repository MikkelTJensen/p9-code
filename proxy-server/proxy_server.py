import socket
import  threading
from typing import Tuple

from socket_connection import SocketConnection
from message_buffer import MessageBuffer

class ProxyServer():
	def __init__(self, HOST: str, PORT: int) -> None:
		"""
		Listens for connections at given port and creates new class to handle connections
		"""
		self.HOST: str = HOST
		self.PORT: int = PORT
		self.MAX_CONNECTIONS: int = 2
		self.message_buffer: MessageBuffer = MessageBuffer()
		self.current_id: int = 0

	def _on_new_client(self, conn, addr: Tuple[str, int]) -> None:
		"""
		Create new class for handling an accepted connection
		"""
		self.current_id += 1
		socket_connection: SocketConnection = SocketConnection(conn, addr, self.message_buffer, self.current_id)
		socket_connection.run()

	def run(self) -> None:
		"""
		Listens at given port and starts a new thread whenever a connection is accepted
		"""
		with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
			s.bind((self.HOST, self.PORT))
			s.listen(self.MAX_CONNECTIONS)
			while True:
				conn, addr = s.accept()
				new_thread = threading.Thread(target=self._on_new_client, args=(conn, addr))
				new_thread.start()
