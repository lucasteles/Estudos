using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace ComplexCalc
{
    public partial class OtherCalc : Form
    {

        private string[,] Retorno;
        int RetIndex = 0;


        public OtherCalc(ref string[,] cCALCS,int nINDICE)
        {
            InitializeComponent();
            Retorno = cCALCS;
            RetIndex = nINDICE;
        }



        #region VAlidacao

            private void ValidarZ(ref TextBox txtVAL)
            {
                double nVAL;
                try
                {
                    nVAL = Convert.ToDouble(txtVAL.Text);
                }
                catch (Exception)
                {
                    nVAL = 0;
                }

                txtVAL.Text = nVAL.ToString();
               

            }

            private void ValidarFunc(ref TextBox txtVAL)
            {
                int nVAL;
                try 
	            {	        
		            nVAL = Convert.ToInt16(txtVAL.Text);
	            }
	            catch (Exception)
	            {
		            nVAL = 0;
	            }

                if (nVAL > 4 || nVAL.Equals(0))
                {
                    txtVAL.Text = "";
                }

            }

            private void txtConj_TextChanged(object sender, EventArgs e)
            {
                ValidarFunc(ref txtConj);
            }

            private void txtExp_TextChanged(object sender, EventArgs e)
            {
                ValidarFunc(ref txtExp);
            }

            private void txtCos_TextChanged(object sender, EventArgs e)
            {
                ValidarFunc(ref txtCos);
            }

            private void txtSin_TextChanged(object sender, EventArgs e)
            {
                ValidarFunc(ref txtSin);
            }

            private void txtRZ1_TextChanged(object sender, EventArgs e)
            {
                ValidarZ(ref txtRZ1);

            }

            private void txtIZ1_TextChanged(object sender, EventArgs e)
            {
                ValidarZ(ref txtIZ1);
            }


        #endregion VAlidacao

        private void btnCancel_Click(object sender, EventArgs e)
        {
            Retorno[RetIndex, 0] = "";
            this.Close();
        }

        private void btnOK_Click(object sender, EventArgs e)
        {

            //MONTANDO NOVO CALCULO
            string cNome = "";
            string cZ1 = "";

            if (this.txtRZ1.Text.Equals("0"))
            {
                this.txtRZ1.Text = "";
            }

            if (this.txtIZ1.Text.Equals("0"))
            {
                this.txtIZ1.Text = "";
            }

            if (this.txtRZ1.Text.Equals("") && this.txtIZ1.Text.Equals(""))
            {
                MessageBox.Show("Preencha o valor de Z1");
            }
            else
            {
                // definindo partes de Z1
                   if (this.txtRZ1.Text == "")
                    {
                        cZ1 = this.txtIZ1.Text.Trim() + "i";
                    }
                   else
                   {
                       if (this.txtIZ1.Text == "")
                       {
                           cZ1 = this.txtRZ1.Text.Trim();
                       }
                       else
                       {
                           if (Convert.ToInt16(this.txtIZ1.Text) > 0)
                           {
                               cZ1 = this.txtRZ1.Text.Trim() + "+" + this.txtIZ1.Text.Trim() + "i";
                           }
                           else
                           {
                               cZ1 = this.txtRZ1.Text.Trim() + this.txtIZ1.Text.Trim() + "i";
                           }
                       }
                   }


                    
                    if( this.txtRZ1.Text.Trim().Equals(""))
                    {
                        Retorno[RetIndex, 1] = "";
                    }
                    else
                    {
                        Retorno[RetIndex, 1] = this.txtRZ1.Text.Trim();
                    }

                    if (this.txtIZ1.Text.Trim().Equals(""))
                    {
                        Retorno[RetIndex, 2] = "";
                    }
                    else
                    {
                        Retorno[RetIndex, 2] = this.txtIZ1.Text.Trim();
                    }

                   
                    

                    //definindo funcoes para Z1

                    Retorno[RetIndex, 3] = "";
                    for (int i = 0; i < 5; i++)
                    {
                        if (this.txtConj.Text == i.ToString())
                        {
                            cZ1 = "Conj(" + cZ1 + ")";
                            Retorno[RetIndex, 3] += "J";
                        }
                        if (this.txtExp.Text == i.ToString())
                        {
                            cZ1 = "Exp(" + cZ1 + ")";
                            Retorno[RetIndex, 3] += "E";
                        }
                        if (this.txtCos.Text == i.ToString())
                        {
                            cZ1 = "Cos(" + cZ1 + ")";
                            Retorno[RetIndex, 3] += "C";
                        }
                        if (this.txtSin.Text == i.ToString())
                        {
                            cZ1 = "Sin(" + cZ1 + ")";
                            Retorno[RetIndex, 3] += "S";
                        }
                    }
                    cZ1 = "(" + cZ1 + ")";

                    //validando ordem de Z1
                    if (this.optORD1.Checked)
                    {
                        cNome = "Z ? " + cZ1;
                        Retorno[RetIndex, 4] = "1";
                    }
                    else
                    {
                        cNome = cZ1 + " ? Z";
                        Retorno[RetIndex, 4] = "2";
                    }

                    //aplicando calculo
                    if (this.optSoma.Checked)
                    {
                        cNome = cNome.Replace("?", "+");
                        Retorno[RetIndex, 5] = "+";
                    }
                    if (this.optSUB.Checked)
                    {
                        cNome = cNome.Replace("?", "-");
                        Retorno[RetIndex, 5] = "-";
                    }
                    if (this.optPot.Checked)
                    {
                        cNome = cNome.Replace("?", "^");
                        Retorno[RetIndex, 5] = "^";
                    }

                    if (this.optMult.Checked)
                    {
                        cNome = cNome.Replace("?", "*");
                        Retorno[RetIndex, 5] = "*";
                    }
                    if (this.optDivi.Checked)
                    {
                        cNome = cNome.Replace("?", "/");
                        Retorno[RetIndex, 5] = "/";
                    }


                    Retorno[RetIndex, 0] = cNome;
                    this.Close();

            }


        }

        private void OtherCalc_Load(object sender, EventArgs e)
        {

        }




    }
}
