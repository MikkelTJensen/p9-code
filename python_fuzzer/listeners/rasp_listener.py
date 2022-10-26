from .listener import Listener
from python_fuzzer.loggers.logger import Logger
from python_fuzzer.state_machines.state_machine import StateMachine


class RaspListener(Listener):
    def __init__(self, logger: Logger, state_machine: StateMachine) -> None:
        self.logger: Logger = logger
        self.sm: StateMachine = state_machine

    def run(self) -> None:
        pass
