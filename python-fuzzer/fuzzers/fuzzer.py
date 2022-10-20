from mutators.mutator import Mutator
from runners.runner import Runner
from loggers.logger import Logger

from abc import ABC, abstractmethod
from typing import List, Any


class Fuzzer(ABC):
    @property
    def seed(self) -> List[Any]:
        raise NotImplementedError

    @property
    def runner(self) -> Runner:
        raise NotImplementedError

    @property
    def mutator(self) -> Mutator:
        raise NotImplementedError

    @property
    def logger(self) -> Logger:
        raise NotImplementedError

    @abstractmethod
    def fuzz(self) -> Any:
        pass

    @abstractmethod
    def run(self):
        pass
