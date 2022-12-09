from typing import Any, Tuple, Callable
from subprocess import run
from os import getcwd
from os.path import join

if __name__ == "__main__":
    from runner import Runner
else:
    from .runner import Runner

from python_fuzzer.loggers.simple_logger import SimpleLogger
from python_fuzzer.loggers.logger import Logger

class RaspRunner(Runner):
    def __init__(self, log: Logger, path: str) -> None:
        # TODO: make a function which can send a scapy packet and replace it with "None" below
        function: Callable[..., Any] = lambda x: x
        self.PASS: str = 'PASS'
        self.FAIL: str = 'FAIL'
        self.UNRESOLVED: str = 'UNRESOLVED'
        self.logger = log
        self.path = path

    def run(self, func_inp: Any) -> Tuple[Any, str]:
        pass

    def start_process(self):
        # Input is the options chosen in the Client
        input_choices = str.encode("1\n2\n" + str(CERT_INDEX))
        process = run(["dk.gov.oiosi.samples.ClientExample.exe"],
                shell=True,
                cwd=self.path,
                timeout=20,
                input=input_choices,
                capture_output=True)
        if process.returncode != 0:
            self.logger.log_crash(process.stderr)

if __name__ == '__main__':
    cwd_path = getcwd()
    # Get path to the folder of the ClientExample
    process_path: str = join(cwd_path, "..", "executables", "ClientExample")
    logger: SimpleLogger = SimpleLogger(cwd_path)
    runner: RaspRunner = RaspRunner(logger, process_path)

    # Test that python does not crashes
    for _ in range(3):
        runner.start_process()
