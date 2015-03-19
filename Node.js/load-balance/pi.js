var args, estimatePi, http, ports, seaport, server;

args = process.argv.splice(2);

http = require('http');

seaport = require('seaport');

ports = seaport.connect('127.0.0.1', 9090);

estimatePi = function() {
  var i, inside, j, n, ref, x, y;
  n = Math.pow(10, 6);
  inside = 0;
  for (i = j = 0, ref = n; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
    x = Math.random();
    y = Math.random();
    if (Math.sqrt((x * x + y * y) <= 1)) {
      inside++;
    }
  }
  return 4 * inside / n;
};

server = http.createServer(function(req, res) {
  res.writeHead(200, {
    'Content-Type': 'text/plain'
  });
  res.end('Pi:' + estimatePi());
});

server.listen(ports.register('pi-server'));
