#include <iostream>
#include <math.h>
#include <stdio.h>
#define MAX 3
#define PI 3

double f(double);
double fl(double);

using namespace std;

void PrintaMatriz(double M[][MAX],double I[][MAX], int nTamanho);
void LimpaMatriz(double M[][MAX], int nTamanho);
void Acerta_Diagonal(double M[][MAX],double I[][MAX],int nDIMENSAO);
double Fator(double M[][MAX],int nL1,int nL2,int nCOL);
void Cria_identidade(double I[][MAX], int nTAM);
int Ajust(double (*M)[MAX], double (*IDENT)[MAX],int tnLINHA, double tnMULT,int tnSOMA, int nDIMENSAO);
void InvertMatriz(double (*nMAT)[MAX],double (*nIDENT)[MAX],int nTAM);

int nN,nM;
int nD,nA;
int nFunc;
double nStep;

int main()
{
    nM    = MAX;
    nN    = 5;
    nD    = 0;
    nA    = 1;
    nFunc = 1;
    double nX[nN];
    double nT = nA - nD;
    nStep = nT/(nN-1);
    double nTabelaX[MAX][MAX],nTabelaY[MAX],nTabelaA[MAX],nTabelaI[MAX][MAX],nAux;

    // limpa vetores
    for(int nI = 0;nI < nM;nI++)
        for(int nJ = 0;nJ < nM;nJ++)
            nTabelaX[nI][nJ] = 0;

    for(int nI = 0;nI < nM;nI++)
        nTabelaY[nI] = 0;

    int nJ = 0;

    for(double nI = 0;nI <= nT;nI=nI+nStep){
        nX[nJ] = nD + nI;
        nJ++;
    }

    for(int nI = 0;nI < nM;nI++){
        for(int nJ = 0;nJ < nM;nJ++){
            for(int nK = 0;nK < nN;nK++){
                nTabelaX[nI][nJ] = nTabelaX[nI][nJ] + pow(nX[nK],(nI+nJ));
            }
            printf("    %f",nTabelaX[nI][nJ]);
        }

        for(int nK = 0;nK < nN;nK++){
            nTabelaY[nI] = nTabelaY[nI] + pow(nX[nK],nI) * f(nX[nK]);
        }
        printf("   =    %f", nTabelaY[nI]);
        printf("\n");
    }
    printf("\n\n");

    // inverte a matriz para fazer o sistema linear
    InvertMatriz(nTabelaX,nTabelaI,nM);

    for(int nI=0;nI<nM;nI++){
        nAux=0;
        for(int nJ=0;nJ<nM;nJ++){
             nAux = nAux + nTabelaI[nI][nJ] * nTabelaY[nJ];
             printf("\n%f",nTabelaI[nI][nJ]);
        }
        printf("\n");
        nTabelaA[nI] = nAux;
    }
    printf("\n\nResultado:\n");
    for(int nI=0;nI<nM;nI++){
        if(nI==0)
            printf("%f",nTabelaA[nI]);
        else
            printf("+%f^%d",nTabelaA[nI],nI);
    }
    printf("\n\n");

    return 0;
}

double f(double tnX){
    double nRetorno;

    switch(nFunc){
    case 1:
        nRetorno = exp(tnX);
        break;
    case 2:
        nRetorno = cos(tnX);
        break;
    case 3:
        nRetorno = sin(tnX);
        break;
    }
    return nRetorno;
}

double fl(double tnX){
    double nRetorno;

    switch(nFunc){
    case 1:
        nRetorno = exp(tnX);
        break;
    case 2:
        nRetorno = cos(tnX);
        break;
    case 3:
        nRetorno = sin(tnX);
        break;
    }
    return nRetorno;
}

void InvertMatriz(double (*nMAT)[MAX],double (*nIDENT)[MAX],int nTAM)
{
    LimpaMatriz(nIDENT,MAX);
    Cria_identidade(nIDENT,MAX);

    //PRIMEIRO QUADRANTE
    int AUX=0;
    double nFATOR = 0;
    for(int H = 0; H < nTAM; H++)
   	{
    	for(int J = nTAM-1; J > H; J--)
   		{
    		nFATOR=Fator(nMAT, AUX ,J,H);
    		if(Ajust(nMAT, nIDENT, AUX ,nFATOR,J, nTAM)==1)
            {
                //PrintaMatriz(nMAT,nIDENT,nTAM);
            }
    	}
    	AUX++;
     }

     //SEGUNDO QUADRANTE
    AUX=nTAM;

    for(int H = nTAM-1; H > 0; H--)
    {
        AUX--;
        for(int J = 0; J < H;J++)
        {
            nFATOR=Fator(nMAT, AUX ,J,H);
            if(Ajust(nMAT, nIDENT, AUX ,nFATOR,J, nTAM)==1)
    		{
            	//PRINTA()
    			//PrintaMatriz(nMAT,nIDENT, nTAM);
             }
        }
    }
    Acerta_Diagonal(nMAT,nIDENT,nTAM);

}

double Fator(double M[][MAX],int nL1,int nL2,int nCOL)
 {
    if(M[nL1,nCOL]==0)
        return 0;

	double nRET=(-(M[nL2][nCOL]))/M[nL1][nCOL];

	return nRET;
 }


int Ajust(double (*M)[MAX], double (*IDENT)[MAX],int tnLINHA, double tnMULT,int tnSOMA, int nDIMENSAO)
{
    if (tnMULT==0)
       return 0;

	//printf( "L"+TRANSFORM(tnSOMA)+"="+IIF(tnMULT<>1,TRANSFORM(tnMULT),'')+'L'+TRANSFORM(tnLINHA)+' + L'+TRANSFORM(tnSOMA) );
	//printf( "\n\n L%i = %8.2f * L%i +L%i \n",tnSOMA+1,tnMULT,tnLINHA+1,tnSOMA+1 );

    double N1,N2;

	for(int I = 0; I < nDIMENSAO; I++)
    {
        N1=M[tnLINHA][I];
        N2=M[tnSOMA][I];
        M[tnSOMA][I] = tnMULT*N1 + N2;
    }

	for(int I = 0; I < nDIMENSAO; I++)
    {
        N1=IDENT[tnLINHA][I];
        N2=IDENT[tnSOMA][I];
        IDENT[tnSOMA][I] = tnMULT*N1 + N2;
    }

    return 1;
}

void LimpaMatriz(double M[][MAX], int nTAMANHO)
{
    for(int n1=0; n1 < nTAMANHO;n1++)
    {
        for(int n2=0; n2<nTAMANHO; n2++)
        {
            M[n1][n2]=0;
        }
    }
}

void Cria_identidade(double I[][MAX], int nTAM)
{
    for(int x=0; x<nTAM;x++)
        I[x][x]=1;
}

void Acerta_Diagonal(double M[][MAX],double I[][MAX], int nDIMENSAO)
{
    for(int Y=0;Y<nDIMENSAO;Y++)
    {
        if (M[Y][Y] != 1)
		{
            for(int X = 0; X<nDIMENSAO;X++)
                I[Y][X]= I[Y][X] / M[Y][Y];

            M[Y][Y]	= 1;
		}
    }
}

