from scapy.all import rdpcap
from scapy.packet import Packet
from scapy.plist import PacketList


from typing import List, Any
from os import listdir, getcwd
from os.path import isfile, join, dirname

if __name__ == "__main__":
    from input_parser import InputParser
else:
    from .input_parser import InputParser


class PacketParser(InputParser):
    def __init__(self, path: str):
        self.path: str = path

    def load_seed(self) -> List[Packet]:
        """
        Load packets intercepted from RASP protocol into a data structure that can be handled.
        :return: The seed. In this case the packets sent between RASP sender and receiver.
        """
        seed = []

        # Find all files in folder
        files = [file for file in listdir(self.path) if isfile(join(self.path, file))]
        # Only keep files ending with .pcap or .pcapng
        files = [file for file in files if file.endswith(".pcap") or file.endswith(".pcapng")]

        # Load in saved packets at folder
        for file in files:
            path = join(self.path, file)
            packet_list = rdpcap(path)
            packet = None

            try:
                if isinstance(packet_list, PacketList):
                    packet = packet_list[0]
                else:
                    raise ValueError
            except ValueError as err:
                print(f"Loaded packet list was not of type PacketList: {err}")

            try:
                if isinstance(packet, Packet):
                    seed.append(packet)
                else:
                    raise ValueError
            except ValueError as err:
                print(f"Loaded packet was not of type Packet: {err}")

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
