import random
from typing import Any, List, Tuple

from .fuzzer import Fuzzer
from python_fuzzer.mutators.doc_pack_mutator import DocumentPacketMutator
from python_fuzzer.runners.doc_pack_runner import DocumentPacketRunner
from python_fuzzer.loggers.simple_logger import SimpleLogger
from python_fuzzer.data_structures.seed import Seed


class DocumentPacketFuzzer(Fuzzer):
    def __init__(self, seed: Seed, mutator: DocumentPacketMutator):
        self.seed: Seed = seed
        self.seed_length: int = len(self.seed)
        self.seed_index: int = 0
        self.population: List[Any] = []

        self.mutator: DocumentPacketMutator = mutator

    def reset(self) -> None:
        self.population = []
        self.seed_index = 0

    def fuzz(self, inp: Any) -> Any:
        # TODO: Multiple mutations
        return self.mutator.mutate(inp)

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

    def run(self, runner: DocumentPacketRunner, logger: SimpleLogger) -> Tuple[Any, str]:
        candidate: Any = self.choose_candidate()
        candidate = self.fuzz(candidate)
        result, outcome = runner.run(candidate)
        if outcome == 'FAIL':
            logger.log_crash(result)
        return result, outcome

    def multiple_runs(self, runner: DocumentPacketRunner, logger: SimpleLogger, run_count: int) -> List[Tuple[Any, str]]:
        return [self.run(runner, logger) for _ in range(run_count)]

