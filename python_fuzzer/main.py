from python_fuzzer import *

from os import getcwd
from os.path import join
from typing import List, Any
import threading


def run_listener(log: SimpleLogger, sm: RaspStateMachine) -> None:
	listen: RaspListener = RaspListener(log, sm)
	listen.run()


def run_fuzzer(cwd_path: str, log: SimpleLogger, sm: RaspStateMachine) -> None:
	input_path: str = join(cwd_path, "packets")
	parser: PacketParser = PacketParser(input_path)
	seed: List[Any] = parser.load_seed()

	mut: DocumentPacketMutator = DocumentPacketMutator()
	run: RaspRunner = RaspRunner(log)

	fuzz: RaspFuzzer = RaspFuzzer(seed, mut)
	result = fuzz.multiple_runs(run, sm, len(seed))
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
