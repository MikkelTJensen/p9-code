from abc import ABC, abstractmethod
from typing import Any


class Runner(ABC):
    @abstractmethod
    def run_function(self, func_inp: Any) -> None:
        pass
