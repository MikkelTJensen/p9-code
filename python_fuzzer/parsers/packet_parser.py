from scapy.all import rdpcap
from scapy.packet import Packet
from scapy.plist import PacketList

import os
from typing import List


if __name__ == "__main__":
    from input_parser import InputParser
else:
    from .input_parser import InputParser


class PacketParser(InputParser):
    def __init__(self, path: str, verbose: bool) -> None:
        self.path: str = path
        self.verbose: bool = verbose

    def load_seed(self) -> List[Packet]:
        """
        Load packets intercepted from RASP protocol into a data structure that can be handled.
        :return: The seed. In this case the packets sent between RASP sender and receiver.
        """
        if self.verbose:
            print("========== PARSER ==========")
            print("Parsing locally stored packets...")

        seed = []

        # Find all files in folder
        files = [file for file in os.listdir(self.path) if os.path.isfile(os.path.join(self.path, file))]
        # Only keep files ending with .pcap or .pcapng
        files = [file for file in files if file.endswith(".pcap") or file.endswith(".pcapng")]

        # Load in saved packets at folder
        for file in files:
            path = os.path.join(self.path, file)
            packet_list = rdpcap(path)

            try:
                if isinstance(packet_list, PacketList):
                    for p in packet_list:
                        try:
                            if isinstance(p, Packet):
                                seed.append(p)
                            else:
                                raise ValueError
                        except ValueError as err:
                            print(f"Loaded packet was not of type Packet: {err}")
                else:
                    raise ValueError
            except ValueError as err:
                print(f"Loaded packet list was not of type PacketList: {err}")

        if self.verbose:
            print("All locally stored packets have been parsed.")

        return seed


if __name__ == "__main__":
    path: str = os.getcwd()
    path = os.path.dirname(path)
    path = os.path.join(path, "packets")

    parser: PacketParser = PacketParser(path)
    # The seed is a list of packet lists, which can contain packet lists themselves
    seed = parser.load_seed()
    # Here we access the first packet list of the seed
    packet = seed[0]

    print(packet.src, packet.dport, packet.sport)
