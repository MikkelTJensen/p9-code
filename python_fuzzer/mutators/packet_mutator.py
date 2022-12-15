import random
from typing import Any, List, Callable
from scapy.packet import Packet

from .mutator import Mutator


class PacketMutator(Mutator):
    def __init__(self, verbose: bool) -> None:
        self.verbose: bool = verbose
        # List mutator functions here
        self.mutators: List[Callable[[Any], Any]] = [self.flip_bit_mutator,
                                                     self.add_to_byte_mutator,
                                                     self.remove_from_byte_mutator]

    def mutate(self, packet: Packet) -> Packet:
        data: bytes = packet[Raw].load
        mutator: Callable[[Any], Any] = random.choice(self.mutators)
        packet[Raw].load = mutator(data)
        return packet

    #string methods of this
    def flip_bit_mutator(self, data: bytes) -> bytes:
        pos: int = random.randint(0, len(data) - 1)
        c: chr = chr(data[pos])
        bit: int = 1 << random.randint(0, 6)
        new_c: chr = chr(ord(c) ^ bit)

        data = data[:pos] + str.encode(new_c) + data[pos + 1:]

        return data

    def add_to_byte_mutator(self, data: bytes) -> bytes:
        pos: int = random.randint(0, len(data) - 1)
        c: int = data[pos]
        c += random.randint(1, 36)

        data = data[:pos] + str.encode(chr(c)) + data[pos + 1:]

        return data

    def remove_from_byte_mutator(self, data: bytes) -> bytes:
        pos: int = random.randint(0, len(data) - 1)
        c: int = data[pos]
        c -= random.randint(1, 36)

        data = data[:pos] + str.encode(chr(c)) + data[pos + 1:]

        return data
