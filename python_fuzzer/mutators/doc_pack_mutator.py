import random
from typing import Any, List, Callable

from mutator import Mutator


class DocumentPackageMutator(Mutator):
    def __init__(self) -> None:
        # TODO: List mutator functions here
        self.mutators: List[Callable[[Any], Any]] = [self.change_nothing_mutator]

    # TODO: Implement actual mutators - this is just placeholder code
    def change_nothing_mutator(self, inp: Any) -> Any:
        return inp

    def mutate(self, inp: Any) -> Any:
        mutator: Callable[[Any], Any] = random.choice(self.mutators)
        return mutator(inp)
