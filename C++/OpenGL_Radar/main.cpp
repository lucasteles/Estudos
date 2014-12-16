#include <windows.h>
#include <cstdlib>
#include <math.h>
#include <stdio.h>
#include <GL/glut.h>
#include <unistd.h>
#include "..\Classes\Desenho.h"
#include <pthread.h>
#include <conio.h>

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

// teste de movimentação
double i=-50;

// variaveis
int nLineSize = 1;
int nTelaX = 500,nTelaY = 500;
Desenho oDen = Desenho(nTelaX,nTelaY);
pthread_t oRadar,oSock,oCamera;
int nXMouse,nYMouse;
int nCamH=0,nCamV=0,nProfunX=10,nProfunY=10;
char *cNome = "Plan 3D";

int main(int argc, char *argv[]){
    oDen.AlterCam(nCamH,nCamV,nProfunX,nProfunY);
    nArgc = argc;
    cArgv = argv;
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
        }
    oDen.AlterCam(nCamH,nCamV,nProfunX,nProfunY);
    glutPostRedisplay();
}

static void Arrows(int tcKey, int tnX, int tnY){
    switch (tcKey)
    {
    case 100:
        nCamH = nCamH - 1;
        break;
    case 101:
        nCamV = nCamV + 1;
        break;
    case 102:
        nCamH = nCamH + 1;
        break;
    case 103:
        nCamV = nCamV - 1;
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
    nCamH -= tnX - nXMouse;
    nCamV += tnY - nYMouse;

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
    oDen.Plan(50,5);

    Cartesano();

    oOBJ.nRed   = 1;
    oOBJ.nGreen = 1;
    oOBJ.nBlue  = 1;
    oDen.AlterColor(oOBJ);

    oDen.Cube3D(0,0,0,0,1,1,1);
    oDen.AlterVisao(0,0);
    oDen.SquareX3D(i,0,10,0,1,1);

    oDen.AlterVisao(0,0);

    oOBJ.nRed   = 0;
    oOBJ.nGreen = 1;
    oOBJ.nBlue  = 0;
    oDen.AlterColor(oOBJ);

    oDen.AlterVisao(i,i);
    oDen.Aviao(0.5,i,10,i);
    oDen.AlterVisao(0,0);

    oDen.Boom(5,15,15,-15);

    oOBJ.nRed   = 1;
    oOBJ.nGreen = 0;
    oOBJ.nBlue  = 0;
    oDen.AlterColor(oOBJ);
    oDen.Alvo(30,25,1,18);
    oDen.Alvo(33,25,1,18);

    oOBJ.nRed   = 1;
    oOBJ.nGreen = 0;
    oOBJ.nBlue  = 0;
    oDen.AlterColor(oOBJ);
    oDen.AlterVisao(5,5);
    oDen.Bala(i,5,5,5);

    oOBJ.nRed   = 0;
    oOBJ.nGreen = 0;
    oOBJ.nBlue  = 1;
    oDen.AlterColor(oOBJ);
    oDen.AlterVisao(30,-30);
    oDen.Canhao(i,30,-30);
    oDen.AlterVisao(0,0);

    i+=0.01;
    if(i>360)
        i=0;

    glEnd();
    glFlush();
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
    while(true){

    }
}
