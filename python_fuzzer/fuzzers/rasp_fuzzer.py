from typing import Any, List, Tuple
from scapy.packet import Packet
import random

if __name__ == "__main__":
    from fuzzer import Fuzzer
else:
    from .fuzzer import Fuzzer

import sys
sys.path.append("..")
from mutators import PacketMutator
from state_machines import RaspStateMachine
from runners import RaspRunner
from loggers import SimpleLogger


class RaspFuzzer(Fuzzer):
    def __init__(self,
                 seed: List[Packet],
                 runner: RaspRunner,
                 sm: RaspStateMachine,
                 mutator: PacketMutator,
                 logger: SimpleLogger,
                 verbose: bool,
                 mutation_count: int) -> None:

        self.seed: List[Packet] = seed
        self.seed_length: int = len(self.seed)
        self.seed_index: int = 0
        self.population: List[Packet] = []

        self.verbose: bool = verbose

        self.runner: RaspRunner = runner
        self.state_machine: RaspStateMachine = sm
        self.logger: SimpleLogger = logger
        self.mutator: PacketMutator = mutator
        self.mutation_count: int = mutation_count

    def reset(self) -> None:
        self.population = []
        self.seed_index = 0

    def fuzz(self, packet: Packet) -> Packet:
        random_range = random.randint(1, self.mutation_count)
        for _ in range(random_range):
            packet = self.mutator.mutate(packet)
        return packet

    def choose_candidate(self) -> Any:
        # TODO: Choose seed based on the state of the RASP Protocol
        if len(self.seed) > 0:
            candidate: Packet = self.seed[self.seed_index]
            self.seed_index += 1
            self.population.append(candidate)
            return candidate
        else:
            index: int = random.randint(0, len(self.population)-1)
            candidate: Packet = self.population[index]
            return candidate

    # TODO: Update below function when we have StateMachine and Runner working
    def run(self) -> Tuple[Any, str]:
        pass

    def multiple_runs(self, run_count: int) -> List[Tuple[Any, str]]:
        # TODO Filter so only crashes are returned if we want to run millions of iterations?
        return [self.run() for _ in range(run_count)]

