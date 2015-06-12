#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include "PGM.h"
#include <limits.h>
#include <math.h>
#include <time.h>


void CalcFourier(PGM*,int);
void ParallelFourier(INumber**,INumber**,int,int,int);
void Fourier(INumber **,INumber **,int,int,int);
INumber FourierFunc(INumber **,int,int,int,int,int,int);

double Espectro(INumber);
int Normalize(double,double);

int main(int argc, char *argv[])
{

    if (argc>1 && argc < 5)
    {
        printf("usage:\n fourier <origem> <inversa> <espectro> [I|P] \n I=iterativo\n P=Paralelo");
        exit(0);
    }

    printf("%s\n","Processando...");

    char *entrada = "imagem.pgm";
    char *saida   = "inversa.pgm";
    char *espectro= "espectro.pgm";
    char *tipo    = "P";

    if(argc > 1){
        entrada = argv[1];
        saida   = argv[2];
        espectro= argv[3];
        tipo    = argv[4];
    }

    printf("Arquivo do Original:%s\n",entrada);
    printf("Arquivo da inversa:%s\n",saida);
    printf("Arquivo do Espectro:%s\n",espectro);
    
    PGM *file = (PGM*)malloc(sizeof(PGM));

    readfile(entrada, file);

    switch (*tipo){
        case 'I':
            printf("%s\n","Rodando Padrao...");
            CalcFourier(file,0);
            break;
        case 'P':
            printf("%s\n","Rodando Paralelo...");
            CalcFourier(file,1);
            break;
    }

    PGM *fileinv = (PGM*)malloc(sizeof(PGM));
    fileinv->height = file->height;
    fileinv->width = file->width;
    fileinv->maxGray = file->maxGray;
    fileinv->matrix = file->matrixinv;

    PGM *fileesp = (PGM*)malloc(sizeof(PGM));
    fileesp->height = file->height;
    fileesp->width = file->width;
    fileesp->maxGray = file->maxGray;
    fileesp->matrix = file->norespectro;

    savefile(saida, fileinv);
    savefile(espectro, fileesp);
    
    free(fileesp);
    free(file);
    free(fileinv);

    printf("%s","Concluido!");
    return 0;
}

void CalcFourier(PGM *file,int parallel)
{
    int i,j;
    int w = file->width;
    int h = file->height;

    INumber** imatrix = (INumber**)alloc_Imatrix(h,w);
    file->imatrix     = (INumber**)alloc_Imatrix(h,w);

    for(i=0;i<h;i++)
        for(j=0;j<w;j++){
            imatrix[i][j].r = (double)file->matrix[i][j];
            imatrix[i][j].i = 0;

            file->imatrix[i][j].r = 0;
            file->imatrix[i][j].i = 0;
        }
    // calculo do fourier, roda paralelo ou nao depedendo do paramatro
     printf("Calculando fourier...");
     fflush(stdout);
    if(parallel)
    {
    	double Start = omp_get_wtime();
        ParallelFourier(file->imatrix,imatrix,h,w,0);
        double End = omp_get_wtime() - Start;
		printf("\nTerminado: %.4f Segundos\n",End);
    }
    else
    {
    	clock_t oClock = clock();
        Fourier(file->imatrix,imatrix,h,w,0);
        double nNow = (float)(clock() - oClock) / CLOCKS_PER_SEC;
        printf("\nTerminado: %.4f Segundos\n",nNow);
    }

    free_Imatrix(imatrix,h);

    // CALCULO DO ESPECTRO
    file->espectro = (double**)alloc_dmatrix(h,w);
    file->maxespectro = 0;

    for(i=0;i<h;i++){
        for(j=0;j<w;j++){
            file->espectro[i][j] = Espectro(file->imatrix[i][j]);

            if(file->maxespectro < file->espectro[i][j])
                file->maxespectro = file->espectro[i][j];
        }
    }

    file->norespectro = (int**)alloc_matrix(h,w);
    for(i=0;i<h;i++)
        for(j=0;j<w;j++)
            file->norespectro[i][j] = Normalize(file->espectro[i][j],file->maxespectro);

    //free_Imatrix(file->espectro,h);

    file->imatrixinv =(INumber**)alloc_Imatrix(h,w);

    // calculo do fourier inverso, roda paralelo ou nao depedendo do paramatro
    printf("Calculando inversa...");
    fflush(stdout);
    if(parallel)
    {
    	double Start = omp_get_wtime();
    	
        ParallelFourier(file->imatrixinv,file->imatrix,h,w,1);
        double End = omp_get_wtime() - Start;
		printf("\nTerminado: %.4f Segundos\n",End);
    }
    else
    {
    	clock_t oClock = clock();
        Fourier(file->imatrixinv,file->imatrix,h,w,1);
        double nNow = (float)(clock() - oClock) / CLOCKS_PER_SEC;
        printf("\nTerminado: %.4f Segundos\n",nNow);
    }

    file->matrixinv = (int**)alloc_matrix(h, w);

    for(i=0;i<h;i++)
        for(j=0;j<w;j++){
            file->matrixinv[i][j] = Normalize(file->imatrixinv[i][j].r,255);
        }
    //free_Imatrix(file->imatrixinv,h);
}

