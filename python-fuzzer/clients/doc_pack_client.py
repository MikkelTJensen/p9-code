from client import Client

import socket
from typing import Any


class DocumentPackageClient(Client):
    def __init__(self, host: str, port: int) -> None:
        self.HOST: str = host
        self.PORT: int = port

    def send_message(self, doc_pack: Any) -> None:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((self.HOST, self.PORT))
            # TODO: make sure document package is converted to bytes type and send it
            s.sendall(b"Hello, world<EOF>")
