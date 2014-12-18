#include <stdlib.h>
#include <stdio.h>
#include "FileManager.h"

int main()
{


	// iterações abrindo o arquivo uma vez e lendo varios parametros

	//abre arquivo
	FILE* arq = gdp_files_open("parameters.txt");

	char* teste = NULL, *filho = NULL;
	int idade = 0;
	double altura = 0.00;

	teste = gdp_files_getstring(arq, "nome");
	printf("name: %s \n", teste);
	free(teste);

	teste = gdp_files_getstring(arq, "profissao");
	printf("occupation: %s \n", teste);
	free(teste);

	idade = gdp_files_getint(arq,"idade");
	printf("Age: %i \n", idade);


	altura = gdp_files_getfloat(arq,"altura");
	printf("height: %f \n", altura);

	// fecha arquivo
	gdp_files_close(arq);



	/// iterações de busca rapida de parametros (nao recomendado para leitura continua de um arquivo)
	teste = gdp_files_quick_getstring("Parameters.txt","nome");
	idade = gdp_files_quick_getint("Parameters.txt","idade");
	altura = gdp_files_quick_getfloat("Parameters.txt","altura");
	printf("%s %i %f \n\n",teste,idade,altura);
	free(teste);

	//lendo aqruivo filho
	teste = gdp_files_quick_getstring("Parameters.txt","filho");
	filho = gdp_files_quick_getstring(teste,"nome");

	printf("nome do filho: %s\n",filho);
	free(teste);
	free(filho);


	system("PAUSE");
	return 0;
}