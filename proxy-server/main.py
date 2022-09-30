from proxy_server import ProxyServer


HOST = "127.0.0.1"
PORT = 65432


if __name__ == '__main__':
	ps = ProxyServer(HOST, PORT)
	ps.run()
