from typing import Any

from python_fuzzer import Logger


class SimpleLogger(Logger):
    def __init__(self, path: str):
        self.path: str = path

    def log_message(self, inp: Any) -> None:
        # TODO: Implement
        pass

    def log_crash(self, inp: Any) -> None:
        # TODO: Implement
        pass
