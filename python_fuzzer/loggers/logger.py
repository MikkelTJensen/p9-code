from abc import ABC, abstractmethod
from typing import Any


class Logger(ABC):
    @abstractmethod
    def log_message(self, inp: Any) -> None:
        pass

    @abstractmethod
    def log_crash(self, inp: Any) -> None:
        pass
