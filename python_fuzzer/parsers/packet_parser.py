from scapy.all import rdpcap

from os import listdir, getcwd
from os.path import isfile, join, dirname

import sys
sys.path.append("..")
from data_structures import Seed

if __name__ == "__main__":
    from input_parser import InputParser
else:
    from .input_parser import InputParser


class PacketParser(InputParser):
    def __init__(self, path: str):
        self.path: str = path

    def load_seed(self) -> Seed:
        """
        Load packets intercepted from RASP protocol into a data structure that can be handled.
        :return: The seed. In this case the packets sent between RASP sender and receiver.
        """
        seed: Seed = Seed()

        # Find all files in folder
        files = [file for file in listdir(self.path) if isfile(join(self.path, file))]
        # Only keep files ending with .pcap or .pcapng
        files = [file for file in files if file.endswith(".pcap") or file.endswith(".pcapng")]

        # Load in saved packets at folder
        for file in files:
            path = join(self.path, file)
            packet = rdpcap(path)
            seed.append(packet)

        return seed


if __name__ == "__main__":
    path: str = getcwd()
    path = dirname(path)
    path = join(path, "packets")

    parser: PacketParser = PacketParser(path)
    # The seed is a list of packet lists, which can contain packet lists themselves
    seed = parser.load_seed()
    # Here we access the first packet list of the seed
    packet = seed[0]

    print(packet.src, packet.dport, packet.sport)
