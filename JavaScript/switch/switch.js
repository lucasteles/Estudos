// switch 

function main()  {
	console.log( buscaRegiao(2) );
	console.log( buscaRegiao(3) );
	console.log( buscaRegiao(4) );
	console.log( buscaRegiao(7) );
}

 function buscaRegiao(valor) {
        switch (valor) {
        case 2:
            return "Sul";
        case 3:
            return "Norte";
        case 5:
            return "Leste";
        case 7:
            return "Oeste";
        default:
            return "Região não encontrada.";
    }
}

main();