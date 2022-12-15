from .state_machine import StateMachine

from scapy.packet import Packet


class RaspStateMachine(StateMachine):
    def __init__(self, verbose: bool) -> None:
        self.verbose: bool = verbose

    def notify_of_packet(self, packet: Packet) -> None:
        # TODO: Implement
        pass

    def get_state(self) -> str:
        # TODO: Implement
        pass

    def check_for_change(self) -> str:
        # TODO: Implement
        pass
