#include<math.h>
#include<stdlib.h>
#include<stdio.h>
#include "INumber.h"

double Mod(double X,double Y)
{
    return sqrtf( pow(X,2) + pow(Y,2));
}

double Ang(double X,double Y)
{
    double nAngulo = 0;
    double nModulo = Mod(X,Y);
    double nX = fabs(X);
    double nY = fabs(Y);

    if ( nModulo == 0)
        nModulo = 1;

    //Primeiro quadrante
    if (X >= 0 && Y >= 0){
        if (nX >= nY)
            nAngulo = asin(nY / nModulo);
        else
            nAngulo = acos(nX / nModulo);
    }

    //segundo quadrante
    if (X < 0 && Y >= 0){
        nAngulo = PI / 2;
        if (nX >= nY)
            nAngulo += acos(nY / nModulo);
        else
            nAngulo += asin(nX / nModulo);
    }
    //Terceiro quadrante
    if (X < 0 && Y < 0){
        nAngulo = PI;
        if (nX >= nY)
            nAngulo += asin(nY / nModulo);
        else
            nAngulo += acos(nX / nModulo);
    }

    //Quarto quadrante
    if (X >= 0 && Y < 0){
        nAngulo = (3 * PI) / 2;
        if (nX >= nY)
            nAngulo += asin(nX / nModulo);
        else
            nAngulo += acos(nY / nModulo);
    }
    return nAngulo;
}

INumber IMult(INumber P1, INumber P2)
{
    INumber iRetorno;

    if (P2.i == 0)
    {
        iRetorno.r = P1.r * P2.r;
        iRetorno.i = P1.i * P2.r;
    }
    else
    {
        //forma trigonometrica
        double nMod = Mod(P1.r, P1.i) * Mod(P2.r, P2.i);
        double nAng = Ang(P1.r, P1.i) + Ang(P2.r, P2.i);

        if (nAng > 2 * PI)
            nAng = fmod(nAng , (2 * PI) );

        iRetorno.r = cos(nAng) * nMod;
        iRetorno.i = sin(nAng) * nMod;
    }
    return iRetorno;
}
