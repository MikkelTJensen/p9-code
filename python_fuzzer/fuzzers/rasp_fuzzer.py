from typing import Any, List, Tuple
from scapy.packet import Packet

import sys
sys.path.append("..")
from fuzzers import Fuzzer
from mutators import PacketMutator
from state_machines import RaspStateMachine
from runners import RaspRunner


class RaspFuzzer(Fuzzer):
    def __init__(self, seed: List[Packet], mutator: PacketMutator):
        self.seed: List[Packet] = seed
        self.seed_length: int = len(self.seed)
        self.seed_index: int = 0
        self.population: List[Any] = []

        self.mutator: PacketMutator = mutator

    def reset(self) -> None:
        self.population = []
        self.seed_index = 0

    def fuzz(self, inp: Any) -> Any:
        # TODO: Multiple mutations
        return self.mutator.mutate(inp)

    def choose_candidate(self, state: str) -> Any:
        # TODO: Choose seed based on the state of the RASP Protocol
        return self.seed[0]

    # TODO: Update below function when we have StateMachine and Runner working
    def run(self, runner: RaspRunner, sm: RaspStateMachine) -> Tuple[Any, str]:
        runner.start_process()
        while True:
            state: str = sm.check_for_change()
            candidate: Any = self.choose_candidate(state)
            candidate = self.fuzz(candidate)
            result, outcome = runner.run(candidate)
            if outcome == "FAIL":
                break
        return result, outcome

    def multiple_runs(self, runner: RaspRunner, sm: RaspStateMachine, run_count: int) -> List[Tuple[Any, str]]:
        return [self.run(runner, sm) for _ in range(run_count)]

