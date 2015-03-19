'use-strict'

http = require 'http'
httpProxy = require 'http-proxy'

do ->
	argument = process.argv.splice(2)
	i = 0

	# Addresses to use in the round robin proxy
	addresses = [
		{
			host: 'http://127.0.0.1',
			port: '8001'
		},
		{
			host: 'http://127.0.0.1',
			port: '8002'
		},
		{
			host: 'http://127.0.0.1',
			port: '8003'
		}
	]

	proxy = httpProxy.createProxyServer()
	http.createServer (req, res) ->
		address = addresses[i]
		console.log address

		if address
			target = { target: "#{address.host}:#{address.port}" }
			proxy.web req, res, target

		i = (i + 1) % addresses.length
		return
	.listen(argument[0] || 8000)

	proxy.on 'open', (proxySocket) ->
		console.log 'Proxy Open'
		console.log proxySocket
		return

	proxy.on 'proxyRes', (proxyRes, req, res) ->
		json = JSON.stringify proxyRes.headers, true, 2
		console.log json
		return

	proxy.on 'close', (req, socket, head) ->
		console.log 'Proxy Close'
		return

	console.log "Server Running..."

	return
