using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using TheBall;
using System.Threading;

namespace WFormTeste
{
    public partial class WTeste : Form
    {
        Ball Teste = null;
        Thread InstanceCaller = null;
        Boolean lStart = false;

        public WTeste()
        {
            InitializeComponent();
        }

        private void WTeste_Load(object sender, EventArgs e)
        {
            
        }

        private void cmdPLAY_Click(object sender, EventArgs e)
        {
            if (lStart)
            {
                FuncBall.nVeloc = Convert.ToInt32(txtVELOC.Text);
                Teste.nAngulo   = Convert.ToInt32(txtANGULO.Text);
                FuncBall.nBall  = Convert.ToInt32(txtNBol.Text);
                FuncBall.lStop  = false;
                return;
            }
            else
            {
                Teste = new Ball(Imagem, new Point(Imagem.Width / 2, Imagem.Height / 2), 10, 10);
            }
            
            Teste.oCor      = Color.Red;
            FuncBall.nVeloc = Convert.ToInt32(txtVELOC.Text);
            Teste.nAngulo   = Convert.ToInt32(txtANGULO.Text);
            FuncBall.nBall  = Convert.ToInt32(txtNBol.Text);

            InstanceCaller = new Thread(new ThreadStart(Mov));
            InstanceCaller.Start();
            lStart = true;
        }

        public void Mov()
        {
            FuncBall.MovBall(Teste, Imagem);
        }

        private void cmdPARAR_Click(object sender, EventArgs e)
        {
            FuncBall.lStop = true;
        }

        private void WTeste_MouseDown(object sender, MouseEventArgs e)
        {
            //FuncBall.lMouse = true;
            //FuncBall.pMouse = new Point(MousePosition.X, MousePosition.Y);
        }

        private void WTeste_MouseUp(object sender, MouseEventArgs e)
        {
            //FuncBall.lMouse = false;
        }
    }
}
