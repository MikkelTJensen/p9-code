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

    def choose_candidate(self) -> Packet:
        # TODO: Choose seed based on the state of the RASP Protocol
        if len(self.seed) > self.seed_index:
            candidate: Packet = self.seed[self.seed_index]
            self.seed_index += 1
            self.population.append(candidate)
            return candidate
        else:
            index: int = random.randint(0, len(self.population)-1)
            candidate: Packet = self.population[index]
            return candidate

    # TODO: Update below function when we have StateMachine?
    # TODO: Add some logging perhaps - at least evaluate output of runner
    def run(self) -> Tuple[Any, str]:
        packet: Packet = self.choose_candidate()
        packet = self.fuzz(packet)
        result, outcome = self.runner.run(packet)
        if outcome == "FAIL":
            self.population.append(packet)
        return result, outcome

    def multiple_runs(self, run_count: int) -> List[Tuple[Any, str]]:
        results =  [self.run() for _ in range(run_count)]
        # Filter results marked as "PASS"
        # TODO Better filter? Perhaps look at respones from runner
        return [result for result in results if result[1] == "FAIL" or result[1] == "UNRESOLVED"]

