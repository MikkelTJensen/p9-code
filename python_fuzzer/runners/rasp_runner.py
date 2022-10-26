from typing import Any, Tuple, Callable

from .runner import Runner


class RaspRunner(Runner):
    def __init__(self, function) -> None:
        super().__init__(function)

    def run(self, func_inp: Any) -> Tuple[Any, str]:
        pass
