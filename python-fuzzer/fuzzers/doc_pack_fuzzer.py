from fuzzer import Fuzzer

import random
from typing import Any, List, Tuple


class DocumentPackageFuzzer(Fuzzer):
    def __init__(self, seed: List[Any], mutator):
        self.seed: List[Any] = seed
        self.seed_length: int = len(self.seed)
        self.seed_index: int = 0
        self.population: List[Any] = []

        self.mutator = mutator

    def reset(self) -> None:
        self.population = []
        self.seed_index = 0

    def fuzz(self, inp: Any) -> Any:
        # TODO: Multiple mutations
        return self.mutator(inp)

    def choose_candidate(self) -> Any:
        # First use initial seed input
        if self.seed_index < self.seed_length:
            choice: Any = self.seed[self.seed_index]
            self.population.append(choice)
            self.seed_index += 1
        # Then use population
        else:
            choice: Any = random.choice(self.population)

        return choice

    def run(self, runner, logger) -> Tuple[Any, str]:
        candidate = self.choose_candidate()
        candidate = self.fuzz(candidate)
        result, outcome = runner.run(candidate)
        if outcome == 'FAIL':
            logger.log_crash(result)
        return result, outcome

    def multiple_runs(self, runner, logger, run_count: int) -> List[Tuple[Any, str]]:
        return [self.run(runner, logger) for _ in range(run_count)]

