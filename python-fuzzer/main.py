from parsers import Parser, DocumentPackageParser
from clients import Client, DocumentPackageClient
from mutators import Mutator, DocumentPackageMutator
from runners import Runner, DocumentPackageRunner
from loggers import Logger
from fuzzers import Fuzzer

from typing import List, Any

HOST: str = "127.0.0.1"
PORT: int = 65432


def main() -> None:
	path: str = "/path/"
	parser: Parser = DocumentPackageParser(path)

	client: Client = DocumentPackageClient(HOST, PORT)

	seed: List[Any] = parser.load_seed()
	mutator: Mutator = DocumentPackageMutator()
	runner: Runner = Runner(client)
	logger: Logger = Logger()

	fuzzer: Fuzzer = Fuzzer(seed, mutator, runner, logger)
	fuzzer.run()


if __name__ == '__main__':
	main()
