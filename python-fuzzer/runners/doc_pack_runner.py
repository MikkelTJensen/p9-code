from runner import Runner

from typing import Any


class DocumentPackageRunner(Runner):
    def __init__(self, client) -> None:
        self.function = client.send_message

    def run_function(self, func_inp: Any) -> None:
        self.function(func_inp)
