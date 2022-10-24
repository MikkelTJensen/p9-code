from pcapng import FileScanner
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
        # Find all files in folder
        packages = [file for file in listdir(self.path) if isfile(join(self.path, file))]
        # Only keep files ending with .pcap or .pcapng
        packages = [package for package in packages if package.endswith(".pcap") or package.endswith(".pcapng")]

        # Do something with each package
        for package in packages:
            path = join(self.path, package)
            print(path)
            with open(path, "rb") as fp:
                scanner = FileScanner(fp)
                for block in scanner:
                    pass

        seed: List[Any] = ["place_holder"]
        # TODO: Implement loading a package
        return seed
