#include <stdio.h>
#include <stdlib.h>
#include "tools.c"
#include "fourier.c"

int main(int argc, char *argv[])
{
    PGMFile *file = (PGMFile*)malloc(sizeof(PGMFile));


    // ira receber como parametro na executavel
    argv[1] = "baboon.pgm";
    argv[2] = "baboon2.pgm";

    printf("reading file...\n");
    ReadPGM(argv[1], file);

    printf("calculating...\n");

    /*
    INumber n1;
    n1.R=10;
    n1.I=5;

    INumber n2;
    n2.R=5;
    n2.I=2;


    INumber n3 = Multipl(n1,n2);
    //teste calculo
    printf("n3=%f+%fi \n",n3.R,n3.I);
    */



    printf("saving file...\n");
    SavePGM(argv[2], file);

    free(file);
    return 0;
}

void CalcFourier(PGMFile *file)
{
    int i,j;
    int w = file->width;
    int h = file->height;

    file->imatrix = (INumber**)alloc_Imatrix(h,w);

    for(i=0;i<h;i++)
        file->imatrix[i] = Fourier(file->matrix[i],i,w,0);

    file->espectro = alloc_matrix(h,w);

    for(i=0;i<h;i++)
        for(j=0;j<w;j++)
            file->espectro[i][j] = Espectro(file->imatrix[i][j]);
}


INumber* Fourier(int *matriz,int l,int h,int inversa)
{
    int Neg = (inversa ? 1 : -1);
    
    int N = h;
    int freq,t=0;
    INumber *frequencies = malloc(sizeof(INumber) * N);

    for (freq = 0; freq < N; freq++) {
        double re = 0;
        double im = 0;

        for (; t < N; t++) {
            double time= (double)t;
            double var = matriz[t];

            double rate = Neg * (2.0 * PI) * freq * time / N;

            double re_part = var * cos(rate);
            double im_part = var * sin(rate);

            re += re_part;
            im += im_part;
        }

        if(inversa){
            re = re / N;
            im = im / N;
        }

        frequencies[freq].r = re;
        frequencies[freq].i = im;
    }

    return frequencies;
}


int Espec(INumber num){
    return (int)log(1 + sqrt(num.r*num.r + num.i*num.i));
}