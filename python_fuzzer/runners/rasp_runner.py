from typing import Any, Tuple, Callable

from .base_runner import BaseRunner


class RaspRunner(BaseRunner):
    def __init__(self) -> None:
        # TODO: make a function which can send a scapy packet and replace it with "None" below
        function: Callable[..., Any] = lambda x: x
        super().__init__(function)

    def run(self, func_inp: Any) -> Tuple[Any, str]:
        pass

    def start_process(self):
        pass
