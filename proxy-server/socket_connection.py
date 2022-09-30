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
				if inc or out:
					break	

	def _handle_incoming(self):
		try:
			self.conn.settimeout(2.0)
			data = self.conn.recv(1024)
			if data:
				msg = data.decode()
				self._message_buffer.store_message(msg, self.socket_id)
		except:
			pass
		return False

	def _handle_outgoing(self):
		msg = self._message_buffer.pop_message(self.socket_id)
		if msg:
			self.conn.sendall(msg)
		return False
