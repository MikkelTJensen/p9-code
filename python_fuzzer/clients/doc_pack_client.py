from scapy.all import sr
from typing import Any
from platform import system

from .client import Client


class DocumentPacketClient(Client):
    def __init__(self, host: str, port: int) -> None:
        self.platform = system()
        self.HOST: str = host
        self.PORT: int = port
        self.PASS: str = 'MESSAGE PASS'
        self.FAIL: str = 'MESSAGE FAIL'
        self.UNRESOLVED: str = 'MESSAGE UNRESOLVED'

    def send_message(self, doc_pack: Any) -> str:
        try:
            result = None

            if self.platform == "Linux":
                result = sr(doc_pack, iface="eth0")
            elif self.platform == "Windows":
                result = sr(doc_pack, iface="eth0")
            elif self.platform == "Darwin":
                result = sr(doc_pack, iface="eth0")

            outcome = self.PASS

        except Exception:
            outcome: str = self.FAIL

        return outcome
