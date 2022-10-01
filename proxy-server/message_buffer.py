from typing import List, Tuple

class MessageBuffer():
	def __init__(self) -> None:
		"""
		Stores messages until a it is sent to a client.
		Also logs when a message is received.
		"""
		self._buffer: list[tuple(str, int)] = []

	def _log_message(self, msg: str, socket_id: int) -> None:
		"""
		Logs the message (TODO: Implement)
		"""
		print(f"{socket_id}: " + msg)

	def store_message(self, msg: str, socket_id: int) -> None:
		"""
		Append a message to the message buffer and log it
		"""
		self._buffer.append((msg, socket_id))
		self._log_message(msg, socket_id)

	def pop_message(self, socket_id: int) -> bytes:
		"""
		Enumerate the buffer and return the first message found NOT sent from the current client
		:return: string message encoded to bytes
		"""
		index: int = -1
		for i, msg in enumerate(self._buffer):
			if msg[1] is not socket_id:
				index = i
				break
		if index > -1:
			element: Tuple[str, int] = self._buffer.pop(index)
			data_msg: bytes = str.encode(element[0])
			return data_msg
		return None
