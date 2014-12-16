#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int main(){
	int pid = fork();
	FILE *arq;
	const char arqNome[] = "Filho.txt";	

	if(pid==0){
		//thread filha
		//cria arquivo para filho guardar "tentativas"
		arq = fopen(arqNome, "w");
	
	}
	else if(pid>0){
		//Thread Pai
		//* do nothing *//
	}

	//quantidade de tentativas
	int vezes = 10000000;

	int hit=0;
	int miss=0;

	//"joga os flchas" e conta o numero de acertos e erros
	int cont = 0;
	for( ; cont<vezes; cont++){
		double x = (double)rand()/RAND_MAX;
		double y = (double)rand()/RAND_MAX;

		double dist;
		dist = sqrt(pow(x-0.5,2)+pow(y-0.5,2));

		if(dist>0.5)
		{
			miss+=1;
		}
		else
		{
			hit+=1;
		}
	}

	if(pid==0){
	//thread filha
	//salva resultados no txt
	fprintf(arq, "%d", hit);
	fprintf(arq, "\n");
	fprintf(arq, "%d", miss);
	}
	else if(pid>0){
		//thread pai
		//espera a thread filha finalizar
		int status_ret;
		wait(&status_ret);

		//busca no aqruivo as informações
		int hit2;
		int miss2;
		FILE *arq = fopen(arqNome, "r");
		fscanf(arq, "%d\n%d", &hit2, &miss2);

		//sumariza hits e miss (pai + filho)
		int hitTotal = hit2 + hit;
		int missTotal = miss2 + miss;
		int jogadasTotal = hitTotal + missTotal;	

		//calcula e imprime o resultado
		printf("acertos=%d\nerros=%d\n", hitTotal, missTotal);
		double pi = 4.0*((double)hitTotal)/(double)jogadasTotal;
		printf("\nAproximacao PI=%lf\n", pi);
	}
	return(EXIT_SUCCESS);
}


