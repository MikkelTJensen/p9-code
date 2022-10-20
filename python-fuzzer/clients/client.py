from abc import ABC, abstractmethod


class Client(ABC):
    @abstractmethod
    def connect(self) -> None:
        pass

    @abstractmethod
    def send_message(self) -> None:
        pass
