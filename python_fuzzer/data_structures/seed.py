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

        for p in self._data:
            if isinstance(p, PacketList):
                packet = self.find_item_helper(p)
                if packet:
                    return packet
            elif self._count == self._index:
                return p
            else:
                self._count += 1

        raise IndexError

    def __setitem__(self, index, item):
        if not isinstance(item, Packet) and not isinstance(item, PacketList):
            raise TypeError
        else:
            self._data[index] = item

    def __len__(self):
        return len(self._data)

    def append(self, item):
        if not isinstance(item, Packet) and not isinstance(item, PacketList):
            raise TypeError
        else:
            self._data.append(item)

    def find_item_helper(self, pl: PacketList) -> Union[Packet, None]:
        for item in pl:
            if isinstance(item, PacketList):
                self.find_item_helper(item)
            elif self._count == self._index:
                return item
            else:
                self._count += 1
        return None
