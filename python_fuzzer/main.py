from parsers import PacketParser
from listeners import RaspListener
from loggers import SimpleLogger
from state_machines import RaspStateMachine
from fuzzers import RaspFuzzer
from runners import RaspRunner
from mutators import PacketMutator
from data_structures import Seed

import os
import argparse


def main(listen_for_traffic: bool) -> None:
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
        listen: RaspListener = RaspListener(log, sm, run)
        listen.run()

    # Parse the intercepted packets - or previously saved packets
    packet_path: str = os.path.join(cwd_path, "packets")
    parser: PacketParser = PacketParser(packet_path)
    seed: Seed = parser.load_seed()

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

    args = p.parse_args()

    main(True)
    # main(args.l)
