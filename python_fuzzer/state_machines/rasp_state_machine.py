from .state_machine import StateMachine

from scapy.packet import Packet


class RaspStateMachine(StateMachine):
    def __init__(self) -> None:
        pass

    def notify_of_packet(self, inp: Packet) -> None:
        # TODO: Implement
        pass

    def get_state(self) -> str:
        # TODO: Implement
        pass

    def check_for_change(self) -> str:
        # TODO: Implement
        pass
