#include <cstdlib>
#include <iostream>
#include <stdio.h>
#include <math.h>
#include "graficos.h"

using namespace std;

void MatrizVanderMonde();
void CalcErro();
int Fatorial(int);


Graficos oGraf;

int main(int argc, char *argv[])
{
    oGraf.nEscala = 5;
    oGraf.nXTela = 1000;
    oGraf.nYTela = 1000;
    double nFun,nCalc;
    int nI,nTest = 6;
    bool lMais = false;
    nCalc = 1;
    for(nI=2;nI<=8;nI=nI+2){
        printf("%d - ",nI);
        if(lMais){
            lMais = false;
            nCalc = nCalc + (pow(nTest,nI)/Fatorial(nI));
        }
        else{
            lMais = true;
            nCalc = nCalc - (pow(nTest,nI)/Fatorial(nI));
        }
        printf("%f\n",nCalc);
    }
    
    nCalc = 1 - (pow(nTest,2)/Fatorial(2));
    nCalc = nCalc + (pow(nTest,4)/Fatorial(4));
    nCalc = nCalc-(pow(nTest,6)/Fatorial(6));
    nCalc = nCalc+(pow(nTest,8)/Fatorial(8));
    printf("%f\n",nCalc);
    
    CalcErro();
    system("PAUSE");
    return EXIT_SUCCESS;
}

void CalcErro(){
    int nOpcao=0;
    int nIni,nFim,nPre;
    bool lParar = false;
    
    printf("Escolha um intervalo inicial -> ");
    scanf("%d",&nIni);
        
    printf("Escolha um intervalo final -> ");
    scanf("%d",&nFim);
    
    printf("Precisao -> ");
    scanf("%d",&nPre);
    
    while(!lParar){
        printf("\nEscolha a Funcao!\n\n1-Sen(x)\n2-Cos(x)\n3-Exp(x)\nOpcao -> ");
        scanf("%d",&nOpcao);

        if(nOpcao > 0 and nOpcao < 4)
            lParar = true;
    }
    oGraf.CriarTela();
    oGraf.DesenhaEscala();
    
    int nX, nI;
    double nFun,nCalc;
    double nXAnt1,nYAnt1,nXAnt2,nYAnt2;
    bool lMais;
    
    if(nOpcao==1){
        lMais = false;
        
        for(nX=nIni;nX<=nFim;nX++){
            // formula X - (X^i)/i! + (X^i+1)/i+2! - (X^i+2)/i+2! ...
            nCalc = nX;                
            for(nI=3;nI<=nPre;nI=nI+2){
                if(lMais){
                    lMais = false;
                    nCalc = nCalc + (pow(nX,nI)/Fatorial(nI));
                }
                else{
                    lMais = true;
                    nCalc = nCalc - (pow(nX,nI)/Fatorial(nI));
                }
            }
            nFun  = sin(nX);
                            
            if(nX > 1){
                // desenha linha do seno    
                oGraf.nRed   = 0;
                oGraf.DesenhaLinha(nXAnt1,nYAnt1,nX,nFun);
            }
            nXAnt1 = nX;
            nYAnt1 = nFun;
            
            if(nX > 1){
                // desenha linha do erro
                oGraf.nRed   = 255;
                oGraf.DesenhaLinha(nXAnt2,nYAnt2,nX,nCalc);
            }
            nXAnt2 = nX;
            nYAnt2 = nCalc;
            
            printf("Sen(%d) = %f\n",nX,nFun);
            printf("%d      = %f\n",nX,nCalc);
        }
    }
    
    if(nOpcao==2){
        lMais = false;
        
        for(nX=nIni;nX<=nFim;nX++){
            // formula 1 - (X^i)/i! + (X^i+1)/i+2! - (X^i+2)/i+2! ...
            nCalc = 1;
            for(nI=2;nI<=nPre;nI=nI+2){

                if(lMais){
                   lMais = false;
                   nCalc = nCalc + (pow(nX,nI)/Fatorial(nI));
                }
                else{
                    lMais = true;
                    nCalc = nCalc - (pow(nX,nI)/Fatorial(nI));
                }
            }
            nFun  = cos(nX);
                            
            if(nX > 1){
                // desenha linha do seno    
                oGraf.nRed   = 0;
                oGraf.DesenhaLinha(nXAnt1,nYAnt1,nX,nFun);
            }
            nXAnt1 = nX;
            nYAnt1 = nFun;
            
            if(nX > 1){
                // desenha linha do erro
                oGraf.nRed   = 255;
                oGraf.DesenhaLinha(nXAnt2,nYAnt2,nX,nCalc);
            }
            nXAnt2 = nX;
            nYAnt2 = nCalc;
            
            printf("Cos(%d) = %f\n",nX,nFun);
            printf("%d      = %f\n",nX,nCalc);
        }
    }
    
    if(nOpcao==3){        
        for(nX=nIni;nX<=nFim;nX++){
            // formula 1 + (X^i)/i! + (X^i+1)/i+1! ...
            nCalc = 1;                
            for(nI=1;nI<=nPre;nI++){
                nCalc = nCalc + (pow(nX,nI)/Fatorial(nI));
            }
            nFun  = exp(nX);
                            
            if(nX > 1){
                // desenha linha do seno    
                oGraf.nRed   = 0;
                oGraf.DesenhaLinha(nXAnt1,nYAnt1,nX,nFun);
            }
            nXAnt1 = nX;
            nYAnt1 = nFun;
            
            if(nX > 1){
                // desenha linha do erro
                oGraf.nRed   = 255;
                oGraf.DesenhaLinha(nXAnt2,nYAnt2,nX,nCalc);
            }
            nXAnt2 = nX;
            nYAnt2 = nCalc;
            
            printf("Exp(%d) = %f\n",nX,nFun);
            printf("%d      = %f\n",nX,nCalc);
        }
    }
}

int Fatorial(int nX){
    int nN,nFat = 1;
    nN = nX;
    while(nN > 1)
    {
        nN--;
        nFat = nN * nFat;
    }
    nFat = nX * nFat;
    return nFat;
}
