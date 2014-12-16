#include <stdio.h>
#include <stdlib.h>
#include "GeMem.h"

int main()
{
    GerMemInit();
    Memoria *Teste = Aloc(512);
    Memoria *Teste3 = Aloc(512);

    printf("Teste %d\n",Teste->nTam);
    printf("Teste3 %d\n",Teste3->nTam);

    return 0;
}
