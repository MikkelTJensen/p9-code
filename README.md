# P9 - Towards Verification of the OIORASP Protocol
## Automatic Testing through Fuzzing

### Project Description

This code was written for our 9th semester project at Aalborg University.
The project revolved around fuzzing the OIORASP protocol.
A basic fuzzing harness was implemented, but we were unsuccessful in gathering interesting results using the fuzzer, due to security measurements implemented to protect messages sent over HTTP.

### Repository Structure

The fuzzer is found in the `python_fuzzer` folder.
The `working-rasp-files` folder contains files we used to set up the OIORASP client and server endpoint.
The `examples`, `src` and `proxy-server` folders contain code used for early exploration of the project.

### Running the Fuzzer

The fuzzer is run by running the `main.py` file in the **python_fuzzer** folder.
It can be run as follows:

```
python main.py --listen --verobse --log
```

The `--listen` flag runs a listener intercepting a OIORASP client and server.
A compiled OIORASP client should be placed in the `python_fuzzer/executables` folder to run client behavior.
An OIORASP client should be hosted on the local machine.
The `--verbose` flag was primarily used for debugging. 
The `--log` does not do anything yet, as the logger class has not been fully implemented.
