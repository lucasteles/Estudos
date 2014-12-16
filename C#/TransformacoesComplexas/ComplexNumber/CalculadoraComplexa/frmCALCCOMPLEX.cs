using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using CalcComplexNumber;

namespace CalculadoraComplexa
{
    public partial class frmCALCCOMPLEX : Form
    {
        public static int DigCampo      = 1;
        public static string Teclas     = "123456789-,";
        public static string Img0       = "0";
        public static string Real0      = "0";
        public static char Operador   = ' ';
        public static string Result     = "";

        public frmCALCCOMPLEX()
        {
            InitializeComponent();
        }
        public void Add()
        { 
            if(txtIMG.Text == ""){Img0 = "0";}
            else { Img0 = txtIMG.Text; }

            if (txtREAL.Text == "") { Real0 = "0"; }
            else { Real0 = txtREAL.Text; }
        }
        public void digitar(string numero)
        {
            if (DigCampo == 1)
            {
                txtREAL.Text = txtREAL.Text + numero;
            }
            else 
            {
                txtIMG.Text = txtIMG.Text + numero;
            }
        
        }
        public void limpar()
        {
            if (txtREAL.Text.Length != 0 & DigCampo == 1)
            {
                txtREAL.Text = txtREAL.Text.Substring(0, txtREAL.Text.Length - 1);
            }
            if (txtIMG.Text.Length != 0 & DigCampo == 2)
            {
                txtIMG.Text = txtIMG.Text.Substring(0, txtIMG.Text.Length - 1);
            }
        }
        public void limparT(object sender, EventArgs e)
        {
            Operador    = ' ';
            txtREAL.Clear();
            txtIMG.Clear();
            Result      = "";
            Img0        = "";
            Real0       = "";
        }
        private void frmCALCCOMPLEX_Load(object sender, EventArgs e)
        {

        }

        private void txtREAL_Click(object sender, EventArgs e)
        {
            DigCampo = 1;
        }

        private void txtIMG_Click(object sender, EventArgs e)
        {
            DigCampo = 2;
        }

        private void cmd1_Click(object sender, EventArgs e)
        {
            digitar(cmd1.Text);
        }

        private void cmd2_Click(object sender, EventArgs e)
        {
            digitar(cmd2.Text);
        }

        private void cmd3_Click(object sender, EventArgs e)
        {
            digitar(cmd3.Text);
        }

        private void cmd0_Click(object sender, EventArgs e)
        {
            digitar(cmd0.Text);
        }

        private void cmd4_Click(object sender, EventArgs e)
        {
            digitar(cmd4.Text);
        }

        private void cmd5_Click(object sender, EventArgs e)
        {
            digitar(cmd5.Text);
        }

        private void cmd6_Click(object sender, EventArgs e)
        {
            digitar(cmd6.Text);
        }

        private void cmd7_Click(object sender, EventArgs e)
        {
            digitar(cmd7.Text);
        }

        private void cmd8_Click(object sender, EventArgs e)
        {
            digitar(cmd8.Text);
        }

        private void cmd9_Click(object sender, EventArgs e)
        {
            digitar(cmd9.Text);
        }

        private void txtREAL_KeyPress(object sender, KeyPressEventArgs e)
        {
            Boolean invalido = true;

            foreach (char key in Teclas)
            {
                if (key==e.KeyChar & invalido)
                {
                    invalido = false;
                }
            }

            if (invalido)
            {
                e.KeyChar = ' ';
            }
        }

        private void txtIMG_KeyPress(object sender, KeyPressEventArgs e)
        {
            Boolean invalido = true;

            foreach (char key in Teclas)
            {
                if (key == e.KeyChar & invalido)
                {
                    invalido = false;
                }
            }

            if (invalido)
            {
                e.KeyChar = ' ';
            }
        }

        private void txtREAL_KeyUp(object sender, KeyEventArgs e)
        {
            txtREAL.Text = txtREAL.Text.Trim();
        }

        private void txtIMG_KeyUp(object sender, KeyEventArgs e)
        {
            txtIMG.Text = txtIMG.Text.Trim();
        }

        private void cmdSETA_Click(object sender, EventArgs e)
        {
            limpar();
        }

        public void Igual()
        {
            ComplexNumber ComNum = new ComplexNumber();
            ComNum.nImaginario  = Convert.ToDouble(txtIMG.Text);
            ComNum.nReal        = Convert.ToDouble(txtREAL.Text);
            ComNum.n0Imaginario = Convert.ToDouble(Img0);
            ComNum.n0Real       = Convert.ToDouble(Real0);

            switch (Operador)
            {
                case '+':
                    ComNum.somar();
                    break;
                case '-':

                    break;
                case '*':

                    break;
                default:
                    break;
            }
            Operador = ' ';

            txtRESULT.Text = ComNum.n0Real.ToString() + ComNum.n0Imaginario.ToString() + "i";
        
        }
        private void cmdIGUAL_Click(object sender, EventArgs e)
        {
            Igual();
        }

        private void cmdSOMA_Click(object sender, EventArgs e)
        {
            Operador    = '+';
            Add();
        }

        private void cmdSUB_Click(object sender, EventArgs e)
        {
            Operador = '-';
            Add();
        }

        private void cmdMULTI_Click(object sender, EventArgs e)
        {
            Operador = '*';
            Add();
        }
    }
}
