from abc import ABC, abstractmethod


class Runner(ABC):
    @property
    def client_function(self):
        raise NotImplementedError

    @abstractmethod
    def run_function(self) -> None:
        pass
