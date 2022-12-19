from typing import Any, Tuple
from subprocess import run
from os import getcwd
from os.path import join
from os import listdir
import socket

from scapy import sendrecv
from scapy.packet import Packet, Raw
from scapy.all import rdpcap
from scapy.supersocket import StreamSocket
from scapy.layers.http import http_request

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

    def run(self, packet: Packet, streamsocket: StreamSocket) -> Tuple[Any, str]:
        result, outcome = self.send_packet(packet, streamsocket)
        # TODO unpack results/queries here and return a better result variable
        return result, outcome

    def send_packet(self, p: Packet, streamsocket: StreamSocket) -> Tuple[Any, str]:
        if self.verbose:
            print("========== Runner ==========")
            print("Attempting to send packet...")
        try:
            answer = None

            load = str(p[Raw].load)
            if "POST" in load:
                load = load.split("POST")
                new_load = load[1]
                new_load = new_load[:-1]
                new_load = "POST" + new_load
                print("before dawn ", new_load)
                new_load = new_load.encode().decode('unicode_escape').encode("raw_unicode_escape")
                print("encoded ", new_load)
                new_load = new_load.decode()
                print("decoded ", new_load)
                p[Raw].load = new_load
                print(p.payload.layers())
                answer = streamsocket.sr1(p[Raw])

            if "<s:Envelope" in load:
                load = load.split("<s:Envelope")
                new_load = load[1]
                new_load = new_load[:-1]
                new_load = "<s:Envelope" + new_load
                print("before dawn ", new_load)
                new_load = new_load.encode().decode('unicode_escape').encode("raw_unicode_escape")
                print("encoded ", new_load)
                new_load = new_load.decode()
                print("decoded ", new_load)
                p[Raw].load = new_load
                print(p.payload.layers())
                answer = streamsocket.sr1(p[Raw])

            if answer:
                if self.verbose:
                    print("Answer received.")
                    for query in answer:
                        pass
                        # print(query[0][0])
                return answer, self.PASS
            else:
                if self.verbose:
                    print("Unresolved attempt at sending packets - no answer received from server")
                return None, self.UNRESOLVED
        except Exception as e:
            if self.verbose:
                print(e)
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

    packet_path = join(cwd_path, "..", "packets")
    for filename in listdir(packet_path):
        f = join(packet_path, filename)
        pcap = rdpcap(f)
        runner.send_packet(pcap)
    # Test sending Post packets
    # pcap_path: str = join(cwd_path, "..", "packets", "packet1.pcap")
    # pcap = rdpcap(pcap_path)
    # runner.send_packet(pcap)

    # Test that process is run correctly
    # runner.start_process()
