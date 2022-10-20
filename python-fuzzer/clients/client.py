from abc import ABC, abstractmethod
from typing import Any


class Client(ABC):
    @abstractmethod
    def send_message(self, msg: Any) -> None:
        pass
