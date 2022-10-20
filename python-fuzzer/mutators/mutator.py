from abc import ABC, abstractmethod
from typing import Any


class Mutator(ABC):
    @abstractmethod
    def mutate(self, inp: Any) -> Any:
        pass
