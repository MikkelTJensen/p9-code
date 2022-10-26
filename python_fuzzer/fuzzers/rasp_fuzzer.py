import random
from typing import Any, List, Tuple

from .fuzzer import Fuzzer
from python_fuzzer.mutators.mutator import Mutator
from python_fuzzer.runners.runner import Runner
from python_fuzzer.loggers.logger import Logger


class RaspFuzzer(Fuzzer):
    def __init__(self, seed: List[Any], mutator: Mutator):
        self.seed = seed
        self.mutator = mutator

    def reset(self) -> None:
        pass

    def fuzz(self, inp: Any) -> Any:
        pass

    def choose_candidate(self) -> Any:
        pass

    def run(self, runner: Runner, logger: Logger) -> Tuple[Any, str]:
        pass

    def multiple_runs(self, runner: Runner, logger: Logger, run_count: int) -> List[Tuple[Any, str]]:
        pass

