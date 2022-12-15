from typing import Any, Tuple, Callable
from subprocess import run
from os import getcwd
from os.path import join

from scapy import sendrecv
from scapy.packet import Packet
from scapy.all import rdpcap

if __name__ == "__main__":
    from runner import Runner
else:
    from .runner import Runner

import sys
sys.path.append("..")
from loggers import SimpleLogger


class RaspRunner(Runner):
    def __init__(self, log: SimpleLogger, path: str,verbose: bool) -> None:
        # TODO: make a function which can send a scapy packet and replace it with "None" below
        function: Callable[..., Any] = lambda x: x
        self.PASS: str = 'PASS'
        self.FAIL: str = 'FAIL'
        self.UNRESOLVED: str = 'UNRESOLVED'
        self.logger: SimpleLogger = log
        self.path: str = path
        self.verbose: bool = verbose
        self.interface: str = "Software Loopback Interface 1"
    def run(self, func_inp: Any) -> Tuple[Any, str]:
        result = self.send_packet(func_inp)
        return (func_inp, result)

    def send_packet(self, p: Packet) -> str:
        answer, unanswered = sendrecv.srp(p, iface=self.interface, timeout=20)
        if len(answer) > 0:
            if self.verbose:
                for query in answer:
                    print(query)
            return self.PASS
        elif len(unanswered) > 0:
            return self.UNRESOLVED

    def start_process(self):
        # Input is the options chosen in the Client
        process = run(["dk.gov.oiosi.samples.ClientExample.exe"],
                      shell=True,
                      cwd=self.path,
                      timeout=30,
                      capture_output=True)

        if process.returncode != 0:
            print(process.stderr)
            self.logger.log_crash(process.stderr)


if __name__ == '__main__':
    cwd_path = getcwd()
    # Get path to the folder of the ClientExample
    process_path: str = join(cwd_path, "..", "executables", "ClientExample")
    logger: SimpleLogger = SimpleLogger(cwd_path, False, False)
    runner: RaspRunner = RaspRunner(logger, process_path, True)

    # Test sending Post packates
    pcap_path: str = join(cwd_path, "..", "packets", "post_request_respond.pcapng")
    pcap = rdpcap(pcap_path)
    runner.send_packet(pcap)

    # Test that python does not crash
    for _ in range(3):
        print(_)
        runner.start_process()
