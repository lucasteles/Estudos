#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <math.h>
#include <windows.h>

#define NUMTHR 4 // Numero total de threads
#define NUMCHA 20000000 // Numero total de "flechas"

double nPtos [NUMTHR]; // Total de pontos da thread
double nPCir [NUMTHR]; // Pontos no circulo

void *Calcular (void *tnParam); // sorteia e verifica os pontos pela thread
double fRand(double fMin, double fMax);

int main (int argc, char *argv[])
{
    int nI;
    double nPi = 0; // contem o valor de pi
    int nTPoints = 0; // total de pontos
    int nTCirc = 0; // pontos no circulo
    pthread_t oTid[NUMTHR]; // ID das threads

    // cria todas as threads
    for (nI = 0; nI< NUMTHR ; nI++)
    {
        // cria a i-esima thread
        pthread_create (&oTid[nI], NULL, Calcular, (void*)nI);
    }

    // Para cada thread
    for (nI = 0; nI< NUMTHR ; nI++)
    {
        // espera que as threads terminem
        pthread_join (oTid[nI], NULL);
    }

    for (nI = 0; nI < NUMTHR; nI++)
    {
        nTPoints += nPtos[nI];
        nTCirc += nPCir[nI];

        /*
        int a =nPCir[nI];
        int b = nPtos[nI];

        printf("ACERTOS %i: %i \n",nI, a);
        printf("Tenta %i: %i \n",nI, b);

        printf("PI por Thread: %.9f\n\n",(((double)nPCir[nI]/(double)nPtos[nI])));*/
    }

    // Calcula o valor de pi e imprime na tela
    nPi = 4.0*((double)nTCirc/(double)nTPoints); // transforma totalp
    // e totalc em double
    printf("Valor de PI:%.20f \n",nPi);
    system("pause");
}

void *Calcular (void *tnParam)
{
    int nI;
    int nThrNum = (int)tnParam; // O número da thread ()
    double nX,nY,nQuad;
    nPtos[nThrNum] = 0;
    nPCir[nThrNum] = 0;


    for (nI = 0; nI < (NUMCHA/NUMTHR); nI++)
    {
        nX = (double)rand()/RAND_MAX; // sorteia um número
        nY = (double)rand()/RAND_MAX; // sorteia um número
        nQuad =sqrt(pow(nX-0.5,2)+pow(nY-0.5,2));

        // Se a soma dos quadrados for menor que R = 0.5
        if (nQuad <= .5)
        {
            nPCir[nThrNum] ++; // conta pontos no círculo
        }
        nPtos[nThrNum] ++; // incrementa os pontos totais da thread N (0 a 9)
    }
    pthread_exit(0);
}
