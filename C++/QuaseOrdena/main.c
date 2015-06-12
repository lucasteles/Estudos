#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <windows.h>

void mostra(int* vetor, int n, int posCColor, int posCColor2, int posSwap, int posSwap2 ){

    HANDLE hConsole;
    hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    SetConsoleTextAttribute(hConsole, 15);

    if (posCColor >= 0)
        printf("~ compara-> ");

    if (posSwap >= 0)
        printf("~ troca  -> ");


    int i=0;
    for (; i<n; i++)
    {

        if ( (i==posCColor || i == posCColor2) && posCColor >= 0)
        {
            SetConsoleTextAttribute(hConsole, 47);
            printf("%i" ,vetor[i]);
            SetConsoleTextAttribute(hConsole, 15);
            printf(" ");
        }
        else if ( (i==posSwap || i == posSwap2) && posSwap >= 0 )
        {
            SetConsoleTextAttribute(hConsole, 79);
            printf("%i" ,vetor[i]);
            SetConsoleTextAttribute(hConsole, 15);
            printf(" ");
        }
        else
            printf("%i ", vetor[i]);
    }

    printf("\n");
    fflush(stdout);
}

bool swap(int* vetor, int i, int j){
    int mem = 0;
    if (vetor[i] > vetor[j])    {
        mem = vetor[j];
        vetor[j] = vetor[i];
        vetor[i] = mem;
        return true;
    }
    return false;
}

int* leParametros(int* size, int* vetor, int argc, char* argv[])
{
    int i=1;
    *size = argc-1;
    vetor = (int*)malloc(sizeof(int)*(argc-1));
    for (;i<argc;i++)
        vetor[i-1] = atoi (argv[i]);

    return vetor;
}

bool VerifOrdenado(int* vetor, int n)
{
    int i = 0;
    for (; i < n-1; i++)
        if (vetor[i] > vetor[i+1])
            return 0;

    return 1;
}

bool verificaUmaTroca(int* vetorEntrada, int n)
{
    int i = 0, j =0;
    int *vetor = (int*)malloc(sizeof(int)*n);
    memcpy (vetor, vetorEntrada, n * sizeof(int));


    for (; i < n; i++)
        for (j=i+1; j < n; j++)
        {
            mostra(vetor,n, i, j, -1, -1);
            if (swap(vetor, i, j))
            {
                if (VerifOrdenado(vetor, n))
                {
                    mostra(vetor,n, -1, -1, i, j);
                    swap(vetorEntrada, i, j);
                    return 1;
                }
                else    
                    memcpy (vetor, vetorEntrada, n*sizeof(int));
            }
            
        }

    return 0;
}

bool verificaUmaInversao(int* vetorEntrada, int n)
{
    int i = 0, init = 0, end=n-1;

    int *vetor = (int*)malloc(sizeof(int)*n);
    memcpy (vetor, vetorEntrada, n * sizeof(int));

    for (; i < n-1; i++)
       if (vetor[i] > vetor[i+1]){
            init = i;          
            break;
       }

    mostra(vetor,n, i, i, -1, -1);
    for (; i < n-1; i++)
       if (vetor[i] < vetor[i+1] ) {
            end = i;          
            break;
       }
    mostra(vetor,n, i, i, -1, -1);

    printf("-------- %i, %i\n", init, end );

    int mem = 0;
    for (i = 0; i <= (end-init)/2; i++) {
        mostra(vetor,n, -1, -1, init+i, end-i); 
        mem = vetor[end-i];
        vetor[end-i] = vetor[init+i];
        vetor[init+i] = mem;
    }

    int foi = VerifOrdenado(vetor, n);
    if (foi)
        memcpy (vetorEntrada, vetor, n*sizeof(int));

    return foi;
}

int main(int argc, char* argv[])
{
    int *vetor = NULL;
    int size=0;
    if (argc <= 1)
    {
        int aux[] = {19,5,9,3,2,1,50,-1};
        vetor = aux;
        size = sizeof(aux)/sizeof(int);
    } else {
       vetor = leParametros(&size,vetor, argc, argv );
    }

    if (size <= 1){
        mostra(vetor,size, -1, -1, -1, -1);
        return 0;
    }

    // verifica se ordena com uma troca
    printf("------------------\n"
            "Tenta com uma troca\n"
            "------------------\n");
    if (verificaUmaTroca(vetor, size))
    {
        printf("\n~ ordenado em 1 troca\n");
        mostra(vetor,size, -1, -1, -1, -1);
        exit(1);
    }
    else    
        printf("\n~ NAO ordenado em 1 troca\n\n");

    // verifica se ordena com uma inversao
    printf("------------------\n"
            "Tenta com uma inversao\n"
            "------------------\n");
    if (verificaUmaInversao(vetor, size))
    {
        printf("\n~ ordenado em 1 inversao\n");
        mostra(vetor,size, -1, -1, -1, -1);
        exit(1);
    }
    else    
        printf("\n~ NAO ordenado em 1 inversao\n\n");

    printf("------------------\n"
            "Tenta com varias trocas\n"
            "------------------\n");
    int i=1,
        count = 0,
        cache = -1;

    while(i<size){
        if (i > 0)
            mostra(vetor,size, i-1, i, -1, -1);
            

        if (i > 0 && swap(vetor, i-1, i) ){
            
            if (cache == -1)
                cache = i;

            i--;
            count++;
            
            mostra(vetor,size, -1, -1, i, i+1);

        } else {
            if (cache >= 0){      
                //printf(" -: (%i)\n", cache );      
                i=cache;
                cache=-1;
            }
            else    
                i++;
        }
    }

    

    printf("\n~ ordenado em %i trocas -> ", count);
    mostra(vetor,size, -1, -1, -1, -1);
    return 0;
}
