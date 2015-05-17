#include <stdio.h>
#include <stdlib.h>
#include "tools.c"
#include "fourier.c"

int main(int argc, char *argv[])
{
    PGMFile *file = (PGMFile*)malloc(sizeof(PGMFile));

    //teste!
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



