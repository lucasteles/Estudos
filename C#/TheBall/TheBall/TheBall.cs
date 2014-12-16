using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;

namespace TheBall
{
    public class Ball
    {
        #region PropriedadesPrivadas
            private Pen oCaneta    = new Pen(Color.Black);
        #endregion

        #region PropriedadesPublicas
            public Control oBase    = null; //OBJETO DE BASE PARA OS DESENHOS
            public int nTamX        = 0; //TAMANHO EM X DA BOLINHA
            public int nTamY        = 0; //TAMANHO EM Y DA BOLINHA
            public Point nCentro    = new Point(0, 0); // PIXEL CENTRAL DA BOLINHA
            public int nAngulo      = 90; // ANGULO INICIAL
            public int nEscala      = 10; //ESCALA USADA NO CALCULO DE MOVIMENTO
            public Color oCor       = Color.Black; //COR INICIAL
            public Boolean lVisivel = true;
            public Boolean lClick   = false;
        #endregion

        #region Construcao

            public Ball(Control toBase)
            {
                oBase    = toBase;
                nCentro = new Point(oBase.Width / 2, oBase.Height / 2);
                nTamX = 5;
                nTamY = 5;
            }

            public Ball(Control toBase, Point tpInicial)
            {
                oBase    = toBase;
                nCentro = tpInicial;
                nTamX = 5;
                nTamY = 5;
            }

            public Ball(Control toBase, int tnTamX, int tnTamY)
            {
                oBase    = toBase;
                nCentro = new Point(oBase.Width / 2, oBase.Height / 2);
                nTamX = tnTamX;
                nTamY = tnTamY;
            }

            public Ball(Control toBase, Point tpInicial, int tnTamX, int tnTamY)
            {
                oBase    = toBase;
                nCentro = tpInicial;
                nTamX = tnTamX;
                nTamY = tnTamY;
            }

            public Ball(Control toBase, int tnX, int tnY, int tnTamX, int tnTamY)
            {
                oBase    = toBase;
                nCentro = new Point(tnX,tnY);
                nTamX = tnTamX;
                nTamY = tnTamY;
            }
            public Ball(Ball toBall)
            {
                oBase   = toBall.oBase;
                nCentro = toBall.nCentro;
                nTamX   = toBall.nTamX;
                nTamY   = toBall.nTamY;
                nAngulo = toBall.nAngulo;
                nEscala = toBall.nEscala;
                oCor    = toBall.oCor;
            }
        #endregion

        #region Metodos

        public void DenBall(Graphics oPapel)
        {
            oCaneta.Color = oCor;
            oPapel.DrawCurve(oCaneta, PointsBall());
        }

        public Point[] PointsBall() //METODO DE DESENHO DA ESFERA
        {
            Point[] pRetorno = new Point[361];
            int n1X = nCentro.X;
            int n1Y = nCentro.Y;
            int nRX = 0; int nRY = 0;

            for (int i = 0; i <= 360; i++)
            {
                double nRad = i * (Math.PI / 180);

                nRX = Convert.ToInt32(Math.Round(n1X + (Math.Cos(nRad) * nTamX), 0));
                nRY = Convert.ToInt32(Math.Round(n1Y + (Math.Sin(nRad) * nTamY), 0));

                pRetorno[i] = new Point(nRX, nRY);
            }

            return (pRetorno);
        }

        #endregion
    }

 
}
