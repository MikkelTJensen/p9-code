class SocketConnection():
	def __init__(self, conn, addr, mb, socket_id):
		self.conn = conn
		self.addr = addr
		self.message_buffer = mb
		self.socket_id = socket_id

	def run(self):
		with self.conn:
			while True:
				# Incoming from sender/receiver
				data = self.conn.recv(1024)
				if data:
					self.handle_message(data)
				# Send message back to sender/receiver (if any in buffer)
				msg = self.message_buffer.check_for_message(self.socket_id)
				if msg:
					self.conn.sendall(msg)

	def handle_message(self, data):
		msg = data.decode()
		self.message_buffer.store_message(msg, self.socket_id)
