import socket

class SocketConnection():
	def __init__(self, conn, addr, mb, socket_id):
		self.conn = conn
		self.addr = addr
		self._message_buffer = mb
		self.socket_id = socket_id

	def run(self):
		with self.conn:
			while True:
				inc = self._handle_incoming()
				out = self._handle_outgoing()
				# for future stuff - if socket should be closed
				if inc or out:
					break	

	def _handle_incoming(self):
		# Timeout since recv() just waits for messages
		try:
			self.conn.settimeout(2.0)
			# Check for incoming message from the client
			data = self.conn.recv(1024)
			# Store if anything is received
			if data:
				msg = data.decode()
				self._message_buffer.store_message(msg, self.socket_id)
				return False
		except socket.timeout:
			return False
		return True
		

	def _handle_outgoing(self):
		# Check if a socket/client has a pending message - if so, its popped and return
		msg = self._message_buffer.pop_message(self.socket_id)
		# Send it to the socket/client
		if msg:
			self.conn.sendall(msg)
		return False
