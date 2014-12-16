var http, server;

http = require('http');

server = http.createServer(function(request, response) {
  response.writeHead(200, {
    'Content-Type': 'text/html'
  });
  response.write('<html><body><h1>Hello World Node.js</h1></body></html>');
  return response.end();
});

server.listen(3000);

console.log('Servidor Node.js em execucao :)');

//# sourceMappingURL=index2.js.map
