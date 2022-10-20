from abc import ABC, abstractmethod
from typing import List, Any


class InputParser(ABC):
    @abstractmethod
    def load_seed(self) -> List[Any]:
        pass
