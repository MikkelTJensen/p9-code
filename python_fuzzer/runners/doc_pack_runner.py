from typing import Any, Tuple, Callable

from .base_runner import BaseRunner
from python_fuzzer.clients.client import Client


class DocumentPacketRunner(BaseRunner):
    def __init__(self, client: Client) -> None:
        super().__init__(client.send_message)
        self.client = client

    def run(self, func_inp: Any) -> Tuple[Any, str]:
        try:
            result: Any = self.function(func_inp)
            outcome: str = self.PASS
        except Exception:
            result: Any = None
            outcome: str = self.FAIL

        return result, outcome
