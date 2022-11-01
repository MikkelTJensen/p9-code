from typing import Any, List, Tuple

from python_fuzzer.fuzzers.doc_pack_fuzzer import DocumentPacketFuzzer
from python_fuzzer.mutators.doc_pack_mutator import DocumentPacketMutator
from python_fuzzer.state_machines.rasp_state_machine import RaspStateMachine
from python_fuzzer.runners.rasp_runner import RaspRunner
from python_fuzzer.data_structures.seed import Seed


class RaspFuzzer(DocumentPacketFuzzer):
    def __init__(self, seed: Seed, mutator: DocumentPacketMutator):
        super().__init__(seed, mutator)

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

