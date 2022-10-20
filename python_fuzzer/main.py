from python_fuzzer import *

from typing import List, Any

HOST: str = "127.0.0.1"
PORT: int = 65432


def main() -> None:
	logger_path: str = "/path/"
	input_path: str = "/path/"
	parser: Parser = DocumentPackageParser(input_path)

	cl: Client = DocumentPackageClient(HOST, PORT)

	seed: List[Any] = parser.load_seed()
	mut: Mutator = DocumentPackageMutator()
	run: Runner = DocumentPackageRunner(cl)
	log: Logger = SimpleLogger(logger_path)

	fuzz: Fuzzer = DocumentPackageFuzzer(seed, mut)
	result = fuzz.run(run, log)


if __name__ == '__main__':
	main()