void ParallelFourier(INumber **iMatriz,INumber **Matriz,int h,int w,int Inversa)
{
    int freq,i;
    #pragma omp parallel shared(iMatriz,Matriz,h,w,Inversa) private(i,freq)  num_threads(10)
	{

		#pragma omp for schedule(dynamic)
		for (i = 0; i < h; i++) {
            for (freq = 0; freq < w; freq++) {
                iMatriz[i][freq] = FourierFunc(Matriz,i,freq,freq,w,1,Inversa);
            }
        }
	}

	#pragma omp parallel shared(iMatriz,Matriz,h,w,Inversa) private(i,freq)  num_threads(10)
	{
		#pragma omp for schedule(dynamic)
		for (i = 0; i < w; i++) {
            for (freq = 0; freq < h; freq++) {
                Matriz[freq][i] = FourierFunc(iMatriz,freq,i,freq,h,0,Inversa);
            }
        }
	}

	iMatriz = Matriz;
}

void Fourier(INumber **iMatriz,INumber **Matriz,int h,int w,int Inversa)
{
    int freq,i;

    for (i = 0; i < h; i++) {
        for (freq = 0; freq < w; freq++) {
            iMatriz[i][freq] = FourierFunc(Matriz,i,freq,freq,w,1,Inversa);
        }
    }

    for (i = 0; i < w; i++) {
        for (freq = 0; freq < h; freq++) {
            Matriz[freq][i] = FourierFunc(iMatriz,freq,i,freq,h,0,Inversa);
        }
    }

    iMatriz = Matriz;
}

double Espectro(INumber var)
{
    long double a = var.r*var.r;
    long double b = var.i*var.i;
    long double T = sqrtf(a + b);
    double nlog = logf(1 + T);

    return nlog;
}

INumber FourierFunc(INumber **Matriz,int Y,int X,int Freq,int N,int Line,int Inversa)
{
    INumber Retorno;
    double re = 0;
    double im = 0;
    int t;
    double Nt = (double)N;

    int Neg = -1;
    if(Inversa)
        Neg = 1;

    for (t = 0; t < N; t++) {
        double time = (double)t;
        double Fr = (double)Freq;
        INumber var;

        // define se vai correr entre as linhas ou colulas
        if(Line){
            var = Matriz[Y][t];
        }
        else{
            var = Matriz[t][X];
        }

        double rate = Neg * (2.0 * PI) * Fr * time / Nt;

        INumber Part;
        Part.r = cos(rate);
        Part.i = sin(rate);

        INumber Result = IMult(var,Part);

        re += Result.r;
        im += Result.i;
    }

    if(Inversa){
        re = re / Nt;
        im = im / Nt;
    }

    Retorno.r = re;
    Retorno.i = im;

    return Retorno;
}

int Normalize(double Var,double Max)
{
    double N = Max;
    int retorno = (int)((Var/N)*255);

    if(retorno > 255)
        retorno = 255;

    if(retorno < 0)
        retorno = 0;

    return retorno;
}
