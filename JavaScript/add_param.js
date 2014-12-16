function inserirParametro(key, value)
{
	key = encodeURI(key); value = encodeURI(value);

	var urlKeys = document.location.search.substr(1).split('&');

	var i=urlKeys.length; var x; 

	while(i--) 
	{
		x = urlKeys[i].split('=');

	if (x[0]==key)
	{
		x[1] = value;
		urlKeys[i] = x.join('=');
		break;
	}
	}

	if(i<0) {urlKeys[urlKeys.length] = [key,value].join('=');}

	document.location.search = urlKeys.join('&'); 
}