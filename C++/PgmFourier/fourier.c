#include<math.h>
#include<stdlib.h>
#include<stdio.h>
#define PI M_PI

typedef struct _INumber {
    double R;
    double I;
} INumber;

double Modulo(double X,double Y){return sqrtf( pow(X,2) + pow(Y,2));};

double BuscaAngulo(double tnX,double tnY)
{
    double nAngulo = 0;
    double nModulo = Modulo(tnX,tnY);
    double nX = fabs(tnX);
    double nY = fabs(tnY);


    if ( nModulo == 0)
        nModulo = 1;


    //Primeiro quadrante
    if (tnX >= 0 && tnY >= 0)
    {
        if (nX >= nY)
            nAngulo = asin(nY / nModulo);
        else
            nAngulo = acos(nX / nModulo);
    }

    //segundo quadrante
    if (tnX < 0 && tnY >= 0)
    {
        nAngulo = PI / 2;
        if (nX >= nY)
            nAngulo += acos(nY / nModulo);
        else
            nAngulo += asin(nX / nModulo);
    }


    //Terceiro quadrante
    if (tnX < 0 && tnY < 0)
    {
        nAngulo = PI;
        if (nX >= nY)
            nAngulo += asin(nY / nModulo);
        else
            nAngulo += acos(nX / nModulo);
    }

    //Terceiro quadrante
    if (tnX >= 0 && tnY < 0)
    {
        nAngulo = (3 * PI) / 2;
        if (nX >= nY)
            nAngulo += asin(nX / nModulo);
        else
            nAngulo += acos(nY / nModulo);
    }


    return nAngulo;
}



INumber Multipl(INumber P1, INumber P2)
{

    INumber pRetorno;



    if (P2.I == 0)
    {
        pRetorno.R = P1.R * P2.R;
        pRetorno.I = P1.I * P2.R;
    }
    else
    {
        //forma trigonometrica
        double nModulo = Modulo(P1.R, P1.I) * Modulo(P2.R, P2.I);
        double nAngulo = BuscaAngulo(P1.R, P1.I) + BuscaAngulo(P2.R, P2.I);

        if (nAngulo > 2 * PI)
            nAngulo = fmod(nAngulo , (2 * PI) );

        pRetorno.R = cos(nAngulo) * nModulo;
        pRetorno.I = sin(nAngulo) * nModulo;

    }



    return pRetorno;

}


