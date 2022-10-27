from typing import Any, Tuple, Callable

if __name__ == "__main__":
    from runner import Runner
else:
    from runner import Runner


class BaseRunner(Runner):
    def __init__(self, function: Callable[..., Any]) -> None:
        self.function: Callable[..., Any] = function
        self.PASS: str = 'PASS'
        self.FAIL: str = 'FAIL'
        self.UNRESOLVED: str = 'UNRESOLVED'

    def run(self, func_inp: Any) -> Tuple[Any, str]:
        pass
