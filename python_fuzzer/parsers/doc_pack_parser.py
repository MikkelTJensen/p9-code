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
        seed: List[Any] = ["place_holder"]
        # TODO: Implement loading a package
        return seed
