'use-strict'
seaport = require 'seaport'
ports = seaport.connect '127.0.0.1', 9090
http = require 'http'
httpProxy = require 'http-proxy'

argument = process.argv.splice(2)

i =0

ports.once 'synced', ->

	proxy = httpProxy.createProxyServer()
	http.createServer (req, res) ->
		addresses = ports.query('pi-server')

		if !addresses.length
			res.writeHead(503,{'Content-Type':'text/plain'}
			res.end('Serviço quebrado'))
			return

		address = addresses[i]
		if address
			target = { target: "http://#{address.host.split(':')[3]}:#{address.port}" }
			console.log 'server:', target
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
