using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using System.Drawing;
using ComplexCalc;

namespace ComplexPlan.Classes
{
    class Formas
    {
        public Point oFixPonto     = new Point(0,0);
        public Calc Calculo        = null;
        public ListBox oListaCalc  = null;
        public Formas(int nEscala,int nModulo,ListBox oLista)
        {
            Calculo = new Calc(nEscala, nModulo / 2);
            oListaCalc = oLista;
        }

        public static string[] GetFormas()
        {
            string[] Formas = new string[99];

            Formas[0] = "Pen";
            Formas[1] = "Line";
            Formas[2] = "Square";
            Formas[3] = "Triangle";
            Formas[4] = "Cube";
            Formas[5] = "Circulo";
            Formas[6] = "Pentágono";
            
            return (Formas);
        }

        public Point[] DesenharFormas(int nForma,Point Mouse)
        {
            Point[] forma = null;

            switch (nForma)
            {
                case 1:
                    forma = Linha(oFixPonto.X, oFixPonto.Y, Mouse.X, Mouse.Y);
                    break;
                case 2:
                    forma = Quadrado(oFixPonto.X, oFixPonto.Y, Mouse.X - oFixPonto.X, Mouse.Y - oFixPonto.Y);
                    break;
                case 3:
                    forma = Triangulo(oFixPonto.X, oFixPonto.Y, Mouse.X - oFixPonto.X, Mouse.Y - oFixPonto.Y);
                    break;
                case 4:
                    forma = Cubo(oFixPonto.X, oFixPonto.Y, Mouse.X - oFixPonto.X, Mouse.Y - oFixPonto.Y);
                    break;
                case 5:
                    forma = Circulo(oFixPonto.X, oFixPonto.Y, Mouse.X - oFixPonto.X, Mouse.Y - oFixPonto.Y);
                    break;
                case 6:
                    forma = Pentagono(oFixPonto.X, oFixPonto.Y, Mouse.X - oFixPonto.X, Mouse.Y - oFixPonto.Y);
                    break;
                default:
                    forma = new Point[] { new Point(Mouse.X, Mouse.Y) };
                    break;
            }

            return (forma);
        }

        #region Formas

        public Point[] Quadrado(int tX, int tY, int tMX, int tMY)
        {
            Point[] Pontos =
            {
                new Point(tX       ,tY),
                new Point(tX+tMX   ,tY),
                new Point(tX+tMX   ,tY+tMY),
                new Point(tX       ,tY+tMY),
                new Point(tX       ,tY)
            };

            return (Pontos);
        }

        public Point[] Cubo(int tX, int tY, int tMX, int tMY)
        {
            int nProfund = 2;
            if (nProfund == 0) { nProfund = 1; }
            Point[] Pontos =
            {
                new Point(tX       ,tY),
                new Point(tX+tMX   ,tY),
                new Point(tX+tMX   ,tY+tMY),
                new Point(tX       ,tY+tMY),
                new Point(tX       ,tY),

               
                new Point(tX+(tX/nProfund)         ,tY-(tY/nProfund)),
                new Point(tX+(tX/nProfund) +tMX    ,tY-(tY/nProfund)),
                new Point(tX+tMX   ,tY),
                new Point(tX+(tX/nProfund) +tMX    ,tY-(tY/nProfund)),
                new Point(tX+(tX/nProfund) +tMX    ,tY-(tY/nProfund)+tMY),
                new Point(tX+tMX   ,tY+tMY),
                new Point(tX+(tX/nProfund) +tMX    ,tY-(tY/nProfund)+tMY),
                new Point(tX+(tX/nProfund)         ,tY-(tY/nProfund)+tMY),
                new Point(tX       ,tY+tMY),
                new Point(tX+(tX/nProfund)         ,tY-(tY/nProfund)+tMY),
                new Point(tX+(tX/nProfund)         ,tY-(tY/nProfund))
            };

            return (Pontos);
        }

        public Point[] Linha(int tX1, int tY1, int tX2, int tY2)
        {
            Point[] Pontos =
            {
                new Point(tX1        ,tY1),
                new Point(tX2        ,tY2)
            };

            return (Pontos);
        }

        public Point[] Triangulo(int tX, int tY, int tMX, int tMY)
        {
            Point[] Pontos =
            {
                new Point(tX     ,tY),
                new Point(tX+tMX ,tY+tMY),
                new Point(tX/2   ,tY+tMY),
                new Point(tX     ,tY)
            };

            return (Pontos);
        }

        public Point[] Circulo(int tX, int tY, int tMX, int tMY)
        {
            int nTam = 360;
            int lnNX = 0;
            int lnNY = 0;
            Point[] Pontos = new Point[nTam + 1];

            for (int i = 0; i <= nTam; i++)
            {
                double DegInRad = 0;

	            DegInRad = i * (Math.PI / 180);

	            lnNX = Convert.ToInt32(Math.Round(tX + ((Math.Cos(DegInRad)*tMX)),0));
	            lnNY = Convert.ToInt32(Math.Round(tY + ((Math.Sin(DegInRad)*tMY)),0));

                Pontos[i] = new Point(lnNX,lnNY);
            }

            return (Pontos);
        }

        public Point[] Pentagono(int tX, int tY, int tMX, int tMY)
        {

            Point[] Pontos =
            {
                new Point(tX        ,tY),
                new Point(tX+tMX    ,tY+tMY),
                new Point(tX+(tX/3) ,tY+(tMY*2)),
                new Point(tX-(tX/3) ,tY+(tMY*2)),
                new Point(tX-tMX    ,tY+tMY),
                new Point(tX        ,tY)
            };

            return (Pontos);
        }

    #endregion
    }
}
