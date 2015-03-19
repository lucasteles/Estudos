 var sea = require('seaport');
 var ports = sea.connect('127.0.0.1', 9090);

/*
	 ports.get('pi-server',function(ps){	
		console.log(ps);	 

	 });
*/
ports.once('synced', function(){
	console.log(ports.query('pi-server'));
});

