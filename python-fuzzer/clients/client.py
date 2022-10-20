from typing import Any
from abc import ABC, abstractmethod


class Client(ABC):
    @abstractmethod
    def send_message(self, msg: Any) -> str:
        pass
