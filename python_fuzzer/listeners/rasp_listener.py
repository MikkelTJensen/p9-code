from python_fuzzer.loggers.simple_logger import SimpleLogger
from python_fuzzer.state_machines.rasp_state_machine import RaspStateMachine
from python_fuzzer.runners.rasp_runner import RaspRunner

if __name__ == "__main__":
    from listener import Listener
else:
    from .listener import Listener

from scapy.all import *
from threading import Thread


class RaspListener(Listener):
    def __init__(self,
                 logger: SimpleLogger,
                 state_machine: RaspStateMachine,
                 runner: RaspRunner,
                 packet_path: str,
                 verbose: bool) -> None:

        self.logger: SimpleLogger = logger
        self.sm: RaspStateMachine = state_machine
        self.runner: RaspRunner = runner
        self.packet_path: str = packet_path
        self.verbose: bool = verbose

    def run(self) -> None:
        if self.verbose:
            print("Initializing threads...")

        listener_thread = Thread(target=self.sniff_and_save)
        runner_thread = Thread(target=self.runner.start_process)
        listener_thread.run()
        runner_thread.run()

        if self.verbose:
            print("Both threads have terminated...")

    def sniff_and_save(self):
        # TODO then save the packets - possibly using the prn attribute
        pkts = sniff(iface="wlp2s0", prn=self.packet_handler, filter="tcp and port 80")

    def packet_handler(self, packet):
        if self.verbose:
            print(packet.summary())

        print("src/dst: "+packet[IP].src+" / "+packet[IP].dst)
        if packet.haslayer(Raw):
            print("Load: \n"+str(packet[Raw].load, "ASCII"))
        else:
            print("Load: None\n")


if __name__ == '__main__':
    cwd_path: str = os.getcwd()
    cwd_path = os.path.dirname(cwd_path)

    logger_path: str = os.path.join(cwd_path, "log_files")
    log: SimpleLogger = SimpleLogger(logger_path)

    # Initialize the state machine
    sm: RaspStateMachine = RaspStateMachine()

    # Initialize the runner
    process_path: str = os.path.join(cwd_path, "executables", "ClientExample")
    run: RaspRunner = RaspRunner(log, process_path)

    listen: RaspListener = RaspListener(log, sm, run)
    listen.run()
