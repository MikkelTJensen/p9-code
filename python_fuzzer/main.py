from python_fuzzer import *

from os import getcwd
from os.path import join
from typing import List, Any
import threading


def run_listener(log: Logger, sm: StateMachine) -> None:
	listen: Listener = RaspListener(log, sm)
	listen.run()


def run_fuzzer(cwd_path: str, log: Logger, sm: StateMachine) -> None:
	input_path: str = join(cwd_path, "packets")
	parser: Parser = DocumentPacketParser(input_path)
	seed: List[Any] = parser.load_seed()

	mut: Mutator = DocumentPacketMutator()
	run: Runner = RaspRunner(log)

	fuzz: Fuzzer = RaspFuzzer(seed, mut)
	result = fuzz.multiple_runs(run, log, sm, len(seed))
	print(result)


def main() -> None:
	cwd_path: str = getcwd()
	if not cwd_path.endswith("python_fuzzer"):
		cwd_path = join(cwd_path, "python_fuzzer")

	logger_path: str = join(cwd_path, "log_files")
	log: Logger = SimpleLogger(logger_path)

	sm: StateMachine = RaspStateMachine()

	listener_thread = threading.Thread(target=run_listener, args=(cwd_path, log, sm))
	listener_thread.start()

	fuzzer_thread = threading.Thread(target=run_fuzzer, args=(cwd_path, log, sm))
	fuzzer_thread.start()


if __name__ == '__main__':
	main()
