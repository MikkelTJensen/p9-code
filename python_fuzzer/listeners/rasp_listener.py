from .listener import Listener
from python_fuzzer.loggers.simple_logger import SimpleLogger
from python_fuzzer.state_machines.rasp_state_machine import RaspStateMachine


class RaspListener(Listener):
    def __init__(self, logger: SimpleLogger, state_machine: RaspStateMachine) -> None:
        self.logger: SimpleLogger = logger
        self.sm: RaspStateMachine = state_machine

    def run(self) -> None:
        pass
