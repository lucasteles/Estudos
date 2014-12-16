#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <graphics.h>
#include <math.h>

void DesenhaGrafico (double,double);
void DesenhaLinha (double,double,double,double);
void DesenhaEscala (void);
double PixelToCode (int, char);
double f(double);
int CodeToPixel (double, char);
using namespace std;

//Propriedades
int nEscala = 50;
int nXTela  = 1024;
int nYTela  = 768;
int nXCentro = nXTela / 2;
int nYCentro = nYTela / 2;


int main( )
{
    initwindow( nXTela , nYTela , "GraficoLimite" ); //Cria a tela do grafico
    setbkcolor(WHITE); // Muda a cor do fundo
    cleardevice(); // Limpa a tela
    DesenhaEscala(); // Desenha a escala de fundo
    double nIni,nFim,nH; //Variaveis de controle do inicio e fim do intervalo
    int nPart;
    
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
    cout << "\n -- Tabela Diferencial -- \n";
    cout << "|  x  |  f(x)  | Diferença |  x medio  | \n";
    
    // Cria os intevalos
    double nValores[nPart][4] ;
    
    // Zera todos os valores
    for(int nI = 0; nI < nPart;nI++)
    {
        nValores[nI][0] = 0;
        nValores[nI][1] = 0;
        nValores[nI][2] = 0;
        nValores[nI][3] = 0;
    }
    
    //seta valor H de divisão
    nH=(nFim-nIni)/nPart;
    
    
    //Monta Grafico
    double nAux;
    for(int i=0;i<=nPart;i++)
    {
        
        nAux=nIni+(i*nH);
	   	nValores[i][0] = nAux;
    	nValores[i][1] = f(nAux);
    	nValores[i][2] = (f(nAux+nH) - nValores[i][1])/nH;
    	nValores[i][3] = (nAux*2+nH)/2;
        
        DesenhaGrafico(nValores[i][0],nValores[i][1]); 
        DesenhaGrafico(nValores[i][3],nValores[i][2]); 
        
        cout << "  |  ";
        cout << nValores[i][0];
        cout << "  |  ";
        cout << nValores[i][1];
        cout << "  |  ";
        cout << nValores[i][2];
        cout << "  |  ";
        cout << nValores[i][3];
        cout << "  |  \n";
        
        
    }
    
    for(int i=0;i<=nPart;i++)
    {
       
        setcolor(BLUE); 
        DesenhaLinha(nValores[i][0],nValores[i][1],nValores[i+1][0],nValores[i+1][1]);
        
        setcolor(RED);  
        DesenhaLinha(nValores[i][3],nValores[i][2],nValores[i+1][3],nValores[i+1][2]);
    }
        
    
    while( !kbhit() ); 
	closegraph( );
	return(0);
}

double f(double x){
    double Ret;
    Ret= (-2*pow(x,2))+1;
    return Ret;
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
    
    //setcolor(BLACK);
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


