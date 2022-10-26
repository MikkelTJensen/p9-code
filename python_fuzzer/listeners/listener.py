from typing import Any
from abc import ABC, abstractmethod


class Listener(ABC):
    @abstractmethod
    def run(self) -> None:
        pass
