import socket
from typing import Any
from platform import system

from .listener import Listener
from python_fuzzer.loggers.logger  import Logger
from python_fuzzer.state_machines.state_machine import StateMachine


class RaspListener(Listener):
    def __init__(self, logger: Logger, state_machine: StateMachine) -> None:
        self.LOGGER: logger
        self.STATEMACHINE: state_machine

    def run(self) -> None:
        while(True):
            
        # TODO run in loop, log and change state
            print("lol")
