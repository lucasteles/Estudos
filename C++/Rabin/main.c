#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void EucExt(int, int ,int* , int* );
int Cryption(int,int);
void Decryption(int,int,int,long);
void Decryption2(int,int,int,int);
void Decryption3(int,int,int,int);
int Primo(int);
int ToDecimal(int[],int);
int VerifBits(int[]);
void ToBin(int);
int str2map(char);
int AT(const char*, char);

int gBits[64];
int gnBits;


/* run this program using the console pauser or add your own getch, system("pause") or input loop */
int main(int argc, char *argv[]) {

    int nX = 0;

	// messagem para ser criptografada
	char cInput[40];

	printf("Palavra: ");
    scanf("%s", cInput);
	// CHR da letra
	int nL = 0;
	int nC[strlen(cInput)];
	//numeros primos(CHAVE PRIVADA)
	int nP = 179; //GeraPr3Mod4(0);
	int nQ = 43; //GeraPr3Mod4(nP);

	// CHAVE PUBLICA
	int nN = nP*nQ;

	printf("\n\nOriginal = %s \n\n",cInput);
	printf("Criptografado = ");
	for(nX=0;nX<strlen(cInput);nX++){
		nL = 22;//(int)cInput[nX];
		nC[nX] = Cryption(nN,nL);
	}
	printf("\n");

	// numeros primos para descriptografar
	printf("DeCriptografado = ");

	for(nX=0;nX<strlen(cInput);nX++){
		Decryption(nP,nQ,nN,nC[nX]);
	}
	printf("\n\n");

	system("Pause");

	return 0;
}

int Cryption(int tnN,int tnL){
    int nBits[12],n2Bits[12],nX=0,nResto,nI=0,nDec;

    // limpa o vetor
    for(nX=0;nX<12;nX++){
        nBits[nX]=0;
        n2Bits[nX]=0;
	}

	nResto = tnL;
    nX = 0;
	while(nResto!=0){
		nBits[nX] = nResto % 2;
		nResto    = (int)nResto/2;
		nX++;
	}
	nX=0;
    for(nI=4;nI<12;nI++){
        n2Bits[nI]=nBits[nX];
        nX++;
    }
    // adiciona mais os 4 ultimos bits
    for(nI=0;nI<4;nI++){
        n2Bits[nI]=nBits[nI];
    }
	nDec = ToDecimal(n2Bits,12);

    int nResult = (int)(nDec*nDec)%tnN;

    printf("%i",nResult);
    return(nResult);
}

void Decryption(int tnP,int tnQ,int tnN,long tnC){
	char cResult;
	int nX,nY;
	long int nA,nRP,nRQ,nZ;
	long int nXP,nYQ,nCRQ,nCRP;
	long nM1,nM2,nM3,nM4;

	// calculo o X e Y
	EucExt (tnP, tnQ, &nY, &nX);
	nXP = nX*tnP;
	nYQ = nY*tnQ;


	nRP = (tnP+1)/4;
	nRQ = (tnQ+1)/4;


	nCRQ = QuadradosRepetidos(tnC,nRQ, tnN);
	nCRP = QuadradosRepetidos(tnC,nRP, tnN);

	// M1
	nM1 = ((nXP*nCRQ)  + (nYQ*nCRP)) % tnN;
	// M2
	nM2 = ((nXP*nCRQ)  - (nYQ*nCRP)) % tnN;
	// M3
	nM3 = (-(nXP*nCRQ) + (nYQ*nCRP)) % tnN;
	// M4
	nM4 = (-(nXP*nCRQ) - (nYQ*nCRP)) % tnN;

	//cResult = (char)nZ;
    printf("m1=%i m2=%i m3=%i m4=%i \n",nM1,nM2,nM3,nM4);
}

void EucExt (int tnA, int tnB, int *tnX, int *tnY){
	int nT = 0;
	if(tnA>tnB){
		nT  = tnA;
		tnA = tnB;
		tnB = nT;
	}
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

int QuadradosRepetidos(int tnB,int tnR,int tnN){

    ToBin(tnR);
    long long nA,nC,nB,nP;
    int nI=0, nJ=0;
    nB=tnB; nC=1;

    for(nI; nI<gnBits; nI++)
    {
        nA=gBits[nI];

        if (nA==1){
            nP = nA * (pow(2,nI));

             nB = tnB;
             for(nJ=1;nJ<nP;nJ++)
            {
                nB *= tnB;
                nB = nB % tnN;
            }



            nC = (nC*nB);
        }
    }

    nC = nC % tnN;
    return nC;

}

int VerifBits(int tnBits[]){
	int nBits[8];
	int nI,nX,nResult=0;

	for(nX=0;nX<8;nX++)
        nBits[nX]=0;

	nX=0;
	for(nI=4;nI<12;nI++){
		nBits[nX] = tnBits[nI];
		nX++;
	}

	for(nI=0;nI<4;nI++)
		if(nBits[nI] == tnBits[nI])
			nResult++;

	return(nResult);
}

int GeraPr3Mod4(int nAnterior){
    // CRIA UM NUMERO PRIMO 3 MOD 4
	int nPr;

    if (nAnterior==0)
        nAnterior=3;

	nPr = (int) ( rand()%512 +512);
	while(((nPr-nAnterior)%4) != 0 || Primo(nPr) == 0)
    	nPr = (int) (rand()%512 +512);

	return(nPr);
}

int Primo(int tnN){
	int nN=1,nX;

	for(nX=2;nX<tnN;nX++){
		if((tnN%nX)==0){
			nN = 0;
			break;
		}
	}

	return(nN);
}

int ToDecimal(int tnNum[],int tnBit){
    int nX = 0,nDecimal=0,nP;
	for(nP=0;nP<tnBit;nP++)
		nDecimal+=pow(2,nP)*tnNum[nP];

    return(nDecimal);
}

void ToBin(int Num){

int char2map(char str){
  char* mapa = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
  int pos=AT(mapa, str)+10;;
  return retorno;
}

int AT(const char* str, char c){
    int i;
    for (i = 0; i < strlen(str); i++)
    {
        if (str[i] == c)
            return i;
    }
    return -1;
}

    int nX=0,nResto,nI=0,nDec;
	nResto = Num;
    nX = 0;
	while(nResto!=0){
		gBits[nX] = nResto % 2;
		nResto    = (int)nResto/2;
		nX++;
	}
    gnBits = nX;


}