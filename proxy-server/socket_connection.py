import socket
from typing import Tuple

from message_buffer import MessageBuffer

class SocketConnection():
	def __init__(self, conn, addr: Tuple[str, int], mb: MessageBuffer, socket_id: int) -> None:
		"""
		Alternate between receiving and sending messages for the client connected through the socket
		"""
		self.conn = conn
		self.addr: Tuple[str, int] = addr
		self._message_buffer: MessageBuffer = mb
		self.socket_id: int = socket_id

	def run(self) -> None:
		"""
		Alternates between listening for messages and sending messages to the client
		"""
		with self.conn:
			while True:
				inc: bool = self._handle_incoming()
				out: bool = self._handle_outgoing()
				if inc or out:
					break

	def _handle_incoming(self) -> bool:
		"""
		Listen for messages from the client for 2.0 seconds, then timeout - store received message
		:return: True if client has closed the connection, otherwise False
		"""
		try:
			self.conn.settimeout(2.0)
			data: bytes = self.conn.recv(1024)
			if data:
				msg: str = data.decode()
				self._message_buffer.store_message(msg, self.socket_id)
				return False
		except socket.timeout:
			return False
		return True
		

	def _handle_outgoing(self) -> bool:
		"""
		Check if a message is in the buffer for the client - send if there is
		:return: False
		"""
		msg: bytes = self._message_buffer.pop_message(self.socket_id)
		if msg:
			self.conn.sendall(msg)
		return False
