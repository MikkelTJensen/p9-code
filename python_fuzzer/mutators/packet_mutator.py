import random
from typing import Any, List, Callable
from scapy.packet import *

from .mutator import Mutator


class PacketMutator(Mutator):
    def __init__(self) -> None:
        # List mutator functions here
        self.mutators: List[Callable[[Any], Any]] = [self.flip_bit_mutator, self.add_to_byte_mutator, self.remove_from_byte_mutator]

    def mutate(self, inp: Any) -> Any:
        mutator: Callable[[Any], Any] = random.choice(self.mutators)
        return mutator(inp)

    #string methods of this
    def flip_bit_mutator(self, inp: Any) -> Any:
        pos = random.randint(0, len(inp[Raw].load) - 1)
        c = chr(inp[Raw].load[pos])
        bit = 1 << random.randint(0, 6)
        new_c = chr(ord(c) ^ bit)

        inp[Raw].load = inp[Raw].load[:pos] + str.encode(new_c) + inp[Raw].load[pos + 1:]

        return inp

    def add_to_byte_mutator(self, inp: Any) -> Any:
        pos = random.randint(0, len(inp[Raw].load) - 1)
        c = inp[Raw].load[pos]
        c += random.randint(1, 36)

        inp[Raw].load = inp[Raw].load[:pos] + str.encode(chr(c)) + inp[Raw].load[pos + 1:]

        return inp

    def remove_from_byte_mutator(self, inp: Any) -> Any:
        pos = random.randint(0, len(inp[Raw].load) - 1)
        c = inp[Raw].load[pos]
        c -= random.randint(1, 36)

        inp[Raw].load = inp[Raw].load[:pos] + str.encode(chr(c)) + inp[Raw].load[pos + 1:]

        return inp

