from abc import ABC, abstractmethod
from typing import Any

from python_fuzzer import Runner, Logger


class Fuzzer(ABC):
    @abstractmethod
    def reset(self) -> None:
        pass

    @abstractmethod
    def fuzz(self, inp: Any) -> Any:
        pass

    @abstractmethod
    def choose_candidate(self) -> Any:
        pass

    @abstractmethod
    def run(self, runner: Runner, logger: Logger) -> None:
        pass
