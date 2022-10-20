from parsers import Parser, DocumentPackageParser
from clients import Client, DocumentPackageClient
from mutators import Mutator, DocumentPackageMutator
from runners import Runner, DocumentPackageRunner
from loggers import Logger, SimpleLogger
from fuzzers import Fuzzer, DocumentPackageFuzzer

from typing import List, Any

HOST: str = "127.0.0.1"
PORT: int = 65432


def main() -> None:
	logger_path = "/path/"
	input_path: str = "/path/"
	parser: Parser = DocumentPackageParser(input_path)

	client: Client = DocumentPackageClient(HOST, PORT)

	seed: List[Any] = parser.load_seed()
	mutator: Mutator = DocumentPackageMutator()
	runner: Runner = DocumentPackageRunner(client)
	logger: Logger = SimpleLogger(logger_path)

	fuzzer: Fuzzer = DocumentPackageFuzzer(seed, mutator)
	fuzzer.run(runner, logger)


if __name__ == '__main__':
	main()
