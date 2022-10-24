from scapy.all import rdpcap

from os import listdir
from os.path import isfile, join
from typing import List, Any

from .input_parser import InputParser


class DocumentPackageParser(InputParser):
    def __init__(self, path: str):
        self.path: str = path

    def load_seed(self) -> List[Any]:
        """
        Load packages intercepted from RASP protocol into a data structure that can be handled.
        :return: The seed. In this case the packages sent between RASP sender and receiver.
        """
        seed: List[Any] = []

        # Find all files in folder
        files = [file for file in listdir(self.path) if isfile(join(self.path, file))]
        # Only keep files ending with .pcap or .pcapng
        files = [file for file in files if file.endswith(".pcap") or file.endswith(".pcapng")]

        # Do something with each package
        for file in files:
            path = join(self.path, file)
            packet = rdpcap(path)
            seed.append(packet)

        return seed
