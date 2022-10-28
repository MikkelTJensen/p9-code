from typing import Any, Tuple, Callable
from subprocess import run, PIPE
from os import getcwd
from os.path import join

if __name__ == "__main__":
    from base_runner import BaseRunner
else:
    from .base_runner import BaseRunner

from python_fuzzer.loggers.simple_logger import SimpleLogger
from python_fuzzer.loggers.logger import Logger

def terminated_read(fd, terminators):
    buf = []
    while True:
        r = fd.read(1).decode()
        buf += r
        if r in terminators:
            break
    return ''.join(buf)


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
        # Input is the options chosen in the Client
        p = run(["powershell", "-Command", "dk.gov.oiosi.samples.ClientExample.exe"],
                cwd=self.path,
                timeout=20,
                input=b"1\n2\n4")



if __name__ == '__main__':
    cwd = getcwd()
    # Get path to the folder of the ClientExample
    cwd = join(cwd, "..", "..", "..", "Release")
    logger: SimpleLogger = SimpleLogger(cwd)
    runner: RaspRunner = RaspRunner(logger, cwd)

    runner.start_process()
