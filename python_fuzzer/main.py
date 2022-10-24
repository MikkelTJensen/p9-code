from python_fuzzer import *

from os import getcwd
from os.path import  join
from typing import List, Any

HOST: str = "127.0.0.1"
PORT: int = 65432


def main() -> None:
	cwd_path: str = getcwd()

	cwd_path = join(cwd_path, "python_fuzzer") if not cwd_path.endswith("python_fuzzer") else cwd_path
	input_path: str = join(cwd_path, "packages")
	parser: Parser = DocumentPackageParser(input_path)
	seed: List[Any] = parser.load_seed()

	cl: Client = DocumentPackageClient(HOST, PORT)

	mut: Mutator = DocumentPackageMutator()
	run: Runner = DocumentPackageRunner(cl)

	logger_path: str = join(cwd_path, "log_files")
	log: Logger = SimpleLogger(logger_path)

	fuzz: Fuzzer = DocumentPackageFuzzer(seed, mut)
	result = fuzz.run(run, log)
	print(result)


if __name__ == '__main__':
	main()
