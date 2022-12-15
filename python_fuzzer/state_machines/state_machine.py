from abc import ABC, abstractmethod
from typing import Any


class StateMachine(ABC):
    @abstractmethod
    def notify_of_packet(self, inp: Any) -> None:
        pass

    @abstractmethod
    def get_state(self) -> str:
        pass

    @abstractmethod
    def check_for_change(self) -> str:
        pass
