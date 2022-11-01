from scapy.packet import Packet
from scapy.plist import PacketList

from typing import Union


class Seed:
    def __init__(self):
        self._data = []
        self._index = 0
        self._count = 0

    def __getitem__(self, index):
        self._count = 0
        self._index = index
        try:
            for p in self._data:
                if isinstance(p, PacketList):
                    packet = self._find_item_helper(p)
                    if packet:
                        return packet
                elif self._count == self._index:
                    return p
                else:
                    self._count += 1
            raise IndexError
        except IndexError as err:
            print("Seed index out of range", err)

    def __setitem__(self, index, item):
        try:
            if not isinstance(item, Packet) and not isinstance(item, PacketList):
                raise TypeError
            else:
                self._data[index] = item
        except TypeError as err:
            print("Seed item was not recognized as a Packet or PacketList", err)

    def __len__(self):
        count: int = 0
        for p in self._data:
            if isinstance(p, PacketList):
                count += self._count_packets(p)
            else:
                count += 1
        return count

    def append(self, item):
        try:
            if not isinstance(item, Packet) and not isinstance(item, PacketList):
                raise TypeError
            else:
                self._data.append(item)
        except TypeError as err:
            print("Seed item was not recognized as a Packet or PacketList", err)

    def _count_packets(self, pl: PacketList) -> int:
        count: int = 0
        for item in pl:
            if isinstance(item, PacketList):
                count += self._count_packets(item)
            else:
                count += 1
        return count

    def _find_item_helper(self, pl: PacketList) -> Union[Packet, None]:
        for item in pl:
            if isinstance(item, PacketList):
                self._find_item_helper(item)
            elif self._count == self._index:
                return item
            else:
                self._count += 1
        return None
