from typing import List, Any
from abc import ABC, abstractmethod


class InputParser(ABC):
    @abstractmethod
    def load_seed(self) -> List[Any]:
        pass
