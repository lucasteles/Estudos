// this.es

regioes = [
    new Sul(),
    new Norte(),
    new Leste(),
   	new Oeste()
];

// Sul
// ------------------------------------------
function Sul () {
	this.id = 2;
}

Sul.prototype.avalia = function(id){
	 return (this.id == id)
};

Sul.prototype.procedencia = function(){
	return "Sul"
}


// Norte
// ------------------------------------------
function Norte () {
	this.id = 3;
}

Norte.prototype.avalia = function(id){
	 return (this.id == id)
};

Norte.prototype.procedencia = function(){
	return "Norte"
}

// Leste
// ------------------------------------------
function Leste () {
	this.id = 5;
}

Leste.prototype.avalia = function(id){
	 return (this.id == id)
};

Leste.prototype.procedencia = function(){
	return "Leste"
}


// Oeste
// ------------------------------------------
function Oeste () {
	this.id = 7;
}

Oeste.prototype.avalia = function(id){
	 return (this.id == id)
};

Oeste.prototype.procedencia = function(){
	return "Oeste"
}