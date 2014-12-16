using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Drawing;
using ComplexCalc;

namespace ComplexPlan
{
    class Calc
    {
        public MathComplex MathC;
        public int Escala
        {
            get { return MathC.Escala; }
            set { MathC.Escala = value; }
        }

        public int Centro
        {
            get { return MathC.Centro; }
            set { MathC.Centro = value; }
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new ComplexPlan());
        }

        public Calc(int Esc, int Centro)
        {
            MathC = new MathComplex(Esc, Centro);
            Escala = Esc;
        }

        public Point AplicaCalc(Point ponto,ListBox Lista)
        {
            Point Retorno = ponto; ;

            foreach (string item in Lista.Items)
            {
                Retorno = MathC.Aplicar(Retorno, item);
            }

            return (Retorno);
        }

        public Point Conv(Point Ponto)
        {

            return MathC.Pixel2Cart(Ponto);
        }
        public Point DConv(Point Ponto)
        {

            return MathC.Cart2Pixel(Ponto);
        }
        public String[] GetCalcs()
        {
            return MathC.GetCalcs();
        }


        public string MoreCalcs()
        {
            string cNovoCalc =  MathC.AddCalc();
            return cNovoCalc;
        }

    }
}
