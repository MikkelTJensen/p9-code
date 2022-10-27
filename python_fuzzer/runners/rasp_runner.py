from asyncio import subprocess
from typing import Any, Tuple, Callable
from subprocess import run
from os import getcwd
from os.path import join

if __name__ == "__main__":
    from base_runner import BaseRunner
else:
    from .base_runner import BaseRunner

from python_fuzzer.loggers.simple_logger import SimpleLogger
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
        run([self.path])

if __name__ == '__main__':
    cwd = getcwd()
    logger : SimpleLogger = SimpleLogger(cwd)
    clientsample = join(cwd, "..", "..", "..", "Release", "dk.gov.oiosi.samples.ClientExample.exe")
    print(clientsample)
    runner:RaspRunner = RaspRunner(logger, clientsample)
    
    
    runner.start_process()
