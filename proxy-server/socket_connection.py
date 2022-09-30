class SocketConnection():
	def __init__(self, conn, addr, mb, socket_id):
		self.conn = conn
		self.addr = addr
		self.message_buffer = mb
		self.socket_id = socket_id

	def run(self):
		with self.conn:
			while True:
				inc = self.handle_incoming()
				out = self.handle_outgoing()
				if inc or out:
					break	

	def handle_incoming(self):
		try:
			self.conn.settimeout(2.0)
			data = self.conn.recv(1024)
			if data:
				msg = data.decode()
				self.message_buffer.store_message(msg, self.socket_id)
		except:
			pass
		return False

	def handle_outgoing(self):
		msg = self.message_buffer.check_for_message(self.socket_id)
		if msg:
			self.conn.sendall(msg)
		return False
