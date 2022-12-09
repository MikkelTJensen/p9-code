from python_fuzzer.loggers.simple_logger import SimpleLogger
from python_fuzzer.state_machines.rasp_state_machine import RaspStateMachine
from python_fuzzer.runners.rasp_runner import RaspRunner

if __name__ == "__main__":
    from listener import Listener
else:
    from .listener import Listener

from scapy.all import *
from threading import Thread
from sys import platform


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

        if platform == "linux" or platform == "linux2":
            self.platform = "wlp2s0"
        elif platform == "darwin":
            # TODO update
            self.platform = "wlp2s0"
        elif platform == "win32":
            self.platform = "Ethernet"

        self.max_packet_count = 10

    def run(self) -> None:
        if self.verbose:
            print("Initializing threads...")

        listener_thread = Thread(target=self.sniff)
        runner_thread = Thread(target=self.runner.start_process)
        listener_thread.start()
        runner_thread.start()

        if self.verbose:
            print("Both threads have terminated...")

    def sniff(self):
        if self.verbose:
            print("Sniffing...")

        pkts = sniff(iface=self.platform,
                     prn=self.packet_handler,
                     filter="tcp and port 80",
                     count=self.max_packet_count)

        if self.verbose:
            print("Stopped sniffing...")

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

    verbose = True
    packet_path = os.path.join(cwd_path, "packets")

    listen: RaspListener = RaspListener(log, sm, run, packet_path, verbose)
    listen.run()
