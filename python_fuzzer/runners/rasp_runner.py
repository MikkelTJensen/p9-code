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
        process = run(["dk.gov.oiosi.samples.ClientExample.exe"],
                shell=True,
                cwd=self.path,
                timeout=20,
                input=b"1\n2\n4",
                capture_output=True)
        if process.returncode != 0:
            logger.log_crash(process.stderr)


if __name__ == '__main__':
    cwd = getcwd()
    # Get path to the folder of the ClientExample
    clientfolder = "C:\\Users\\emilf\\Documents\\repos\\Release"
    logger: SimpleLogger = SimpleLogger(cwd)
    runner: RaspRunner = RaspRunner(logger, clientfolder)

    # Test that python does not crashes
    for _ in range(3):
        runner.start_process()
