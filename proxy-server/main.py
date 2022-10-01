from proxy_server import ProxyServer

HOST: str = "127.0.0.1"
PORT: int = 65432

if __name__ == '__main__':
	ps: ProxyServer = ProxyServer(HOST, PORT)
	ps.run()
