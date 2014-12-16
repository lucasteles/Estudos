#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <graphics.h>
#include <math.h>

void DesenhaGrafico (double,double);
void DesenhaLinha (double,double,double,double);
void DesenhaEscala (void);
double PixelToCode (int, char);
int CodeToPixel (double, char);

using namespace std;

//Propriedades
int nEscala = 30;
int nXTela  = 600;
int nYTela  = 600;
int nXCentro = nXTela / 2;
int nYCentro = nYTela / 2;
int nEtapa = 10;

int main( )
{
    initwindow( nXTela , nYTela , "GraficoLimite" ); //Cria a tela do grafico
    setbkcolor(WHITE); // Muda a cor do fundo
    cleardevice(); // Limpa a tela
    DesenhaEscala(); // Desenha a escala de fundo
    double nIni,nFim; //Variaveis de controle do inicio e fim do intervalo
    int nPart; //variavel de divisão do intervalo
    
    //LE AS INFORMAÇÕES DO USUARIO
    cout << "Digite o inicio do intervalo.\n";
    cout << "- ";
    cin >> nIni;
    cout << "Digite o final do intervalo.\n";
    cout << "- ";
    cin >> nFim;
    cout << "Digite a divisão do intervalo.\n";
    cout << "- ";
    cin >> nPart;
    
    // Cria os intevalos
    double nValores[nEtapa][2] ;
    // Zera todos os valores
    for(int nI = 0; nI < nEtapa;nI++)
    {
        nValores[nI][0] = 0;
        nValores[nI][1] = 0;
    }
        
    
    // Desenha todos os pontos calculados no grafico
    for(int nI = 0; nI < nEtapa;nI++)
    {
        if(nI > 0)
        {
             DesenhaLinha(nValores[nI - 1][0],nValores[nI - 1][1],nValores[nI][0],nValores[nI][1]);
        }
       // DesenhaGrafico(nValores[nI][0],nValores[nI][1]); // Desenha o ponto no grafico
    }
    
    while( !kbhit() ); 
	closegraph( );
	return(0);
}

void DesenhaGrafico(double tnX,double tnY)
{
    int nX = CodeToPixel(tnX,'X');
    int nY = CodeToPixel(tnY,'Y');
    
    char cBuffer[30];
    
    sprintf( cBuffer, "(%g,%g)", tnX , tnY);
    
    settextstyle(2,1,4);
    outtextxy( nX + 20, nY - 2, cBuffer );
    putpixel(nX,nY, COLOR(0,0,0));	   
}

void DesenhaLinha(double tnX1,double tnY1,double tnX2,double tnY2)
{
    int nX1 = CodeToPixel(tnX1,'X');
    int nY1 = CodeToPixel(tnY1,'Y');
    int nX2 = CodeToPixel(tnX2,'X');
    int nY2 = CodeToPixel(tnY2,'Y');
    
    setcolor(BLACK);
    line(nX1,nY1,nX2,nY2);	   
}

void DesenhaEscala()
{   int nAux  = 0;
    int nLine = 2;
    
    for(int nI = 0;nI <= nXTela; nI++)
    {
            if(nAux == nI)
            {
                setcolor(BLACK);
                line(nI,nYCentro,nI,nYCentro - nLine);
                //outtextxy(nI + nLine,nYCentro + nLine*5, (nAux/nEscala)); 
                nAux+=nEscala;
            }
            putpixel(nI,nYCentro, COLOR(0,0,0));
    }
    
    nAux = 0;
    for(int nI = 0;nI <= nYTela; nI++)
    {
            if(nAux == nI)
            {
                setcolor(BLACK);
                line(nXCentro,nI,nXCentro + nLine,nI);
                nAux+=nEscala;
            }
            putpixel(nXCentro,nI, COLOR(0,0,0));
    }
}

double PixelToCode(int tnPixel, char tcTipo)
{
     int nCentro = 0;
     
     if(tcTipo == 'X'){nCentro = nXCentro;}
     else{nCentro = nYCentro;}
     
     if(tnPixel == nCentro){return(0);}
     
     double nCode = (double) ((tnPixel - nCentro) / nEscala);
     
     if(tcTipo == 'X'){return(nCode);}
     else{return(-nCode);}
}

int CodeToPixel(double tnCode, char tcTipo)
{
     int nCode = (int) (tnCode * nEscala);
     int nCentro = 0;
     
     if(tcTipo == 'X'){nCentro = nXCentro;}
     else{nCentro = nYCentro;}
     
     if(tnCode == 0){return(nCentro);}
     
     if(tcTipo == 'X'){return(nCentro + nCode);}
     else{return(nCentro - nCode);}
}
