from .listener import Listener
from python_fuzzer.loggers.simple_logger import SimpleLogger
from python_fuzzer.state_machines.rasp_state_machine import RaspStateMachine
from scapy.all import *

class RaspListener(Listener):
    def __init__(self, logger: SimpleLogger, state_machine: RaspStateMachine) -> None:
        self.logger: SimpleLogger = logger
        self.sm: RaspStateMachine = state_machine

    def httpreq(packet):
        print(packet.summary())
        print("src/dst: "+packet[IP].src+" / "+packet[IP].dst)
        if packet.haslayer(Raw):
            print("Load: \n"+str(packet[Raw].load, "ASCII"))
        else:
            print("Load: None\n")

    def run(self) -> None:
        pkts = sniff(iface="wlp2s0", prn=httpreq, filter="tcp and port 80", count=10)

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
