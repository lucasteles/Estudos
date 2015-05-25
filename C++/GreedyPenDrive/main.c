#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int* Sort(int *array,int N){
    int i,j,mem;
    for(i=0;i<N-1;i++)
        for(j=i+1;j<N;j++)
            if(array[i] > array[j]) {
                mem = array[j];
                array[j] = array[i];
                array[i] = mem;
            }
    return array;
}

void GenerateFiles(int *array,int N,int Max){
    srand(time(NULL));

    int i=0;
    for(;i<N;i++)
        array[i] = (int) 1 + (rand() % Max);
}

int Sum(int *array,int N){
    int i, ret = 0;
    for(i=0;i<N;i++)
        ret+=array[i];

    return ret;
}

int main()
{
    int PenDrive = 1000;
	int N = 27;
	
    int *Files = (int *)malloc(sizeof(int)* N);
    int i=0;

    GenerateFiles(Files, N, 100);
    Files = Sort(Files,N);

    printf("Tamanho Pendrive= %i \n",PenDrive);
    printf("Arquivos para copiar -> ");
    for(i=0;i<N ;i++)
        printf("%i ",Files[i]);
    printf("\n");

    int soma = Sum(Files,N);
    printf("MB's Total=%i \n\n",soma);
    soma = 0;

    //GULOSO
    for(i=0;i<N ;i++)
        if(PenDrive >= Files[i]){
            printf("+ %i MBs\n",Files[i]);
            PenDrive -= Files[i];
            soma += Files[i];
            Files[i] = 0;
        }
    printf("\nTotal Copiado=%i\n",soma);
    printf("MBs Sobra=%i\n",PenDrive);

    printf("Arquivos nao adicionados:");
    for(i=0;i<N ;i++)
        if(Files[i] !=0)
            printf("%i ",Files[i]);


    soma = Sum(Files,N);
    printf("\nMBs nao copiados=%i\n",soma);
    return 0;
}

