from abc import ABC, abstractmethod
from typing import Any, Tuple


class Runner(ABC):
    @abstractmethod
    def run(self, func_inp: Any) -> Tuple[Any, str]:
        pass
