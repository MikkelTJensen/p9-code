from typing import Any, Tuple, Callable

from .base_runner import BaseRunner


class RaspRunner(BaseRunner):
    def __init__(self) -> None:
        # TODO: define scapy send function and pass to super as "function"
        super().__init__()

    def run(self, func_inp: Any) -> Tuple[Any, str]:
        pass
