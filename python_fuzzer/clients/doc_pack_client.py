import socket
from typing import Any

from .client import Client


class DocumentPacketClient(Client):
    def __init__(self, host: str, port: int) -> None:
        self.HOST: str = host
        self.PORT: int = port
        self.PASS: str = 'MESSAGE PASS'
        self.FAIL: str = 'MESSAGE FAIL'
        self.UNRESOLVED: str = 'MESSAGE UNRESOLVED'

    # TODO: Consider more elaborate "output"?
    def send_message(self, doc_pack: Any) -> str:
        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.connect((self.HOST, self.PORT))
                # TODO: make sure document package is converted to bytes type and send it below
                s.sendall(b"Hello, world<EOF>")
            outcome: str = self.PASS
        except Exception:
            outcome: str = self.FAIL

        return outcome
