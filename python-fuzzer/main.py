from parsers import Parser, DocumentPackageParser
from runners import Runner
from mutators import Mutator
from loggers import Logger
from fuzzers import Fuzzer

from typing import List, Any

HOST: str = "127.0.0.1"
PORT: int = 65432


def main() -> None:
	path: str = "/path/"
	parser: Parser = DocumentPackageParser(path)

	seed: List[Any] = parser.load_seed()
	mutator: Mutator = Mutator()
	runner: Runner = Runner(HOST, PORT)
	logger: Logger = Logger()

	fuzzer: Fuzzer = Fuzzer(seed, mutator, runner, logger)
	fuzzer.run()


if __name__ == '__main__':
	main()
