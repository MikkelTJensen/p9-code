from abc import ABC, abstractmethod
from typing import Any


class Mutator(ABC):
    @property
    def mutators(self):
        raise NotImplementedError

    @abstractmethod
    def mutate(self, inp: Any) -> Any:
        pass
