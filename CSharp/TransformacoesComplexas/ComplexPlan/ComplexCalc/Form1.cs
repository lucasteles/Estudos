using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace ComplexCalc
{
    public partial class Form1 : Form
    {
        private MathComplex MathComp = new MathComplex(20, 180);
        
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            double Y = Convert.ToDouble(this.textBox2.Text);
            double X = Convert.ToDouble(this.textBox1.Text);

            
            if (this.checkBox1.Checked)
            {

                if (X < 0) { X = -Math.Sqrt(-X); } else { X = Math.Sqrt(X); }
            }


            if (this.checkBox2.Checked)
            {
                if (Y < 0) { Y = -Math.Sqrt(-Y); } else { Y = Math.Sqrt(Y); }
            }


            double Ang = MathComp.BuscaAngulo(X, Y);

            Ang = (Ang * 180) / Math.PI; //converte para graus

            this.textBox3.Text = Ang.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
                 /* 
                  * int x = Convert.ToInt32(this.textBox1.Text);
            int y = Convert.ToInt32(this.textBox2.Text);

            Point Ponto = new Point(x, y);

           Ponto = MathComplex.Exp(Ponto);

            this.textBox1.Text =Ponto.X.ToString();
            this.textBox2.Text = Ponto.Y.ToString();
                  */


            this.textBox3.Text = Math.Pow(2.71828183,2).ToString();

        }


    }
}
