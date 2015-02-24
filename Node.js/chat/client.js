

var net = require('net');
var client = new net.Socket();
var stdin = process.openStdin();

client.connect(8080, '127.0.0.1', function() {
	console.log('conectado');
	client.write("/name "+process.env['USERNAME']);
});
 
client.on('data', function(data) {
	console.log(String(data));
});
 
client.on('close', function() {
	console.log('Conexao fechada');
});


stdin.addListener("data", function(d) {

	 var data = d.toString().substring(0, d.length-2);
		  
     if (data=="/quit")
     {
     	client.destroy(); 
     }
     else	
     client.write(data);  
});