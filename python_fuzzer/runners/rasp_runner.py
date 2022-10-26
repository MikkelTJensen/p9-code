from asyncio import subprocess
from typing import Any, Tuple, Callable
from subprocess import run

from .base_runner import BaseRunner
from python_fuzzer.loggers.logger import Logger


class RaspRunner(BaseRunner):
    def __init__(self, log: Logger, path: str) -> None:
        # TODO: make a function which can send a scapy packet and replace it with "None" below
        function: Callable[..., Any] = lambda x: x
        super().__init__(function)
        self.logger = log
        self.path = path

    def run(self, func_inp: Any) -> Tuple[Any, str]:
        pass

    def start_process(self):
        run([])
