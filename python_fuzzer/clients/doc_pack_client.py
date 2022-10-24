from scapy.all import send
from typing import Any

from .client import Client


class DocumentPacketClient(Client):
    def __init__(self, host: str, port: int) -> None:
        self.HOST: str = host
        self.PORT: int = port
        self.PASS: str = 'MESSAGE PASS'
        self.FAIL: str = 'MESSAGE FAIL'
        self.UNRESOLVED: str = 'MESSAGE UNRESOLVED'

    def send_message(self, doc_pack: Any) -> str:
        try:
            send(doc_pack)
            outcome = self.PASS
        except Exception as e:
            print(e)
            outcome: str = self.FAIL

        return outcome
