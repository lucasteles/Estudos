#include <cstdlib>
#include <stdio.h>

#define MAX 100

using namespace std;

void PrintaMatriz(double M[][MAX], int nTamanho);
double Fator(double M[][MAX],int nL1,int nL2,int nCOL);
int Ajust(double M[][MAX], double IDENT[][MAX],int tnLINHA, int tnMULT,int tnSOMA, int nDIMENSAO);

int main(int argc, char *argv[])
{
    
    //le tamanho da matriz
    int nTAM = 0;
    
    printf("Digite o tamanho da matriz quadrada:");
    scanf("%i",&nTAM);
    
    // cria matriz
    double nMAT[MAX][MAX];
    double nIDENT[MAX][MAX];
    
    for(int i=0; i<nTAM;i++)
    {
        for(int j=0;j<nTAM;j++)
        {
                printf("Valor da posição %i,%i :",i,j);
                scanf("%i",&nMAT[i][j]);                
                
        }
    }               
    
    
    
    printf("Matriz:");   
    PrintaMatriz(nMAT,nTAM);
    
    //PRIMEIRO QUADRANTE
    int AUX=0;
    double nFATOR = 0;
    for(int H = 1; nTAM; H--)
   	{
    	AUX = AUX + 1;
    	
    	for(int J = nTAM; J < 1+H; J--)	
   		{
    		nFATOR=Fator(nMAT, AUX ,J,H);
    		
    		if(Ajust(nMAT, nIDENT, AUX ,nFATOR,J, nTAM)==1)
    		{
            	//PRINTA()
    			PrintaMatriz(nMAT,nTAM);
             }
    		
    	}
     }
    
    system("PAUSE");
    return EXIT_SUCCESS;
}


void PrintaMatriz(double M[][MAX], int nTamanho)
{
     for(int i=0;i<nTamanho;i++)
     {
             printf("\n");
             for(int j=0; j < nTamanho;j++ )
             {
                
                printf("%3i ",M[i][j]);   
             
             }
     }
     
 }
 
 double Fator(double M[][MAX],int nL1,int nL2,int nCOL)
 {
        
        if(M[nL1,nCOL]==0)
            return 0;
            
	
	double nRET=(-(M[nL2][nCOL]))/M[nL1][nCOL];
	
	return nRET;
 }


int Ajust(double M[][MAX], double IDENT[][MAX],int tnLINHA, int tnMULT,int tnSOMA, int nDIMENSAO)
{
    
    if (tnMULT==0)
       return 0;
    
       
	//printf( "L"+TRANSFORM(tnSOMA)+"="+IIF(tnMULT<>1,TRANSFORM(tnMULT),'')+'L'+TRANSFORM(tnLINHA)+' + L'+TRANSFORM(tnSOMA) );
	printf( "\nL%i=%iL+%iL",tnSOMA,tnMULT,tnLINHA,tnSOMA );
	
	
	
	for(int I = 0; I < nDIMENSAO; I++)
		M[tnSOMA][I] = tnMULT*M[tnLINHA][I] + M[tnSOMA][I];
	
	
	for(int I = 0;I < nDIMENSAO;I++)
		IDENT[tnSOMA][I] = tnMULT*IDENT[tnLINHA][I] + IDENT[tnSOMA][I];
	
}
