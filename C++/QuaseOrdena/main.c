#include <stdio.h>
#include <stdbool.h>
#include <windows.h>

void mostra(int* vetor, int n, int posCColor, int posSwap ){

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

        if (i==posCColor || i == posCColor+1 && posCColor >= 0)
        {
            SetConsoleTextAttribute(hConsole, 47);
            printf("%i" ,vetor[i]);
            SetConsoleTextAttribute(hConsole, 15);
            printf(" ");
        }
        else if (i==posSwap || i == posSwap+1 && posSwap >= 0)
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
}

bool swap(int* vetor, int i){
    int mem = 0;
    if (vetor[i-1] > vetor[i])    {
        mem = vetor[i];
        vetor[i] = vetor[i-1];
        vetor[i-1] = mem;
        return true;
    }
    return false;
}

int main()
{
    int vetor[] = {19,5,9,3,2,1,50,-1};
    int size = sizeof(vetor)/sizeof(int);

    if (size <= 1){
        mostra(vetor,size, -1, -1);
        return 0;
    }
    int i=1;
    while(i<size){
        if (i > 0)
            mostra(vetor,size, i-1, -1);

        if (i > 0 && swap(vetor,i) ){
            i--;
            mostra(vetor,size, -1, i);
        } else {
            i++;
        }
    }

    printf("\n~ ordenado-> ");
    mostra(vetor,size, -1, -1);
    return 0;
}
