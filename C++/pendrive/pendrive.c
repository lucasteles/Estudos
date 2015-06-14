#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int Sum(int *list,int N){
    int ret = 0, i=0;

    for(;i<N;i++)
        ret += list[i];

    return ret;
}

void GenerateFiles(int *Lista,int N, int Lim){
    
    srand (time(NULL));
    int i=0;
    for(;i<N;i++)
        Lista[i] = (int) (1 + (rand() % Lim));
}

int* Sort(int *list,int N){
    int aux;
    int i,j;
    for(i=0;i<N-1;i++)
        for(j=i+1;j<N;j++)
            if(list[i] > list[j])
            {
                aux = list[j];
                list[j] = list[i];
                list[i] = aux;
            }
    return list;
}

void printa(int* files, int N)
{
    printf("Arquivos: ");
    int i = 0;
    for (; i < N; i++)
        printf("%i, ", files[i] );

    printf("\n");
}

int main()
{
    int N = 50;
    
    int PenDrive = 4000;
    int *Arquivos = (int*)malloc(sizeof(int) * N);
    GenerateFiles(Arquivos, N, 300);

    int *Arq = Sort(Arquivos,N);


    printf("Total espeaço: %i\n", PenDrive);
    printa(Arq, N);

    int soma = 0, i=0;
    soma = Sum(Arq,N);
    printf("Total Arquivos (MB): %i \n",soma);

    for(i=0;i<N ;i++)
        if(PenDrive >= Arq[i]){
            printf("+ %i MB\n", Arq[i]);
            PenDrive -= Arq[i];
            Arq[i] = 0;
        }

    printf("Sobrou (MB): %i \n",PenDrive);

    soma= Sum(Arq,N);
    printf("Sobrou %i MB nos Arquivos!\n",soma);
    return 0;
}



