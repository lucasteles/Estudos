
# calcula pi
args = process.argv.splice 2
http = require 'http'

estimatePi = ->
	n = Math.pow 10,6
	inside = 0
	
	for i in [0..n]
		x=Math.random()
		y=Math.random()
		if Math.sqrt (x*x + y*y) <= 1
			inside++
	
	return 4 * inside / n

#cria servidor

server = http.createServer (req,res) ->
	res.writeHead 200, {'Content-Type':'text/plain' }
	res.end 'Pi:'+estimatePi()
	return

server.listen(args[0] || 8000)

