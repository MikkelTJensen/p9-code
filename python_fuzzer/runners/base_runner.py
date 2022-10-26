from typing import Any, Tuple, Callable

from .runner import Runner


class BaseRunner(Runner):
    # TODO: Callable type
    def __init__(self, function) -> None:
        self.function = function
        self.PASS: str = 'PASS'
        self.FAIL: str = 'FAIL'
        self.UNRESOLVED: str = 'UNRESOLVED'

    def run(self, func_inp: Any) -> Tuple[Any, str]:
        pass
