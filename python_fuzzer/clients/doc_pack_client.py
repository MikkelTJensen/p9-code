import socket
from typing import Any
from platform import system

from .client import Client


class DocumentPacketClient(Client):
    def __init__(self, host: str, port: int) -> None:
        self.platform = system()
        self.HOST: str = host
        self.PORT: int = port
        self.PORTS = [num for num in range(self.PORT - 100, self.PORT + 100)]
        self.PASS: str = 'MESSAGE PASS'
        self.FAIL: str = 'MESSAGE FAIL'
        self.UNRESOLVED: str = 'MESSAGE UNRESOLVED'

    def send_message(self, doc_pack: Any) -> str:
        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.connect((self.HOST, self.PORT))
                s.sendall(b"Hello World<EOF>")
                data = s.recv(1024)
                print(data.decode())

            outcome = self.PASS

        except Exception:
            outcome: str = self.FAIL

        return outcome
