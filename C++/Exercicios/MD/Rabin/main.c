#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void EucExt(int, int ,int* , int* );
int Cryption(int,int);
void Decryption(int,int,int,int);
int VePrimo(int);


/* run this program using the console pauser or add your own getch, system("pause") or input loop */
int main(int argc, char *argv[]) {
	int nX = 0;
	
	char cInput[] = "o";
	
	// CHR da letra
	int nL = 0;
	int nC[strlen(cInput)];
	//numeros primos(CHAVE PRIVADA)
	int nP = 179;
	int nQ = 43;
	// CHAVE PUBLICA
	int nN = nP*nQ;
	
	printf("Original = %s \n\n",cInput);
	printf("Ascii = ");
	for(nX;nX<strlen(cInput);nX++){
		printf("%i ",(int)cInput[nX]);
	}
	
	printf("\nChave Publica = %i \n\n",nN);
	printf("Criptografado = ");
	
	nX = 0;
	for(nX;nX<strlen(cInput);nX++){
		nL = (int)cInput[nX];
		nC[nX] = Cryption(nN,nL);
	}
	printf("\n");
	
	// numeros primos para descriptografar
	nP = 179;
	nQ = 43;
	printf("DeCriptografado = ");
	nX = 0;
	for(nX;nX<strlen(cInput);nX++){
		Decryption(nP,nQ,nN,nC[nX]);
	}
	printf("\n\n");

	system("Pause");
	
	return 0;
}

int Cryption(int tnN,int tnL){
    int nResult = (int) ((tnL*tnL)%tnN);

    printf("%i",nResult);
    return(nResult);
}

void Decryption(int tnP,int tnQ,int tnN,int tnC){
	int nK = 1,nX;
	for (nK ; nK < tnN ; nK++){
		nX=(nK*nK)%tnN;
		if(nX==tnC){
			printf("%c ",(char)nK);
			//break;
		}
	}
	//cResult = (char)nZ;
    //printf("%c",cResult);
}

void EucExt (int tnA, int tnB, int *tnX, int *tnY) 
{		
	int nGcd;
    *tnX=0, *tnY=1; 
    int nU=1, nV=0, nM, nN, nQ, nR;
    nGcd = tnB;
    
    while (tnA!=0) {
        nQ	= nGcd/tnA; 
        nR	= nGcd%tnA;
        nM	= *tnX-nU*nQ; 
        nN	= *tnY-nV*nQ;
        nGcd = tnA; 
        tnA = nR; 
        *tnX = nU; 
        *tnY = nV; 
        nU	= nM; 
        nV	= nN;
	}
}

int VePrimo(int tnN){
	
	return(0);
}

int QuadradosRepetidos(int tnB,int tnR,int tnN){
	int nX = 0,nResto,nI=1;
	int nRb[20];
	nResto = tnR;
	
	while(nResto!=0){
		nRb[nX] = nResto % 2;
		nResto = nRb[nX];
		nX++;
	}
	
	int nAux = 1,nC,nD=1;
	nI=1;
	//for(nI;nI<nX;nI++){
	//	nD = nAux*
		
//		if nRb[nI]==1
	//		nC = nD*
		
		
		
	//}
	
	
	
	
	
}
