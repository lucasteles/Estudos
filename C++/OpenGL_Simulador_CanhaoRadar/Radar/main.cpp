#include <windows.h>
#include <cstdlib>
#include <math.h>
#include <time.h>
#include <stdio.h>
#include <GL/glut.h>
#include <unistd.h>
#include "..\Classes\Desenho.h"
#include "..\Classes\Calculos.h"
#include "..\Classes\WinSockClass.h"
#include <pthread.h>
#include <conio.h>

#define nArea 100

int nArgc;
char **cArgv;

//metodos
void *InitRadar(void *);
void Radar();
void *Sock(void *);
void *ReadCamera(void *);
void Cartesano();
static void Refresh(void);
static void Key(unsigned char, int, int);
static void Arrows(int, int, int);
void _MouseCall(int, int, int, int);
void CalculaPosicoes(double);


// variaveis
int nLineSize = 1;
int nTelaX = 800,nTelaY = 800;
Desenho oDen = Desenho(nTelaX,nTelaY);
pthread_t oRadar,oSock,oCamera;
int nXMouse,nYMouse;
int nCamH=0,nCamV=0,nProfunX=4,nProfunY=4;
char *cNome = "5° PI";
double nI=0;
//variaveis para canhao
Calculos RADAR; // inicia classe de radar
int nPort = RADAR.nPortaSock; // porta para se conectar com o client
WinSockClass oWinSock = WinSockClass(nPort);

double AviaoX=0,AviaoY=0,AviaoZ=0, i=0;
clock_t tNow = clock();

//define vetor de tiros a serem realizados;
TiroCanhao oTiros[10];
int nQT_TIROS = 0;

//teste
double nDist=0,nMenX=0,nMenY=0,nMenZ=0;

int main(int argc, char *argv[]){
    oDen.AlterCam(nCamH,nCamV,nProfunX,nProfunY);
    nArgc = argc;
    cArgv = argv;

    //inicia server
    if(oWinSock.IniciaServer()==0)
         return 0;

    // cria as threads
    pthread_create(&oRadar,NULL,InitRadar,&argc);
    pthread_create(&oSock,NULL,Sock,&argc);
    // inicia as threads
    pthread_join(oRadar,NULL);
    pthread_join(oSock,NULL);
}

static void Refresh(void){
    glutPostRedisplay();
}

static void Key(unsigned char tcKey, int tnX, int tnY){
    switch (tcKey)
        {
            case '+':
                nProfunX = nProfunX + 1;
                nProfunY = nProfunY + 1;
                break;
            case '-':
                nProfunX = nProfunX - 1;
                nProfunY = nProfunY - 1;
                break;
            case 'p':
                system("pause");
                break;
        }
    oDen.AlterCam(nCamH,nCamV,nProfunX,nProfunY);
    glutPostRedisplay();
}

static void Arrows(int tcKey, int tnX, int tnY){
    switch (tcKey)
    {
    case 100:
        nCamH = nCamH - 10;
        break;
    case 101:
        nCamV = nCamV + 10;
        break;
    case 102:
        nCamH = nCamH + 10;
        break;
    case 103:
        nCamV = nCamV - 10;
        break;
    }
    oDen.AlterCam(nCamH,nCamV,nProfunX,nProfunY);
    glutPostRedisplay();
}

void _MouseCall(int btn, int state, int tnX, int tnY){
    nXMouse = tnX;
    nYMouse  = tnY;
}

void _MouseMove(int tnX, int tnY){
    nCamH -= tnX - (nXMouse);
    nCamV += tnY - (nYMouse);

	oDen.AlterCam(nCamH,nCamV,nProfunX,nProfunY);
	glutPostRedisplay();
	nXMouse  = tnX;
    nYMouse  = tnY;
}

void Resize(int tnWidth, int tnHeight)
{
    glViewport(0, 0, tnWidth, tnHeight);
    nTelaX = tnWidth;
    nTelaY = tnHeight;
    oDen.Init(nTelaX,nTelaY);
    glutPostRedisplay();
}

void *InitRadar(void *arg){
    glutInit(&nArgc, cArgv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowSize(nTelaX, nTelaY);
    glutInitWindowPosition(100, 50);
    glutCreateWindow(cNome);
    glutDisplayFunc(Radar);
    glutIdleFunc(Refresh);
    glClearColor(1.0,1.0,1.0,0.0);
    glPointSize(nLineSize);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0.0, (GLdouble)nTelaX, 0.0, (GLdouble)nTelaY);
    glutKeyboardFunc(Key);
    glutSpecialFunc(Arrows);
    glutMouseFunc (_MouseCall);
    glutMotionFunc(_MouseMove);
    glutReshapeFunc(Resize);
    glutMainLoop();
}

