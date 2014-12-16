#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Calculos.h"


Calculos::Calculos()
{

        Calculos::nG = 9.80665;
        Calculos::nVelocidadeAviao=0;
        Calculos::nRangeAcerto=0;
        Calculos::nPosAlvoX=0;
        Calculos::nPosAlvoY=0;
        Calculos::nPosCanhaoX=0;
        Calculos::nPosCanhaoY=0;
        Calculos::nAnguloEntradaAviao=0;
        Calculos::nAlcanceRadar=0;
        Calculos::nAlturaAviao=0;
        Calculos::nPosAviaoX=NULL;
        Calculos::nPosAviaoY=NULL;
        Calculos::AlvoDestruido=false;

        int nOK = Calculos::LeituraParametros();
        if ( nOK == 0)
            printf("Erro para carregar arquivos de parametrizacao!\n");

}

void Calculos::PosAviao(int nTempo, double* nX, double* nY, double* nZ)
{
    if (Calculos::nPosAviaoX==NULL && Calculos::nPosAviaoY==NULL)
    {
        //converte grau de entrada para saber cordenadas de entrada
        double nGrau = ((double)Calculos::nAnguloEntradaAviao/180) * M_PI;

        // calcula posição inicial
        Calculos::nPosAviaoX = sin(nGrau) * Calculos::nAlcanceRadar;
        Calculos::nPosAviaoY = cos(nGrau) * Calculos::nAlcanceRadar;

        double n90graus = 1.57079633;
        double nDifY = Calculos::nPosAviaoX-Calculos::nPosAlvoX;
        double nDifX = Calculos::nPosAviaoY-Calculos::nPosAlvoY;

        Calculos::nAnguloAviaoAlvo = n90graus + Calculos::AnguloGiro(nDifX,nDifY);
    }

    // faz regra pra traçar tragetoria da entrada ate o alvo
    double nCoefAng = ((double)Calculos::nPosAlvoY - Calculos::nPosAviaoY ) /
                        ((double) Calculos::nPosAlvoX - Calculos::nPosAviaoX);

    //double nCoefLin =Calculos::nPosAlvoY - nCoefAng * (Calculos::nPosAlvoX);
    //printf("\n %fx + %f \n",nCoefAng,nCoefLin);

    double nAngulo = fabs(atan(nCoefAng));

    // converte velocidade para m/s
    double nVelocidade = nVelocidadeAviao * 0.277777778;

    // verifica deslocamento total pelo tempo
    double nDeltaS = nVelocidade * ((double)nTempo/1000);



    // verifica distancia total do alvo
    double nDistanciaAlvo = sqrt( pow( *nX - Calculos::nPosAlvoX,2) +
                             pow( *nY - Calculos::nPosAlvoY,2));

    Calculos::nAviaoPercorrido=nDeltaS;
    Calculos::nDistAviaoAlvo=nDistanciaAlvo;


    //veririfica se chegou no alvo
    if ( Calculos::nDistAviaoAlvo <= Calculos::nRangeAcerto)
    {
         Calculos::nDistAviaoAlvo = 0;
         Calculos::AlvoDestruido = true;
    }



    //calcula deslocamento nos eixos X e Y
    if (*nX > Calculos::nPosAlvoX)
        *nX = Calculos::nPosAviaoX - (cos(nAngulo) * nDeltaS);
    else
        *nX = Calculos::nPosAviaoX + (cos(nAngulo) * nDeltaS);

    if (*nY > Calculos::nPosAlvoY)
        *nY = Calculos::nPosAviaoY - (sin(nAngulo) * nDeltaS);
    else
        *nY = Calculos::nPosAviaoY + (sin(nAngulo) * nDeltaS);

    *nZ = Calculos::nAlturaAviao;

    Calculos::nAnguloCanhaoAviao = Calculos::AnguloGiro(*nY,*nX);

}


double Calculos::AnguloDisparo(int tnVelocidade, int tnAltura, double tnDistancia, double tnAnguloBase)
{

    //comverte para m/s
    double nGunSpeed = (tnVelocidade);
    double nSpeedX  = 0,nSpeedY  = 0, nBY=0;
    double nAngulo=tnAnguloBase;
    bool lLoop = true;
    int nTry = 0;

    while(lLoop ) //&& nTry<100)
    {

        nSpeedX = cos(nAngulo) * nGunSpeed;
        nSpeedY = sin(nAngulo) * nGunSpeed;

        nBY  = (tnDistancia) * tan(nAngulo) - ( Calculos::nG * pow(tnDistancia,2))/(2*(pow(nSpeedX,2)));

        if (tnAltura >= nBY-((double)Calculos::nRangeAcerto/10) &&
            tnAltura <= nBY+((double)Calculos::nRangeAcerto/10))
            lLoop = false;

        if (nBY > tnAltura )
            nAngulo-= (nAngulo*0.001);
        else
            nAngulo+= (nAngulo*0.001);

        nTry++;
    }

    return nAngulo;

}

