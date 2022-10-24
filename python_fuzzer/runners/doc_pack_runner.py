from typing import Any, Tuple, Callable

from .runner import Runner
from python_fuzzer.clients.client import Client


class DocumentPacketRunner(Runner):
    def __init__(self, client: Client) -> None:
        self.client = client
        self.function: Callable[[Any], str] = client.send_message
        self.PASS: str = 'PASS'
        self.FAIL: str = 'FAIL'
        self.UNRESOLVED: str = 'UNRESOLVED'

    def run(self, func_inp: Any) -> Tuple[Any, str]:
        try:
            result: Any = self.function(func_inp)
            outcome: str = self.PASS
        except Exception:
            result: Any = None
            outcome: str = self.FAIL

        return result, outcome
