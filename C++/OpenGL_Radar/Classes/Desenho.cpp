#include "..\Classes\Desenho.h"
#include <math.h>
#include <windows.h>
#include <cstdlib>
#include <math.h>
#include <GL/glut.h>
#include <stdio.h>
#include <stdlib.h>

Desenho::Desenho(int tnTamX,int tnTamY){
    Init(tnTamX,tnTamY);
}

void Desenho::Init(int tnTamX,int tnTamY){
    nTamLine    = 1;
    nTamanhoX   = tnTamX;
    nTamanhoY   = tnTamY;

    nCentroX    = tnTamX/2;
    nCentroY    = tnTamY/2;

    nProfun = 100;
}

void Desenho::Clear(RGB oCOR){
    double nR,nG,nB;
    nR = oCOR.nRed;
    nG = oCOR.nGreen;
    nB = oCOR.nBlue;

    glClearColor(nR,nG,nB,0.0);
    glClear(GL_COLOR_BUFFER_BIT);
}

void Desenho::AlterCam(int nAngH,int nAngV,int nDepthX,int nDepthY){
    nCamH    = nAngH;
    nCamV    = nAngV;
    nEscalaX = nDepthX;
    nEscalaY = nDepthY;
}

void Desenho::AlterColor(RGB oCOR){
    double nR,nG,nB;
    nR = oCOR.nRed;
    nG = oCOR.nGreen;
    nB = oCOR.nBlue;
    glColor3f(nR, nG, nB);
}

void Desenho::AlterVisao(double tnX,double tnZ){
    nVisaoX = tnX;
    nVisaoZ = tnZ;
}

int Desenho::Cart2Pixel(double tnP,char tcTipo){
    int nK;
    if(tcTipo=='X')
        nK = (int) (tnP*nEscalaX)+nCentroX;
    else
        nK = (int) (tnP*nEscalaY)+nCentroY;
    return nK;
}

Pixel2D Desenho::_3DTo2D(Pixel3D toPixel){
    double nTheta = PI * nCamH / 180.0;
    double nPhi   = PI * nCamV / 180.0;
    int nDepth    = 600;

    double nCosT = (double)cos(nTheta)
        , nSinT  = (double)sin(nTheta);

    double nCosP = (double)cos(nPhi)
        , nSinP  = (double)sin(nPhi);

    double nCosTxCosP  = nCosT * nCosP, nCosTxSinP = nCosT * nSinP,
           nSinTxCosP = nSinT * nCosP, nSinTxSinP = nSinT * nSinP;

    double nX0 = toPixel.nX;
    double nY0 = toPixel.nY;
    double nZ0 = -toPixel.nZ;

    double nX1 = nCosT * nX0 + nSinT * nZ0;
    double nY1 = -nSinTxSinP * nX0 + nCosP * nY0 + nCosTxSinP * nZ0;
    double nZ1 = (nCosTxCosP * nZ0) - (nSinTxCosP * nX0) - (nSinP * nY0);

    Pixel2D oPix;

    oPix.nX = (double) (nX1 * nDepth) / (nZ1+nDepth);
    oPix.nY = (double) (nY1 * nDepth) / (nZ1+nDepth);

    return (oPix);
}

void Desenho::Line3D(double tnAng,double tnX1,double tnY1,double tnZ1,double tnX2,double tnY2,double tnZ2){

    Pixel3D oPix1,oPix2;

    AlterAng(tnAng,&tnX1,&tnZ1,&tnX2,&tnZ2);
    oPix1.nX = tnX1;
    oPix1.nY = tnY1;
    oPix1.nZ = tnZ1;

    oPix2.nX = tnX2;
    oPix2.nY = tnY2;
    oPix2.nZ = tnZ2;

    DrawLine(oPix1,oPix2);
}

void Desenho::Point3D(double tnX,double tnY,double tnZ){
    Pixel3D oPix1,oPix2;

    oPix1.nX = tnX;
    oPix1.nY = tnY;
    oPix1.nZ = tnZ;

    oPix2.nX = tnX+0.1;
    oPix2.nY = tnY+0.1;
    oPix2.nZ = tnZ+0.1;

    DrawLine(oPix1,oPix2);
}

void Desenho::CircleX3D(double tnAng,double tnX,double tnY,double tnZ,double tnRaio){
    double nCX  = tnX;
    double nCY  = tnY;
    double nTam = tnRaio;
    Pixel3D oPixel,oAnt;

    for (int nI = 0; nI <= 360; nI++)
    {
        double nRad = nI * (PI / 180);

        oPixel.nX = (double) nCX + (cos(nRad) * nTam);
        oPixel.nY = (double) nCY + (sin(nRad) * nTam);
        oPixel.nZ = tnZ;

        if(nI > 0){
            Line3D(tnAng,oAnt.nX,oAnt.nY,oAnt.nZ,oPixel.nX,oPixel.nY,oPixel.nZ);
        }
        oAnt.nX = oPixel.nX;
        oAnt.nY = oPixel.nY;
        oAnt.nZ = oPixel.nZ;
    }
}

