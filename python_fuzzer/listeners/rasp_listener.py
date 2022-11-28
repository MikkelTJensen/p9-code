from .listener import Listener
from python_fuzzer.loggers.simple_logger import SimpleLogger
from python_fuzzer.state_machines.rasp_state_machine import RaspStateMachine
from python_fuzzer.runners.rasp_runner import RaspRunner

from scapy.all import *


class RaspListener(Listener):
    def __init__(self, logger: SimpleLogger, state_machine: RaspStateMachine, runner: RaspRunner) -> None:
        self.logger: SimpleLogger = logger
        self.sm: RaspStateMachine = state_machine
        self.runner = runner

    def httpreq(self, packet):
        print(packet.summary())
        print("src/dst: "+packet[IP].src+" / "+packet[IP].dst)
        if packet.haslayer(Raw):
            print("Load: \n"+str(packet[Raw].load, "ASCII"))
        else:
            print("Load: None\n")

    def run(self) -> None:
        # TODO make the runner run the RASP server and client
        # TODO then do below?
        pkts = sniff(iface="wlp2s0", prn=httpreq, filter="tcp and port 80", count=10)
        # TODO then save the packets - possibly using the prn attribute


if __name__ == '__main__':
    def handler(packet):
        print(packet.summary())

    def httpreq(packet):
        print(packet.summary())
        print("src/dst: "+packet[IP].src+" / "+packet[IP].dst)
        if packet.haslayer(Raw):
            print("Load: \n"+str(packet[Raw].load, "ASCII"))
        else:
            print("Load: None\n")

    pkts = sniff(iface="wlp2s0", prn=lambda x: x.summary(), filter="tcp and port 80", count=10)
    i = 1
    for pkt in pkts:
        print("Packet "+str(i)+": ")
        i += 1
        pkt.show()
        print("src/dst: "+pkt[IP].src+" / "+pkt[IP].dst)
        if pkt.haslayer(Raw):
            print("Load: \n"+str(pkt[Raw].load, "ASCII"))
        else:
            print("Load: None\n")

    #sniff(iface="wlp2s0", prn=lambda x: x.summary(), filter="tcp and port 80")
    #sniff(iface="eth0", prn=handler)
    #sniff(count=10, iface="wlp2s0", prn=lambda x: x.summary())
