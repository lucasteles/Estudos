#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX 2000

void MultMatriz();
void ExibeMatriz();
void MultMatrizPararelo();

float M1[MAX][MAX];
float M2[MAX][MAX];
float MR[MAX][MAX]; 

int main (int argc, char *argv[])
{
	printf("%s\n", "Multiplicacao de Matriz!");

	for (int i = 0; i < MAX; i++)
	{
		for (int j = 0; j < MAX; j++)
		{
			M1[i][j] = 1 + (rand() % 10);
			M2[i][j] = 1 + (rand() % 10);
		}
	}

	clock_t oClock = clock();
	MultMatriz();
	float nNow = (float)(clock() - oClock) / CLOCKS_PER_SEC;
	printf("\n\n%.4f Segundos\n\n",nNow);

	double Start = omp_get_wtime();
	MultMatrizPararelo();
	double End = omp_get_wtime() - Start;
	printf("\n\n%g Segundos",End);
}

void MultMatriz()
{
	float R = 0;
	for (int i = 0; i < MAX; i++)
	{
		for (int j = 0; j < MAX; j++)
		{
			for (int z = 0; z < MAX; z++)
				R+=M1[i][j] * M2[j][i];
			
			MR[i][j] = R;
			R = 0;
		}
	}
	//ExibeMatriz();
}

void MultMatrizPararelo()
{
	int nThreads,tId,i,j,z;
	float R = 0;
	int CHUNK = 100;

	#pragma omp parallel shared(M1,M2,MR,nThreads,CHUNK) private(tId,i,j,z,R) num_threads(10)
	{
		tId = omp_get_thread_num();

		if(tId == 0){
			nThreads = omp_get_num_threads();
			printf("Total de threads = %i\n",nThreads);
		}
		#pragma omp for schedule(guided)
		for ( i = 0; i < MAX; i++)
		{
			for (j = 0; j < MAX; j++)
			{
				for (z = 0; z < MAX; z++)
					R+=M1[i][j] * M2[j][i];
				
				MR[i][j] = R;
				R = 0;
			}
		}
		
	}
}


void ExibeMatriz()
{
	printf("Resultado\n\n");

	for (int i = 0; i < MAX; i++)
	{
		for (int j = 0; j < MAX; j++)
		{
			printf("|");

			printf("%f", MR[i][j]);
		}
		printf("|\n");
	}
}
