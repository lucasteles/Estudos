#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#define PI 3.14159265359

// declração de header de metodos de calculos
int Opcoes();
void PontoMedio();
void Trapezio();
void Simpson1_3();
void Simpson3_8();
void PontoMedioComp();
void TrapezioComp();
void CalcParts(double *);
double f(double);
double fl(double);
double integral(double,double);

// variaveis de auxilio
int nOpcao = -1,nFuncao,nIni,nFim,nPart;

// inicio do programa
int main()
{
    nFuncao  = 0;
    nOpcao   = -1;

    while(nOpcao!=0){
        // exibe opçoes
        if (Opcoes()==0)
            return 0;

        // executa de acordo com a escolha
        switch(nOpcao){
            case 1:
                printf("\n----------------------\n");
                printf("\nResultado:\n");
                PontoMedio();
                printf("\n----------------------\n");
                break;
            case 2:
                printf("\n----------------------\n");
                printf("\nResultado:\n");
                Trapezio();
                printf("\n----------------------\n");
                break;
            case 3:
                printf("\n----------------------\n");
                printf("\nResultado:\n");
                Simpson1_3();
                printf("\n----------------------\n");
                break;
            case 4:
                printf("\n----------------------\n");
                printf("\nResultado:\n");
                Simpson3_8();
                printf("\n----------------------\n");
                break;
            case 5:
                printf("\n----------------------\n");
                printf("\nResultado:\n");
                PontoMedioComp();
                printf("\n----------------------\n");
                break;
            case 6:
                printf("\n----------------------\n");
                printf("\nResultado:\n");
                TrapezioComp();
                printf("\n----------------------\n");
                break;
        }
        nFuncao=0,nIni=0,nFim=0;nOpcao=-1;
    }
    return 0;
}

int Opcoes()
{

    printf("\n\nEscolha um metodo de newton cotes:\n");
    printf("1 = Ponto medio\n");
    printf("2 = Trapezio\n");
    printf("3 = 1/3 de Simpson\n");
    printf("4 = 3/8 de Simpson\n");
    printf("5 = Ponto medio composto\n");
    printf("6 = Trapezio composto\n");
    printf("0 = Sair\n\n");

    while(nOpcao < 0 || nOpcao > 6){
        printf("Opcao-> ");
        scanf("%d",&nOpcao);
    }
    if(nOpcao==0)
        return 0;

    printf("\nEscolha uma funcao.\n");
    printf("1 = exp(x)\n");
    printf("2 = sin(x)\n");
    printf("3 = cos(x)\n\n");

    while(nFuncao < 1 || nFuncao > 3){
        printf("Opcao-> ");
        scanf("%d",&nFuncao);
    }

    printf("\nInicio do intervalo-> ");
    scanf("%d",&nIni);

    printf("\nFim do intervalo-> ");
    scanf("%d",&nFim);

    nPart = 1;
    if(nOpcao>3){
        printf("\nDividir em quantas partes-> ");
        scanf("%d",&nPart);
        if(nPart<=0)
            nPart = 1;
    }
    return nOpcao;
}

// f(x)
double f(double nX)
{
    double nRetorno = 0;

    switch(nFuncao){
        case 1:
            nRetorno = exp(nX);
            break;
        case 2:
            nRetorno = sin(nX);
            break;
        case 3:
            nRetorno = cos(nX);
            break;
    }
    return(nRetorno);
}

//integeal de f(x)
double fl(double nX)
{
    double nRetorno = 0;

    switch(nFuncao){
        case 1:
            nRetorno = exp(nX);
            break;
        case 2:
            nRetorno = -cos(nX);
            break;
        case 3:
            nRetorno = sin(nX);
            break;
    }
    return(nRetorno);
}

//intgral num intervalo
double integral(double nA,double nB){
    return fl(nB)-fl(nA);
}

void PontoMedio()
{
    double nEqua,nApro,nDif,nMed;
    nEqua = integral(nIni,nFim);

    nMed = (nFim - nIni);
    nApro = nMed * f((nFim + nIni)/2);

    nDif = fabs(nEqua - nApro);

    printf("Aproximacao = %f\n",nApro);
    printf("Equacao     = %f\n",nEqua);
    printf("Erro        = %f\n",nDif);
}

void Trapezio()
{
    double nEqua,nApro,nDif,nMed;
    nEqua = integral(nIni,nFim);

    nMed = (nFim - nIni);
    nApro = (f(nIni)+f(nFim))*nMed/2;

    nDif = fabs(nEqua - nApro);

    printf("Aproximacao = %f\n",nApro);
    printf("Equacao     = %f\n",nEqua);
    printf("Erro        = %f\n",nDif);
}

void Simpson1_3()
{
    double nEqua,nApro,nDif;
    nEqua = integral(nIni,nFim);
    double nH = (double)(nFim - nIni)/2;

    nApro = (nH/3)*(f(nIni) + (4*f(nH)) + f(nFim));

    nDif  = fabs(nEqua - nApro);

    printf("Aproximacao = %f\n",nApro);
    printf("Equacao     = %f\n",nEqua);
    printf("Erro        = %f\n",nDif);
}

void Simpson3_8()
{
    double nEqua,nApro,nDif,nMed;
    nEqua = integral(nIni,nFim);

    double nH = (double)(nFim - nIni);
    double nA,nB;

    nA = ((2*nIni)+nFim)/3;
    nB = ((2*nFim)+nIni)/3;

    nApro = ((nH*3)/8) * (f(nIni)+f(nFim)+(3* f(nA) )+(3* f(nB)));
    nDif = fabs(nEqua - nApro);

    printf("Aproximacao = %f\n",nApro);
    printf("Equacao     = %f\n",nEqua);
    printf("Erro        = %f\n",nDif);
}

void PontoMedioComp()
{
    double nParts[nPart];
    CalcParts(nParts);

    double nEqua,nApro = 0,nDif,nMed;
    nEqua = integral(nIni,nFim);

    int nI=0;
    for(nI=1;nI<nPart;nI++){
        nMed = (nParts[nI] - nParts[nI-1])/nPart;
        nApro = nApro+(f( (nParts[nI] + nParts[nI-1])/2  ))*nMed;
    }

    nDif = fabs(nEqua - nApro);

    printf("Aproximacao = %f\n",nApro);
    printf("Equacao     = %f\n",nEqua);
    printf("Erro        = %f\n",nDif);
}

void TrapezioComp()
{
    double nParts[nPart];
    CalcParts(nParts);

    double nEqua,nApro = 0,nDif,nMed;
    nEqua = integral(nIni,nFim);

    int nI=0;
    for(nI=1;nI<nPart;nI++){
        nMed = (nParts[nI] - nParts[nI-1]);
        nApro = nApro+(f(nParts[nI-1])+f(nParts[nI]))*nMed/2;
    }

    nDif = fabs(nEqua - nApro);

    printf("Aproximacao = %f\n",nApro);
    printf("Equacao     = %f\n",nEqua);
    printf("Erro        = %f\n",nDif);
}

void CalcParts(double * tnParts){
    int nJ;
    double nInt;

    for(nJ=1;nJ<=nPart;nJ++){
        nInt = (double) (nFim - nIni)/nPart;
        nInt = nInt*nJ;
        nInt = nIni + nInt;
        tnParts[nJ-1] = nInt;
    }
}
