from parsers import PacketParser
from listeners import RaspListener
from loggers import SimpleLogger
from state_machines import RaspStateMachine
from fuzzers import RaspFuzzer
from runners import RaspRunner
from mutators import PacketMutator
from data_structures import Seed

from os import getcwd
from os.path import join
import threading


def run_listener(log: SimpleLogger, sm: RaspStateMachine) -> None:
    listen: RaspListener = RaspListener(log, sm)
    listen.run()


def run_fuzzer(cwd_path: str, log: SimpleLogger, sm: RaspStateMachine) -> None:
    input_path: str = join(cwd_path, "packets")
    process_path: str = join(cwd_path, "executables", "ClientExample")
    parser: PacketParser = PacketParser(input_path)
    seed: Seed = parser.load_seed()

    mut: PacketMutator = PacketMutator()
    run: RaspRunner = RaspRunner(log, process_path)

    fuzz: RaspFuzzer = RaspFuzzer(seed, mut)
    #result = fuzz.multiple_runs(run, sm, len(seed))
    result = ""
    print(result)


def main() -> None:
    cwd_path: str = getcwd()
    if not cwd_path.endswith("python_fuzzer"):
        cwd_path = join(cwd_path, "python_fuzzer")

    logger_path: str = join(cwd_path, "log_files")
    log: SimpleLogger = SimpleLogger(logger_path)
    sm: RaspStateMachine = RaspStateMachine()

    listener_thread = threading.Thread(target=run_listener, args=(log, sm))
    listener_thread.start()

    fuzzer_thread = threading.Thread(target=run_fuzzer, args=(cwd_path, log, sm))
    fuzzer_thread.start()


if __name__ == '__main__':
    main()
