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


def main(listen_for_traffic: bool, log_optional: bool, verbose: bool) -> None:
    # Get current working directory to create folders
    cwd_path: str = os.getcwd()
    if not cwd_path.endswith("python_fuzzer"):
        cwd_path = os.path.join(cwd_path, "python_fuzzer")

    # Initialize the logger
    logger_path: str = os.path.join(cwd_path, "log_files")
    log: SimpleLogger = SimpleLogger(logger_path, log_optional, verbose)

    # Initialize the state machine
    sm: RaspStateMachine = RaspStateMachine(verbose)

    # Initialize the runner
    process_path: str = os.path.join(cwd_path, "executables", "ClientExample")
    run: RaspRunner = RaspRunner(log, process_path, verbose)

    # Initialize and run the listener
    packet_path: str = os.path.join(cwd_path, "packets")
    if listen_for_traffic:
        listen: RaspListener = RaspListener(log, sm, run, packet_path, verbose)
        listen.run()

    # Parse the intercepted packets - or previously saved packets
    parser: PacketParser = PacketParser(packet_path, verbose)
    seed: List[Packet] = parser.load_seed()

    # Initialize the mutator
    mut: PacketMutator = PacketMutator(verbose)

    # Initialize and run the fuzzer
    fuzz: RaspFuzzer = RaspFuzzer(seed, run, sm, mut, log, verbose, mutation_count=1)
    result = fuzz.multiple_runs(20)
    print(result)


if __name__ == '__main__':
    p = argparse.ArgumentParser(description="Arguments for network protocol fuzzing harness")

    p.add_argument("--listen",
                   default=False,
                   action="store_true",
                   help="Enable the listener - will execute before the fuzzer")

    p.add_argument("--log",
                   default=False,
                   action="store_true",
                   help="Enable the logging, where logging is optional")

    p.add_argument("--verbose",
                   default=False,
                   action="store_true",
                   help="Use this flag if fuzzing process information should be printed to terminal")

    args = p.parse_args()

    main(args.listen, args.log, args.verbose)
