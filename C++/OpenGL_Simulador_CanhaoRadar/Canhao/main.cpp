#include <stdio.h>
#include <windows.h>
#include <math.h>
#include <time.h>
#include "..\Classes\WinSockClass.h"
#include "..\Classes\Calculos.h"

using namespace std;

//cab dos metodos
bool BuscaAviao(double*,double*,double*);

//variaveis paracanhao
Calculos RADAR; // inicia classe de radar
int nPort = RADAR.nPortaSock; // porta para se conectar com o client
WinSockClass oWinSock = WinSockClass(nPort);
clock_t tNow;
double tnNow,tnNow2;

double nSpeed = 0;


int main()
{
    system("PAUSE");
    // inicia o client
	if(oWinSock.IniciaClient(RADAR.cIP_Radar)==0)
        return 0;

    double AviaoX1, AviaoY1, AviaoZ1;
    double AviaoX2, AviaoY2, AviaoZ2;
    double AviaoTiroX, AviaoTiroY, AviaoTiroZ;

    for(int nG=0; nG<3; nG++)
    {
        printf("Tiro %i \n",nG+1);

        //-------------------------------------------------
        // guarda o tempo pra descontar o delay de rede
        tNow  = clock();
        if (!BuscaAviao(&AviaoX1,&AviaoY1,&AviaoZ1))
        {
            system("cls");
            printf("\nAVIAO DESTRUIDO!\n");
            break;
        }

        //calcula delay
        tnNow = (float( clock () - tNow ) /  CLOCKS_PER_SEC);
        //-------------------------------------------------


        printf("Primeira cordenada aviao: x, y, z \n");
        printf("(%.2f, %.2f, %.2f) \n\n",AviaoX1,AviaoY1,AviaoZ1);

        Sleep(3000);

        //------------------------------------------------
        // guarda o tempo pra descontar o delay de rede
        tNow  = clock();
        if (!BuscaAviao(&AviaoX2,&AviaoY2,&AviaoZ2))
        {
            system("cls");
            printf("\nAVIAO DESTRUIDO!\n");
            break;
        }
         //calcula delay
        tnNow2 = (float( clock () - tNow ) /  CLOCKS_PER_SEC);
        //-------------------------------------------------

        printf("Segunda cordenada aviao: x, y, z \n");
        printf("(%.2f, %.2f, %.2f) \n\n",AviaoX2,AviaoY2,AviaoZ2);


        //calcula velocidade do aviao
        nSpeed = sqrt( pow(AviaoX2-AviaoX1,2)+
                       pow(AviaoY2-AviaoY1,2)+
                       pow(AviaoZ2-AviaoZ1,2) )/(3+tnNow+tnNow2);

        //nSpeed = 41.66666666666667;

        printf("Velocidade do aviao: %.2f k/h \n", nSpeed*3.6 );


         //calcula onde aviao estara em  segundos
        double Ang = RADAR.AnguloGiro( AviaoX2-AviaoX1 , AviaoY2-AviaoY1); //atan( (AviaoX2-AviaoX1)/(AviaoY2-AviaoY1) );

        //deslocamento 10 segundos apos ultima posição
        double DeltaS = nSpeed * 10;

        AviaoTiroX = AviaoX2 + cos(Ang)*DeltaS;
        AviaoTiroY = AviaoY2 + sin(Ang)*DeltaS;
        AviaoTiroZ = AviaoZ2;


        double nDistCanhaoAviao = RADAR.CalcDistancia(AviaoTiroX,AviaoTiroY,
                            (double)RADAR.nPosCanhaoX, (double)RADAR.nPosCanhaoY);

        double nAngTiro = 0.78539816; //angulo base 45° para achar verdadeiro angulo de tiro
        double nAngXy = RADAR.AnguloGiro( AviaoTiroX-RADAR.nPosCanhaoX ,AviaoTiroY-RADAR.nPosCanhaoY);
        double nAngZ  = RADAR.AnguloDisparo(RADAR.nGunSpeed, AviaoTiroZ, nDistCanhaoAviao, nAngTiro);

        double nTempoTiroChegarNoAviao = nDistCanhaoAviao / (RADAR.nGunSpeed*cos(nAngZ));
        nTempoTiroChegarNoAviao*=1000;

        Sleep(10000-nTempoTiroChegarNoAviao);
        Proxy *oProxy = (Proxy *)malloc(sizeof(Proxy));
        oProxy->AviaoX          = 0;
        oProxy->AviaoY          = 0;
        oProxy->AviaoZ          = 0;
        oProxy->AnguloXY_Tiro   = nAngXy;
        oProxy->AnguloZ_Tiro    = nAngZ;
        oWinSock.Enviar((char *)oProxy,sizeof(Proxy));
        free(oProxy);
        printf("Tiro realizado!\n");
        Sleep(nTempoTiroChegarNoAviao+5000);
        printf("------------------------------------------\n");
    }

    system("pause");
    return 0;
}


bool BuscaAviao(double *tnX, double *tnY, double *tnZ )
{
    Proxy *oProxy = (Proxy *)malloc(sizeof(Proxy));
    oProxy->AviaoX          = 0;
    oProxy->AviaoY          = 0;
    oProxy->AviaoZ          = 0;
    oProxy->AnguloXY_Tiro   = 0;
    oProxy->AnguloZ_Tiro    = 999;
    oWinSock.Enviar((char *)oProxy,sizeof(Proxy));
    oWinSock.Receber((char *)oProxy,sizeof(Proxy));

    *tnX=oProxy->AviaoX;
    *tnY=oProxy->AviaoY;
    *tnZ=oProxy->AviaoZ;

    if (oProxy->AnguloZ_Tiro==999)
        return false;
    else
        return true;

    free(oProxy);
}
