from runner import Runner

from typing import Any, Tuple, Callable


class DocumentPackageRunner(Runner):
    def __init__(self, client) -> None:
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
