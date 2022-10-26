from abc import ABC, abstractmethod


class StateMachine(ABC):
    @abstractmethod
    def get_state(self) -> str:
        pass

    @abstractmethod
    def set_state(self) -> str:
        pass

    @abstractmethod
    def check_for_change(self) -> str:
        pass
