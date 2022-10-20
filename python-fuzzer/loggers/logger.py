from abc import ABC, abstractmethod


class Logger(ABC):
    @abstractmethod
    def log_message(self) -> None:
        pass

    @abstractmethod
    def log_crash(self) -> None:
        pass