void Desenho::CircleY3D(double tnAng,double tnX,double tnY,double tnZ,double tnRaio){
    double nCY  = tnY;
    double nCZ  = tnZ;
    double nTam = tnRaio;
    Pixel3D oPixel,oAnt;

    for (int nI = 0; nI <= 360; nI++)
    {
        double nRad = nI * (PI / 180);

        oPixel.nY = (double) nCY + (cos(nRad) * nTam);
        oPixel.nZ = (double) nCZ + (sin(nRad) * nTam);
        oPixel.nX = tnX;

        if(nI > 0){
            Line3D(tnAng,oAnt.nX,oAnt.nY,oAnt.nZ,oPixel.nX,oPixel.nY,oPixel.nZ);
        }
        oAnt.nX = oPixel.nX;
        oAnt.nY = oPixel.nY;
        oAnt.nZ = oPixel.nZ;
    }
}

void Desenho::CircleZ3D(double tnAng,double tnX,double tnY,double tnZ,double tnRaio){
    double nCX  = tnX;
    double nCZ  = tnZ;
    double nTam = tnRaio;
    Pixel3D oPixel,oAnt;

    for (int nI = 0; nI <= 360; nI++)
    {
        double nRad = nI * (PI / 180);

        oPixel.nX = (double) nCX + (cos(nRad) * nTam);
        oPixel.nZ = (double) nCZ + (sin(nRad) * nTam);
        oPixel.nY = tnY;

        if(nI > 0){
            Line3D(tnAng,oAnt.nX,oAnt.nY,oAnt.nZ,oPixel.nX,oPixel.nY,oPixel.nZ);
        }
        oAnt.nX = oPixel.nX;
        oAnt.nY = oPixel.nY;
        oAnt.nZ = oPixel.nZ;
    }
}

void Desenho::SquareX3D(double tnAng,double tnX,double tnY,double tnZ,double tnTamX,double tnTamY){
    double nX0 = tnX,nY0 = tnY,Z0 = tnZ;
    double nXT = nX0+tnTamX,nYT = nY0+tnTamY;

    Line3D(tnAng,nX0,nY0,Z0,nX0,nYT,Z0);
    Line3D(tnAng,nX0,nY0,Z0,nXT,nY0,Z0);
    Line3D(tnAng,nX0,nYT,Z0,nXT,nYT,Z0);
    Line3D(tnAng,nXT,nY0,Z0,nXT,nYT,Z0);
}

void Desenho::SquareZ3D(double tnAng,double tnX,double tnY,double tnZ,double tnTamZ,double tnTamY){
    double nX0 = tnX,nY0 = tnY,nZ0 = tnZ;
    double nXT,nYT = nY0+tnTamY,nZT = nZ0+tnTamZ;

    Line3D(tnAng,nX0,nY0,nZ0,nX0,nYT,nZ0);
    Line3D(tnAng,nX0,nY0,nZ0,nX0,nY0,nZT);
    Line3D(tnAng,nX0,nYT,nZ0,nX0,nYT,nZT);
    Line3D(tnAng,nX0,nY0,nZT,nX0,nYT,nZT);
}

void Desenho::Cube3D(double tnAng,double tnX,double tnY,double tnZ,double tnTamX,double tnTamY,double tnTamZ){
    double nX0 = tnX - tnTamX/2,nY0 = tnY,Z0 = tnZ - tnTamZ/2;

    SquareX3D(tnAng,nX0,nY0,Z0,tnTamX,tnTamY);
    SquareX3D(tnAng,nX0,nY0,Z0+tnTamZ,tnTamX,tnTamY);

    SquareZ3D(tnAng,nX0,nY0,Z0,tnTamZ,tnTamY);
    SquareZ3D(tnAng,nX0+tnTamX,nY0,Z0,tnTamZ,tnTamY);
}

void Desenho::Plan(double tnTam,double tnLargura){
    double nX0 = 0 - tnTam,nY0 = 0,nZ0 = tnTam;
    double nI;

    for(nI=nX0;nI<=tnTam;nI=nI+tnLargura)
        Line3D(0,nI,nY0,nZ0,nI,nY0,nZ0-(2*tnTam));

    for(nI=nZ0;nI>=-tnTam;nI=nI-tnLargura)
        Line3D(0,nX0,nY0,nI,nX0+(2*tnTam),nY0,nI);
}