void Radar(){
    RGB oFundo,oOBJ;
    oFundo.nRed   = 0;
    oFundo.nGreen = 0;
    oFundo.nBlue  = 0;

    oDen.Clear(oFundo);
    glBegin(GL_POINTS);

    oOBJ.nRed   = 1;
    oOBJ.nGreen = 1;
    oOBJ.nBlue  = 1;
    oDen.AlterColor(oOBJ);
    oDen.Plan(nArea,(int)nArea/10);
    oDen.AlterVisao(0,0);
    oDen.SquareX3D(nI,0,10,0,1,1);

    double nPasso = (float( clock () - tNow ) /  CLOCKS_PER_SEC);
    Cartesano();
    CalculaPosicoes(nPasso);

    double auxX,auxY,auxZ;

    auxX = RADAR.xx(RADAR.nPosCanhaoX,nArea);
    auxZ = RADAR.xx(RADAR.nPosCanhaoY,nArea);
    auxY = 0;
    oOBJ.nRed   = 0;
    oOBJ.nGreen = 1;
    oOBJ.nBlue  = 0;
    oDen.AlterColor(oOBJ);
    oDen.AlterVisao(auxX,auxZ);
    oDen.Canhao(RADAR.nAnguloCanhaoAviao,auxX,auxZ);
    oDen.AlterVisao(0,0);

    oOBJ.nRed   = 0;
    oOBJ.nGreen = 1;
    oOBJ.nBlue  = 0;
    oDen.AlterColor(oOBJ);

    auxX=RADAR.xx(AviaoX,nArea);
    auxY=RADAR.xx(AviaoZ,nArea);
    auxZ=RADAR.xx(AviaoY,nArea);


    // desneha aviao, caso tenha chegado no alvo faz efeito de explosao
    if (RADAR.AviaoDestuido || RADAR.AlvoDestruido)
    {
       oDen.Boom(10,auxX,auxY,auxZ);
    }
    else
    {
       oDen.AlterVisao(auxX,auxZ);
       oDen.Aviao(RADAR.nAnguloAviaoAlvo,auxX,auxY,auxZ);
       oDen.AlterVisao(0,0);
    }


    //desenha o alvo
    //caso o aviao chegue no alvo faz efeito de explosao
    oOBJ.nRed   = 1;
    oOBJ.nGreen = 0;
    oOBJ.nBlue  = 1;
    oDen.AlterColor(oOBJ);
    auxX = RADAR.xx(RADAR.nPosAlvoX,nArea);
    auxZ = RADAR.xx(RADAR.nPosAlvoY,nArea);
    auxY = 0;

    if (!RADAR.AlvoDestruido){
        oDen.Alvo(auxX,auxZ,4,30);
    }else{
        oDen.Boom(10,auxX,auxY,auxZ);
        oDen.Boom(10,auxX,auxY+10,auxZ);
        oDen.Boom(10,auxX,auxY+20,auxZ);
        oDen.Boom(10,auxX,auxY+30,auxZ);
    }

    // desenha os tiros realizados

    for(int nT=0; nT<nQT_TIROS; nT++)
    {

        //DESENHA TRAJETORIA DA BALA ATE AGORA
        for (double nTraj=0; nTraj<nPasso;nTraj+=.1)
        {
            RADAR.PosBala(oTiros[nT],nTraj,&auxX,&auxY,&auxZ);
            auxX=RADAR.xx(auxX,nArea);
            auxY=RADAR.xx(auxY,nArea);
            auxZ=RADAR.xx(auxZ,nArea);
            oOBJ.nRed   = 1;
            oOBJ.nGreen = 1;
            oOBJ.nBlue  = 1;
            oDen.AlterColor(oOBJ);

            if (auxZ>0)
                oDen.Cube3D(0,auxX,auxZ,auxY,.1,.1,.1);
        }

        if (!oTiros[nT].Finalizado)
        {

            RADAR.PosBala(oTiros[nT],nPasso,&auxX,&auxY,&auxZ);

            if (auxZ<=0 && oTiros[nT].Disparado)
                 oTiros[nT].Finalizado=true;


            double nDisBalaAviao = sqrt( pow(auxX-AviaoX,2)+
                                         pow(auxY-AviaoY,2)+
                                         pow(auxZ-AviaoZ,2) );

            if ( nDist==0 || nDist> nDisBalaAviao ){
                 nDist= nDisBalaAviao ;
                 nMenX=auxX;
                 nMenY=auxY;
                 nMenZ=auxZ;
            }

            printf("\nPosicao Bala:");
            printf("(%.2f, %.2f, %.2f) ",auxX,auxY,auxZ);

            printf("\nDistancia bala do aviao= %.2f metros\n", nDisBalaAviao);

            if (nDisBalaAviao<=RADAR.nRangeAcerto)
            {
                RADAR.AviaoDestuido=true;
            }

            auxX=RADAR.xx(auxX,nArea);
            auxY=RADAR.xx(auxY,nArea);
            auxZ=RADAR.xx(auxZ,nArea);

            oOBJ.nRed   = 1;
            oOBJ.nGreen = 0;
            oOBJ.nBlue  = 0;
            oDen.AlterColor(oOBJ);
            oDen.AlterVisao(auxX,auxY);
            oDen.Bala(nI,auxX,auxZ,auxY);
            oTiros[nT].Disparado=true;

        }


    }

    printf("\nMenor distancia bala:%.2f (%.2f,%.2f,%.2f) \n",nDist,nMenX,nMenY,nMenZ);
    //faz giro da bala
    nI+=0.1;
    if(nI>2*PI)
        nI=0;

    glEnd();
    glFlush();
}

