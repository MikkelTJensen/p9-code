from parsers import PacketParser
from listeners import RaspListener
from loggers import SimpleLogger
from state_machines import RaspStateMachine
from fuzzers import RaspFuzzer
from runners import RaspRunner
from mutators import PacketMutator

import os
import argparse
from typing import List
from scapy.packet import Packet


def main(listen_for_traffic: bool, verbose: bool) -> None:
    # Get current working directory to create folders
    cwd_path: str = os.getcwd()
    if not cwd_path.endswith("python_fuzzer"):
        cwd_path = os.path.join(cwd_path, "python_fuzzer")

    # Initialize the logger
    logger_path: str = os.path.join(cwd_path, "log_files")
    log: SimpleLogger = SimpleLogger(logger_path)

    # Initialize the state machine
    sm: RaspStateMachine = RaspStateMachine()

    # Initialize the runner
    process_path: str = os.path.join(cwd_path, "executables", "ClientExample")
    run: RaspRunner = RaspRunner(log, process_path)

    # Initialize and run the listener
    if listen_for_traffic:
        packet_path = os.path.join(cwd_path, "packets")
        listen: RaspListener = RaspListener(log, sm, run, packet_path, verbose)
        listen.run()

    # Parse the intercepted packets - or previously saved packets
    packet_path: str = os.path.join(cwd_path, "packets")
    parser: PacketParser = PacketParser(packet_path)
    seed: List[Packet] = parser.load_seed()

    # Initialize the mutator
    mut: PacketMutator = PacketMutator()

    # Initialize and run the fuzzer
    fuzz: RaspFuzzer = RaspFuzzer(seed, mut)
    result = fuzz.multiple_runs(run, sm, len(seed))
    print(result)


if __name__ == '__main__':
    p = argparse.ArgumentParser(description="Arguments for network protocol fuzzing harness")

    # Call main.py with "--l" flag to run the listener
    p.add_argument("--l",
                   default=False,
                   action="store_true",
                   help="Enable the listener - will execute before the fuzzer")

    p.add_argument("--v",
                   default=False,
                   action="store_true",
                   help="Use this flag if fuzzing process information should be printed")

    args = p.parse_args()

    main(args.l, args.v)
