from abc import ABC, abstractmethod
from typing import Any


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
    def run(self) -> None:
        pass

    @abstractmethod
    def multiple_runs(self, run_count: int) -> None:
        pass
