
net = require('net');
 

var clients = [];
var port = 8080;
var lastsocket = null;


server = net.createServer(function (socket) {
 

  socket.name = socket.remoteAddress + ":" + socket.remotePort 
  clients.push(socket);


  socket.write("Eae? " + socket.name + "\n");
  broadcast(socket.name + " entrou\n", socket);
 

  socket.on('data', function (data) {
    

    var command = String(data).replace("\n","").split(" ");
    if (command[0]=="/name")
    {
      if (command[1]!="")
      {
        data = socket.name+" mudou nome para "+command[1]+"\n";
        socket.name = command[1];
      }
      broadcast(data, null);
    }
    else
      broadcast(socket.name + '-> ' +data, socket);
  });
 

  socket.on('end', function () {
    clients.splice(clients.indexOf(socket), 1);
    broadcast(socket.name + " saiu.\n");
  });
  
  socket.on('error', function (e) {
    console.log(e);
    if (e.code == 'EADDRINUSE')
      console.log('Address in use, retrying...');

    if (e.code == 'ECONNRESET') 
      console.log('TCP conversation abruptly closed...');

      clients.forEach(function (client) {
          if (!client.writable)
          {
            clients.splice(clients.indexOf(client), 1);
            broadcast(socket.name + " saiu.\n");
          }
       });

      setTimeout(function () {
        server.close();
        server.listen(port);
        console.log('server online.');
      }, 500);
  });


  function broadcast(message, sender) {
    clients.forEach(function (client) {
      
      if (client === sender) return;

      if (client.writable)
        client.write(message);
        
    });
    
   process.stdout.write(message);
  }
 
});

server.listen(port);
 
console.log("Chat maroto rodando na porta "+port+"\n");