from typing import Any, List, Tuple
from scapy.packet import Packet

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
                 mutator: PacketMutator,
                 logger: SimpleLogger,
                 verbose: bool,
                 mutation_count) -> None:

        self.seed: List[Packet] = seed
        self.seed_length: int = len(self.seed)
        self.seed_index: int = 0
        self.population: List[Any] = []

        self.verbose: bool = verbose

        self.logger: SimpleLogger = logger
        self.mutator: PacketMutator = mutator
        self.mutation_count = mutation_count

    def reset(self) -> None:
        self.population = []
        self.seed_index = 0

    def fuzz(self, packet: Packet) -> Packet:
        for _ in range(self.mutation_count):
            packet = self.mutator.mutate(packet)
        return packet

    def choose_candidate(self) -> Any:
        # TODO: Choose seed based on the state of the RASP Protocol
        return self.seed[0]

    # TODO: Update below function when we have StateMachine and Runner working
    def run(self, runner: RaspRunner, sm: RaspStateMachine) -> Tuple[Any, str]:
        pass

    def multiple_runs(self, runner: RaspRunner, sm: RaspStateMachine, run_count: int) -> List[Tuple[Any, str]]:
        return [self.run(runner, sm) for _ in range(run_count)]

