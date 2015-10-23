// switch 

function main()  {
	console.log( buscaRegiao(2) );
	console.log( buscaRegiao(3) );
	console.log( buscaRegiao(4) );
	console.log( buscaRegiao(7) );
}

 function buscaRegiao(valor) {
    for (var regi of regioes) {
        if (regi.avalia(valor))
            return regi.procedencia();
    };

    return "Região não encontrada.";
}


main();