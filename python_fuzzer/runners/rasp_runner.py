from typing import Any, Tuple, Callable
from subprocess import run
from os import getcwd
from os.path import join

import scapy.packet
from scapy import sendrecv
from scapy.packet import Packet
from scapy.all import rdpcap
from scapy import *

if __name__ == "__main__":
    from runner import Runner
else:
    from .runner import Runner

import sys
sys.path.append("..")
from loggers import SimpleLogger


class RaspRunner(Runner):
    def __init__(self, log: SimpleLogger, path: str) -> None:
        # TODO: make a function which can send a scapy packet and replace it with "None" below
        function: Callable[..., Any] = lambda x: x
        self.PASS: str = 'PASS'
        self.FAIL: str = 'FAIL'
        self.UNRESOLVED: str = 'UNRESOLVED'
        self.logger = log
        self.path = path

    def run(self, func_inp: Any) -> Tuple[Any, str]:
        result = self.send_packet(func_inp)
        return (func_inp, result)

    def send_packet(self, p: Packet) -> None:
        answer, unanswered = sendrecv.sr(p)
        if answer != None:
            print(answer[0])
            print(answer[1])
            return self.PASS
        elif unanswered != None:
            print(unanswered[0])
            print(unanswered[1])
            return self.FAIL
        else:
            return self.UNRESOLVED

    def start_process(self):
        # Input is the options chosen in the Client
        process = run(["dk.gov.oiosi.samples.ClientExample.exe"],
                      shell=True,
                      cwd=self.path,
                      timeout=20,
                      capture_output=True)

        if process.returncode != 0:
            print(process.stderr)
            self.logger.log_crash(process.stderr)


if __name__ == '__main__':
    cwd_path = getcwd()
    # Get path to the folder of the ClientExample
    process_path: str = join(cwd_path, "..", "executables", "ClientExample")
    logger: SimpleLogger = SimpleLogger(cwd_path)
    runner: RaspRunner = RaspRunner(logger, process_path)

    # Test sending Post packates
    pcap_path: str = join(cwd_path, "..", "packets", "post_request_respond.pcapng")
    pcap = rdpcap(pcap_path)
    runner.send_packet(pcap)

    # Test that python does not crash
    for _ in range(3):
        print(_)
        runner.start_process()
