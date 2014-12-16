#ifndef CALCULOS_H_INCLUDED
#define CALCULOS_H_INCLUDED
#include <math.h>
#include <time.h>

typedef struct _TiroCanhao
{
   double AnguloGiro;
   double AnguloAltura;
   clock_t TempoTiro;
   bool Finalizado;
   bool Disparado;
}TiroCanhao;


class Calculos
{
    public:
        // metodo construtor
        Calculos();


        //Propriedades de parametro
        double nG;
        int nVelocidadeAviao;
        int nRangeAcerto;
        double nPosAlvoX;
        double nPosAlvoY;
        double nPosCanhaoX;
        double nPosCanhaoY;
        int nAnguloEntradaAviao;
        int nAlcanceRadar;
        int nAlturaAviao;

        //propriedades de alimentação interna
        double nPosAviaoX;
        double nPosAviaoY;
        double nDistAviaoAlvo;
        double nAviaoPercorrido;
        double nAnguloAviaoAlvo;
        double nAnguloCanhaoAviao;
        bool AlvoDestruido;
        bool AviaoDestuido;
        double nGunSpeed;
        int nPortaSock;
        char cIP_Radar[20];

        //metodos
        void PosAviao(int, double*, double*, double*);
        double AnguloDisparo(int, int, double, double);
        double AnguloGiro(double, double);
        double CalcDistancia(double,double,double,double);
        void PosBala(TiroCanhao,double, double*, double*, double*);
        double xx(double,int);

    private:
        //metodos
        int LeituraParametros();

};


#endif
