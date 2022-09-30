class MessageBuffer():
	def __init__(self):
		self._buffer = []

	def _log_message(self, msg, socket_id):
		print(f"{socket_id}: " + msg)

	def store_message(self, msg, socket_id):
		self._buffer.append((msg, socket_id))
		self._log_message(msg, socket_id)

	def pop_message(self, socket_id):
		index = -1

		for i, msg in enumerate(self._buffer):
			if msg[1] is not socket_id:
				index = i
				break

		if index > -1:
			element = self._buffer.pop(index) 
			return str.encode(element[0])

		return None
