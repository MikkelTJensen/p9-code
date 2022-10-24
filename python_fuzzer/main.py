from python_fuzzer import *

from os import getcwd
from os.path import join
from typing import List, Any

HOST: str = "127.0.0.1"
PORT: int = 65432


def main() -> None:
	cwd_path: str = getcwd()
	if not cwd_path.endswith("python_fuzzer"):
		cwd_path = join(cwd_path, "python_fuzzer")

	input_path: str = join(cwd_path, "packets")
	parser: Parser = DocumentPacketParser(input_path)
	seed: List[Any] = parser.load_seed()

	cl: Client = DocumentPacketClient(HOST, PORT)

	mut: Mutator = DocumentPacketMutator()
	run: Runner = DocumentPacketRunner(cl)

	logger_path: str = join(cwd_path, "log_files")
	log: Logger = SimpleLogger(logger_path)

	fuzz: Fuzzer = DocumentPacketFuzzer(seed, mut)
	result = fuzz.run(run, log)
	print(result)


if __name__ == '__main__':
	main()