void Calculos::PosBala(TiroCanhao toTiro,double tnPasso, double *nX, double *nY, double *nZ)
{

    // verica qual vai se ro tempo da bala,
    double nPasso;
    nPasso = (float( toTiro.TempoTiro ) /  CLOCKS_PER_SEC);
    nPasso = tnPasso - nPasso;

    /*
    if (tnPasso==0) //caso nao passe tempo o tempo geral calcula a diferença pelo trempo atual
        nPasso = (float( clock () - toTiro.TempoTiro ) /  CLOCKS_PER_SEC);
    else
    {
        nPasso = (float( toTiro.TempoTiro ) /  CLOCKS_PER_SEC);
        nPasso = tnPasso - nPasso;
    }
    */

    if(nPasso<0)
    {
        // corrige caso a leitura do winsock tenha sido depois do loop do gdi
        *nX=0;
        *nY=0;
        *nZ=0.001;
        return;
    }


    double Vxy = cos(toTiro.AnguloAltura) * Calculos::nGunSpeed;
    double Vz = sin(toTiro.AnguloAltura) * Calculos::nGunSpeed;

    double deslocxy = nPasso * Vxy;

    //deslocamento em XY
    *nX = cos(toTiro.AnguloGiro) * deslocxy;
    *nY = sin(toTiro.AnguloGiro) * deslocxy;

    *nX = *nX + Calculos::nPosCanhaoX;
    *nY = *nY + Calculos::nPosCanhaoY;

    *nZ = Vz * nPasso - .5 * Calculos::nG * pow(nPasso , 2);

}


double Calculos::AnguloGiro(double tnX,double tnY)
{

    double nAngulo = 0;
    double nModulo = sqrtf( pow(tnX,2) + pow(tnY,2));
    double nX = fabs(tnX);
    double nY = fabs(tnY);
    double PI = 3.14159265358979323846;


    if ( nModulo == 0)
    {
        nModulo = 1;
    }


    //Primeiro quadrante
    if (tnX >= 0 && tnY >= 0)
    {
        if (nX >= nY)
        {
            nAngulo = asin(nY / nModulo);
        }
        else
        {
            nAngulo = acos(nX / nModulo);
        }
    }

    //segundo quadrante
    if (tnX < 0 && tnY >= 0)
    {
        nAngulo = PI / 2;
        if (nX >= nY)
        {
            nAngulo += acos(nY / nModulo);
        }
        else
        {
            nAngulo += asin(nX / nModulo);
        }
    }


    //Terceiro quadrante
    if (tnX < 0 && tnY < 0)
    {
        nAngulo = PI;
        if (nX >= nY)
        {
            nAngulo += asin(nY / nModulo);
        }
        else
        {
            nAngulo += acos(nX / nModulo);
        }
    }

    //Terceiro quadrante
    if (tnX >= 0 && tnY < 0)
    {
        nAngulo = (3 * PI) / 2;
        if (nX >= nY)
        {
            nAngulo += asin(nX / nModulo);
        }
        else
        {
            nAngulo += acos(nY / nModulo);
        }
    }


    return nAngulo;
}


double Calculos::CalcDistancia(double X1, double Y1, double X2, double Y2)
{
    return( (double) sqrt( pow(X2-X1,2) + pow(Y2-Y1,2) ) );
}

double Calculos::xx(double tnV, int nTamTela)
{
    return ( (tnV/(double)Calculos::nAlcanceRadar)*(double)nTamTela);
}

int Calculos::LeituraParametros()
{

    char *line = NULL,*Var = NULL,*cValue = NULL;
    size_t nLen = 30;
    FILE *fp = fopen("Parametros.txt","r");

    //alocando spaço
    line=(char*)malloc(nLen);
    Var=(char*)malloc(nLen);
    cValue=(char*)malloc(nLen);

    //limpando espaço alocado
    memset(line,'\0',nLen);

    if( fp == NULL ) {
        return 0;
    }

    int tpLeitura = 0;
    while( fgets(line,nLen,fp) ) {

        memset(cValue,'\0',nLen);
        memset(Var,'\0',nLen);
        tpLeitura = 0;

        for(int nC=0; nC < nLen; nC++)
        {
            if (line[nC]==';' || line[nC]=='#' )
               break;

            if(line[nC]!='=' && tpLeitura==0)
                Var[nC]=line[nC];
            else
            {
                if (tpLeitura==0)
                    tpLeitura=nC+1;
            }


            if (tpLeitura!=0 && line[nC]!='=')
                 cValue[nC-tpLeitura] = line[nC];

           }

           //apos carregar parametro di arqivo verifica qual é
           if ( strcmp(Var,"AlcanceRadar") == 0)
               Calculos::nAlcanceRadar=atoi(cValue);

            if ( strcmp(Var,"velocidade") == 0)
               Calculos::nVelocidadeAviao=atoi(cValue);

            if ( strcmp(Var,"variacaoAcerto") == 0)
               Calculos::nRangeAcerto=atoi(cValue);

            if ( strcmp(Var,"posAlvoX") == 0)
               Calculos::nPosAlvoX=atoi(cValue);

            if ( strcmp(Var,"posAlvoY") == 0)
               Calculos::nPosAlvoY=atoi(cValue);

            if ( strcmp(Var,"posCanhaoX") == 0)
               Calculos::nPosCanhaoX=atoi(cValue);

            if ( strcmp(Var,"posCanhaoY") == 0)
               Calculos::nPosCanhaoY=atoi(cValue);

            if ( strcmp(Var,"AnguloEntradaAviao") == 0)
               Calculos::nAnguloEntradaAviao=atoi(cValue);

            if ( strcmp(Var,"AlturaAviao") == 0)
               Calculos::nAlturaAviao=atoi(cValue);

            if (strcmp(Var,"VelocidadeBala") == 0)
                 Calculos::nGunSpeed =atoi(cValue)*0.277777778;

            if ( strcmp(Var,"PortaSock") == 0)
                Calculos::nPortaSock = atoi(cValue);

            if ( strcmp(Var,"IP_Radar") == 0)
                strcpy(Calculos::cIP_Radar, cValue);

    }

    free(line);
    free(cValue);
    free(Var);
    return 1;

}
