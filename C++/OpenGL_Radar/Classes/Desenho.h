#ifndef DESENHO_H
#define DESENHO_H
#include <math.h>
#define PI 3.14159265358979323846

// struct para a cor
typedef struct RGB
{
    double nRed;
    double nGreen;
    double nBlue;
}RGB;
// struct para um pixel 2D
typedef struct Pixel2D
{
    double nX;
    double nY;
}Pixel2D;
// struct para um pixel 3D
typedef struct Pixel3D
{
    double nX;
    double nY;
    double nZ;
}Pixel3D;

class Desenho
{
    public:

        RGB nCor;
        RGB nCorFundo;
        double nTamLine;

        Desenho(int,int);

        void InitGL();
        void Init(int,int);
        void Clear(RGB);
        void AlterColor(RGB);
        void AlterCam(int,int,int,int);
        void AlterVisao(double,double);
        // metodos de desenhos basicos
        void Line3D(double,double,double,double,double,double,double);
        void Point3D(double,double,double);
        void CircleX3D(double,double,double,double,double);
        void CircleY3D(double,double,double,double,double);
        void CircleZ3D(double,double,double,double,double);
        void SquareX3D(double,double,double,double,double,double);
        void SquareZ3D(double,double,double,double,double,double);
        void Cube3D(double,double,double,double,double,double,double);

        // desenhos complexos
        void Plan(double,double);
        void Aviao(double,double,double,double);
        void Alvo(double,double,double,double);
        void Canhao(double,double,double);
        void Boom(int,double,double,double);
        void Bala(double,double,double,double);
    private:
        double nVisaoX,nVisaoZ;
        char *cName;
        int nEscalaX;
        int nEscalaY;
        int nTamanhoX;
        int nTamanhoY;
        int nCentroX;
        int nCentroY;
        int nCamH,nCamV,nProfun;

        void DrawLine(Pixel3D,Pixel3D);
        void AlterAng(double,double*,double*,double*,double*);
        Pixel2D _3DTo2D(Pixel3D);
        int Cart2Pixel(double,char);
};

#endif // DESENHO_H
