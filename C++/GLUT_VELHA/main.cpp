#include <windows.h>>
#ifdef __APPLE__
#include <GLUT/glut.h>
#else
#include <GL/glut.h>
#endif
 
#include <stdlib.h>
#include <math.h>
#include <stdio.h>
 
#define PI 3.14159265358979323846
 
typedef struct _objeto{
    double nX;
    double nY;
    int tipo;
}objeto;
 
 
int nWidth = 680;
int nHeight = 480;
int nQT_OBJETOS = 0;
objeto Objetos[100];
 
 
int Cart2Pixel(double tnP,char tcTipo){
    int nK;
    if(tcTipo=='X')
        nK = (int) (tnP)+(nWidth/2);
    else
        nK = (int) (tnP)+(nHeight/2);
    return nK;
}
 
int Pixel2Cart(double tnP,char tcTipo){
    int nK;
    if(tcTipo=='X')
        nK = (int) (tnP)-(nWidth/2);
    else
        nK =  (int) ((tnP)-(nHeight/2))*-1;
    return nK;
}
 
void DrawLine(double nX1,double nY1,double nX2, double nY2 ){
 
    nX1=Cart2Pixel(nX1,'X');
    nX2=Cart2Pixel(nX2,'X');
    nY1=Cart2Pixel(nY1,'Y');
    nY2=Cart2Pixel(nY2,'Y');
 
    double nAng,nLin;
    int nX,nY,nMax,nMin;
    // calculo de angular
    if ((nX2 - nX1)==0)
        nAng = 0;
    else
        nAng = ((double) (nY2 - nY1) / (nX2 - nX1));
 
    // calculo linear
    nLin = (double)(nY1-(nAng*nX1));
 
    nMin = fmin(nX1, nX2);
    nMax = fmax(nX1, nX2);
    // seta os pontos Y
    for (double nI = nMin; nI < nMax; nI=nI+0.5) {
        nY = (int) round(nAng*nI + nLin);
        glVertex2d(nI,nY);
    }
 
 
}
 
 
void Circle(double tnX,double tnY, double tnRaio){
    double nCX  = tnX;
    double nCY  = tnY;
    double nTam = tnRaio;
 
    for (int nI = 0; nI <= 360; nI++)
    {
        double nRad = nI * (PI / 180);
 
        tnX = (double) nCX + (cos(nRad) * nTam);
        tnY = (double) nCY + (sin(nRad) * nTam);
 
        tnX = Cart2Pixel(tnX,'X');
        tnY = Cart2Pixel(tnY,'Y');
 
        if(nI > 0){
            //DrawLine(tnX,tnY,tnX,tnY);
            glVertex2d(tnX,tnY);
        }
 
    }
}
 
void Cross(double tnX,double tnY)
{
    DrawLine(tnX-20,tnY+20,tnX+20,tnY-20);
    DrawLine(tnX+20,tnY+20,tnX-20,tnY-20);
}
 
void _MouseCall(int btn, int state, int tnX, int tnY){
 
    if (state==1)
    {
    tnX=Pixel2Cart(tnX,'X');
    tnY=Pixel2Cart(tnY,'Y');
 
    Objetos[nQT_OBJETOS].nX = tnX;
    Objetos[nQT_OBJETOS].nY = tnY;
   Objetos[nQT_OBJETOS].tipo = nQT_OBJETOS%2;
 
    nQT_OBJETOS++;
    }
}
 
 
static void display(void)
{
 
    glClearColor(1,1,1,0.0);
    glClear(GL_COLOR_BUFFER_BIT);
 
    glBegin(GL_POINTS);
 
    glColor3f(0, 0, 0);
 
    DrawLine(-100,0,100,0);
 
    for (int i=0; i<nQT_OBJETOS; i++)
    {
        if (Objetos[i].tipo==1)
            Circle(Objetos[i].nX,Objetos[i].nY,20);
        else
            Cross(Objetos[i].nX,Objetos[i].nY);
    }
 
    glEnd();
    glFlush();
 
}
 
 
 
static void idle(void)
{
   glutPostRedisplay();
}
 
 
 
 
/* Program entry point */
 
int main(int argc, char *argv[])
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowSize(nWidth, nHeight);
    glutInitWindowPosition(100, 50);
    glutCreateWindow("Velha");
 
                glutDisplayFunc(display);
    glutMouseFunc (_MouseCall);
 
 
                glutIdleFunc(idle);
    glClearColor(1.0,1.0,1.0,0.0);
    glPointSize(1);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0.0, nWidth, 0.0, nHeight);
 
 
                glutMainLoop();
 
    return EXIT_SUCCESS;
}
