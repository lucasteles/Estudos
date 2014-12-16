
http = require('http')


server = http.createServer (request, response) ->
  response.writeHead 200, {'Content-Type': 'text/html'}
  response.write '<html><body><h1>Hello World Node.js</h1></body></html>'
  response.end()

server.listen 3000

console.log 'Servidor Node.js em execucao :)'
