var WebSocketServer = require('ws').Server
  , wss = new WebSocketServer({port: 9000});
  
wss.on('connection', function(ws) {
    ws.on('message', function(message) {
        ws.send('voce disse: ' + message);
    });
    ws.send('Ola, voce se conectou!');
});
