from scapy.all import sr1
from scapy.layers.inet import IP, TCP
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
            result = None

            if self.platform == "Linux":
                result = sr1(IP(dst=self.HOST)/TCP(dport=self.PORT), iface="eth0")
            elif self.platform == "Windows":
                result = sr1(IP(dst=self.HOST)/TCP(dport=self.PORT), iface="eth0")
            elif self.platform == "Darwin":
                result = sr1(IP(dst=self.HOST)/TCP(dport=self.PORT), iface="eth0")

            print(result)
            outcome = self.PASS

        except Exception:
            outcome: str = self.FAIL

        return outcome
