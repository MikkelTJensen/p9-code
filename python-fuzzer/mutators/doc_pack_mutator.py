from mutator import Mutator

import random
from typing import Any


class DocumentPackageMutator(Mutator):
    def __init__(self) -> None:
        # TODO: List mutator functions here
        self.mutators = [self.change_nothing_mutator]

    # TODO: Implement actual mutators - this is just placeholder code
    def change_nothing_mutator(self, inp: Any) -> Any:
        return inp

    def mutate(self, inp: Any) -> Any:
        mutator = random.choice(self.mutators)
        return mutator(inp)
