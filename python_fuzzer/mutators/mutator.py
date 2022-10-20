from typing import Any
from abc import ABC, abstractmethod


class Mutator(ABC):
    @abstractmethod
    def mutate(self, inp: Any) -> Any:
        pass