void CalculaPosicoes(double nPasso)
{
    nPasso=nPasso*1000;
    system("cls");

    if (RADAR.AlvoDestruido)
		{printf("Alvo destruido!\n\n");}
    else
        {if (RADAR.AviaoDestuido)
            {printf("Aviao destruido!\n\n");}
        else
        {
            // calcula posição do avião
            RADAR.PosAviao(nPasso, &AviaoX, &AviaoY, &AviaoZ);
        }
    }


    printf("Posicao Alvo: x,y,z \n");
    printf("(%i, %i, %i) \n",RADAR.nPosAlvoX,RADAR.nPosAlvoY,0);

    printf("\nPosicao Aviao inicial: x,y,z \n");
    printf("(%.2f, %.2f ,%i) \n",RADAR.nPosAviaoX,RADAR.nPosAviaoY,RADAR.nAlturaAviao);

    printf("\nPosicao Aviao: x,y,z \n");
    printf("(%.2f, %.2f, %.2f) \n",AviaoX,AviaoY,AviaoZ);

    printf("\nDistancia percorrida= %.2f metros\n", RADAR.nAviaoPercorrido);
    printf("Distancia do alvo = %.2f metros\n\n", RADAR.nDistAviaoAlvo);
}

void Cartesano(){
    RGB oOBJ;
    // LINHA DO X
    oOBJ.nRed   = 1;
    oOBJ.nGreen = 0;
    oOBJ.nBlue  = 0;
    oDen.AlterColor(oOBJ);
    oDen.Line3D(0,0,0,0,10,0,0);
    //LINHA DO Y
    oOBJ.nRed   = 0;
    oOBJ.nGreen = 1;
    oOBJ.nBlue  = 0;
    oDen.AlterColor(oOBJ);
    oDen.Line3D(0,0,0,0,0,10,0);
    //LINHA DO Z
    oOBJ.nRed   = 0;
    oOBJ.nGreen = 0;
    oOBJ.nBlue  = 1;
    oDen.AlterColor(oOBJ);
    oDen.Line3D(0,0,0,0,0,0,10);
}

void *Sock(void *arg){
        oWinSock.AguardandoClient();
    while(true)
    {
        Proxy *oProxy = (Proxy *)malloc(sizeof(Proxy));

        if  ( oWinSock.Receber((char *)oProxy,sizeof(Proxy)) > 0 )
        {
            //canhao esta pedindo cordenadas do aviao
            if (oProxy->AnguloZ_Tiro==999)
            {
                oProxy->AviaoX          = AviaoX;
                oProxy->AviaoY          = AviaoY;
                oProxy->AviaoZ          = AviaoZ;
                oProxy->AnguloXY_Tiro   = 0;

                if (RADAR.AviaoDestuido)
                    oProxy->AnguloZ_Tiro    = 999;
                else
                    oProxy->AnguloZ_Tiro    = 0;

                oWinSock.Enviar((char *)oProxy,sizeof(Proxy));
            }
            else
            {
                nQT_TIROS++;
                oTiros[nQT_TIROS-1].AnguloAltura=oProxy->AnguloZ_Tiro;
                oTiros[nQT_TIROS-1].AnguloGiro=oProxy->AnguloXY_Tiro;
                oTiros[nQT_TIROS-1].TempoTiro = clock();
                oTiros[nQT_TIROS-1].Finalizado=false;
                oTiros[nQT_TIROS-1].Disparado=false;
            }
        }
        else {exit(0);}
        free(oProxy);

    }

}