void Desenho::Aviao(double tnAng,double tnX,double tnY,double tnZ){

    Cube3D(tnAng,tnX+2,tnY,tnZ,0.5,0.2,0.5);
    Cube3D(tnAng,tnX,tnY,tnZ,4,0.5,0.5);
    Cube3D(tnAng,tnX+1,tnY,tnZ,1,0.2,4.5);
    Cube3D(tnAng,tnX-2,tnY,tnZ,1,0.2,-2.5);
    Cube3D(tnAng,tnX-2,tnY,tnZ,0.5,0.7,-0.5);
}

void Desenho::Canhao(double tnAng,double tnX,double tnZ){
    Cube3D(tnAng,tnX,2,tnZ,1,1,1);
    Cube3D(tnAng,tnX,3,tnZ+1,1,1,3);
    Cube3D(tnAng,tnX,0,tnZ,2,2,2);
}

void Desenho::Alvo(double tnX,double tnZ,double tnTam,double tnTamY){
     for(double nTam=0;nTam<=tnTamY;nTam=nTam+1)
        CircleZ3D(0,tnX,nTam,tnZ,tnTam);

    Cube3D(0,tnX,0,tnZ,tnTam+0.5,tnTamY,tnTam+0.5);
}

void Desenho::Boom(int tnTam,double tnX,double tnY,double tnZ){
    RGB oCor;
    int nX = tnX,nY = tnY,nZ = tnZ;

    for(int nI=0;nI<=10;nI++){
        oCor.nRed   = 1;
        oCor.nGreen = 0;
        oCor.nBlue  = 0;
        AlterColor(oCor);
        nX = (rand()%tnTam)+tnX;
        nY = (rand()%tnTam)+tnY;
        nZ = (rand()%tnTam)+tnZ;
        Point3D(nX,nY,nZ);

        oCor.nRed   = 1;
        oCor.nGreen = 1;
        oCor.nBlue  = 0;
        AlterColor(oCor);
        nX = (rand()%tnTam)+tnX;
        nY = (rand()%tnTam)+tnY;
        nZ = (rand()%tnTam)+tnZ;
        Point3D(nX,nY,nZ);
    }
}

void Desenho::Bala(double tnAng,double tnX,double tnY,double tnZ){
    CircleX3D(tnAng,tnX,tnY,tnZ,0.1);
    CircleY3D(tnAng,tnX,tnY,tnZ,0.1);
    CircleZ3D(tnAng,tnX,tnY,tnZ,0.1);
}

void Desenho::DrawLine(Pixel3D oPixel1,Pixel3D oPixel2){
    Pixel2D oPex1 = _3DTo2D(oPixel1);
    Pixel2D oPex2 = _3DTo2D(oPixel2);

    int nX1 = Desenho::Cart2Pixel(oPex1.nX,'X');
    int nX2 = Desenho::Cart2Pixel(oPex2.nX,'X');
    int nY1 = Desenho::Cart2Pixel(oPex1.nY,'Y');
    int nY2 = Desenho::Cart2Pixel(oPex2.nY,'Y');

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

    nMin = fmin(nY1, nY2);
    nMax = fmax(nY1, nY2);

    // seta os pontos X
    for (double nI = nMin; nI < nMax; nI=nI+0.5) {
        if (nAng==0)
            nX = nX1;
        else
            nX = (int) round((nI - nLin)/nAng);

        glVertex2d(nX,nI);
    }
}

void Desenho::AlterAng(double tnAng,double *tnX1,double *tnZ1,double *tnX2,double *tnZ2){
    double nRad = tnAng;
    double nX1,nZ1,nX2,nZ2;

    nX1 = *tnX1-nVisaoX;
    nX2 = *tnX2-nVisaoX;
    nZ1 = *tnZ1-nVisaoZ;
    nZ2 = *tnZ2-nVisaoZ;

    //gira no eixo
    *tnX1=(nX1 * cos(nRad)) + (nZ1 * -sin(nRad));
    *tnZ1=(nX1 * sin(nRad)) + (nZ1 *  cos(nRad));
    *tnX2=(nX2 * cos(nRad)) + (nZ2 * -sin(nRad));
    *tnZ2=(nX2 * sin(nRad)) + (nZ2 *  cos(nRad));

    *tnX1 = *tnX1+nVisaoX;
    *tnX2 = *tnX2+nVisaoX;
    *tnZ1 = *tnZ1+nVisaoZ;
    *tnZ2 = *tnZ2+nVisaoZ;
}
