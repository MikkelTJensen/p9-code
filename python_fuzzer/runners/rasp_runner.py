from typing import Any, Tuple
from subprocess import run
from os import getcwd
from os.path import join
import socket

from scapy import sendrecv
from scapy.packet import Packet, Raw
from scapy.all import rdpcap
from scapy.supersocket import StreamSocket

if __name__ == "__main__":
    from runner import Runner
else:
    from .runner import Runner

import sys
sys.path.append("..")
from loggers import SimpleLogger


class RaspRunner(Runner):
    def __init__(self, log: SimpleLogger, path: str, verbose: bool) -> None:
        self.PASS: str = 'PASS'
        self.FAIL: str = 'FAIL'
        self.UNRESOLVED: str = 'UNRESOLVED'

        self.logger: SimpleLogger = log

        self.interface: str = "Software Loopback Interface 1"
        self.executable_path: str = path
        self.verbose: bool = verbose

    def run(self, packet: Packet) -> Tuple[Any, str]:
        result, outcome = self.send_packet(packet)
        # TODO unpack results/queries here and return a better result variable
        return result, outcome

    def send_packet(self, p: Packet) -> Tuple[Any, str]:
        try:
            verbose = 0
            if self.verbose:
                print("========== Runner ==========")
                print("Attempting to send packet...")
                verbose = 1

            s = socket.socket()
            s.connect(("127.0.0.1", 80))
            ss = StreamSocket(s, Raw)
            answer = ss.sr1(Raw(p[Raw].load))

            print(answer)

            # answer, unanswered = sendrecv.srp(p, iface=self.interface, verbose=verbose, timeout=20)

            if len(answer) > 0:
                if self.verbose:
                    print("Answer received.")
                    for query in answer:
                        print(query)
                return answer, self.PASS
            elif len(unanswered) > 0:
                print("Unresolved attempt at sending packets - no answer received from server")
                return unanswered, self.UNRESOLVED
        except:
            print("Failed attempt at sending packets")
            return None, self.FAIL

    def start_process(self) -> None:
        try:
            # Input is the options chosen in the Client
            process = run(["dk.gov.oiosi.samples.ClientExample.exe"],
                          shell=True,
                          cwd=self.executable_path,
                          timeout=30,
                          capture_output=True)

            if process.returncode != 0:
                if self.verbose:
                    print(process.stderr)

                self.logger.log_crash(process.stderr)
        except:
            # TODO handle this better
            pass


if __name__ == '__main__':
    cwd_path = getcwd()
    # Get path to the folder of the ClientExample
    process_path: str = join(cwd_path, "..", "executables", "ClientExample")
    logger: SimpleLogger = SimpleLogger(cwd_path, verbose=False, log_optional=False)
    runner: RaspRunner = RaspRunner(logger, process_path, verbose=True)

    # Test sending Post packets
    pcap_path: str = join(cwd_path, "..", "packets", "post_request_respond.pcapng")
    pcap = rdpcap(pcap_path)
    runner.send_packet(pcap)

    # Test that process is run correctly
    # runner.start_process()
