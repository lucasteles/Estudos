using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Drawing;

namespace ComplexPlan
{
    class Calc
    {
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

        public Calc()
        { 
        
        }

        public Point AplicaCalc(Point ponto,ListBox Lista)
        {
            return (ponto);
        }

    }
}
