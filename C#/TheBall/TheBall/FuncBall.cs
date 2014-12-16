using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;
using System.Windows.Forms;

namespace TheBall
{
    public class FuncBall
    {
        #region Propriedades
        private static Ball[] oBall = new Ball[9999];
        public static int nBall = 0;
        public static Boolean lStop = false;
        public static Boolean lMouse = false;
        public static Point pMouse  = new Point(0,0);
        private static Graphics oDen1 = null;
        private static Graphics oDen2 = null;
        private static Boolean lSusp = false;
        public static int nVeloc = 3;
        #endregion

        #region Metodos

        public static void MovBall(Ball toBall, PictureBox toImg)
        {
            // VARIAVEL RADOM PARA MUDAR CORES DAS BOLINHAS
            Random rCor = new Random();

            //LIMITE DE 9999 BOLINHAS
            if (nBall >= 9999 || nBall < 0) { return; }
            //OBJETO GRAFICO DA BASE
            Graphics gBase = toImg.CreateGraphics();

            //PAPEIS PARA OS FUNDOS
            Bitmap bFundo1 = new Bitmap(toBall.oBase.Width, toBall.oBase.Height);
            Bitmap bFundo2 = new Bitmap(toBall.oBase.Width, toBall.oBase.Height);

            //OBJETOS GRAFICOS DAS CAMADAS
            oDen1 = Graphics.FromImage(bFundo1);
            oDen2 = Graphics.FromImage(bFundo2);
            //CRIA TODOS OS POSSIVEIS OBJETOS,ALTERANDO SUAS CORES
            for (int i = 0; i < oBall.Length - 1; i++)
            {
                oBall[i] = new Ball(toBall);
                oBall[i].oCor = Color.FromArgb(rCor.Next(0, 240), rCor.Next(0, 240), rCor.Next(0, 240));
                oBall[i].nAngulo = rCor.Next(0, 360);
            }
            // LOOP QUANDO NÃO FOR SUSPENSO
            while (!lSusp)
            {
                // VERIFICA SE DEVE DESENHAR NA TELA
                if (!lStop)
                {                    
                    // DESENHA A PRIMEIRA CAMADA
                    Movimento(toBall, oDen1, bFundo1, toImg);
                    // DESENHA A SEGUNDA CAMADA
                    Movimento(toBall, oDen2, bFundo2, toImg);
                }
            }
        }

        public static void Movimento(Ball toBall, Graphics toDen, Bitmap tbFundo, PictureBox toImg)
        {
            // LIMPA A CAMADA E REDESENHA
            toDen.Clear(toBall.oBase.BackColor);
            for (int i = 0; i <= nBall - 1; i++)
            {
                if (oBall[i].lVisivel)
                {
                    oBall[i].DenBall(toDen);
                    oBall[i].nCentro = CalcPonto(oBall[i]);
                    oBall[i]         = CalcAngulo(oBall[i]);

                    // PROTEÇÃO PARA AS BOLINHA NÃO SAIREM DA TELA
                    if (oBall[i].nCentro.X < oBall[i].nTamX){oBall[i].nCentro.X = oBall[i].nTamX;}
                    if ((oBall[i].nCentro.X + oBall[i].nTamX) > oBall[i].oBase.Width) { oBall[i].nCentro.X = oBall[i].oBase.Width - oBall[i].nTamX; }

                    if (oBall[i].nCentro.Y < oBall[i].nTamY){oBall[i].nCentro.Y = oBall[i].nTamY;}
                    if ((oBall[i].nCentro.Y + oBall[i].nTamY) > oBall[i].oBase.Height) { oBall[i].nCentro.Y = oBall[i].oBase.Height - oBall[i].nTamY; }
                }
            }
            // TRY PARA CASO DE ERRO DE OBJETO EM USO
            try { toImg.Image = tbFundo; }
            catch (Exception) { }
            //ESPERA UM TEMPO ANTES DE SAIR DO METODO
            Delay((10 - nVeloc) * 10);
        }

        public static void Delay(double nSeg)
        {
            // CRIA LOOP PARA DAR UM DELAY ENTRE OS DESENHOS
            DateTime dTempo = DateTime.Now.AddMilliseconds(nSeg);
            while (DateTime.Now < dTempo) { }
        }

        private static Point CalcPonto(Ball bBall)
        {
            //DIVIDE A VELOCIDADE PELA ESCALA
            double nVel = 1.0 / bBall.nEscala;
            // PEGA OS GRAUS EM RADIANOS
            double nRad = bBall.nAngulo * (Math.PI / 180);
            //DIVIDE O X PELA ESCALA
            double nX = bBall.nCentro.X;
            nX = nX / bBall.nEscala;
            //DIVIDE O Y PELA ESCALA
            double nY = bBall.nCentro.Y;
            nY = nY / bBall.nEscala;
            //PEGA O SENO E COSENO DO RADIANO
            double nCos = Math.Cos(nRad) * bBall.nEscala;
            double nSin = Math.Sin(nRad) * bBall.nEscala;

            int n1X = Convert.ToInt32(Math.Round((nX + (nCos * nVel)) * bBall.nEscala, 0));
            int n1Y = Convert.ToInt32(Math.Round((nY + (nSin * nVel)) * bBall.nEscala, 0));

            //if (lMouse)
            //{
            //    bBall.nCentro.X
            //    bBall.nCentro.Y
            //}

            Point nRetorno = new Point(n1X, n1Y);

            return (nRetorno);
        }

        private static Ball CalcAngulo(Ball tbBall)
        {
            Random nRam     = new Random();
            Ball nRetorno = tbBall;
            int nTop = (tbBall.nCentro.Y + tbBall.nTamY) - tbBall.oBase.Height;
            int nLeft = (tbBall.nCentro.X + tbBall.nTamX) - tbBall.oBase.Width;
            int nXBase = tbBall.oBase.Width;
            int nYBase = tbBall.oBase.Height;

            Boolean lY = (nTop >= 0 || nTop <= -(nYBase - (tbBall.nTamY * 2) ));
            Boolean lX = (nLeft >= 0 || nLeft <= -(nXBase - (tbBall.nTamX * 2)));

            // PROTEÇÃO CONTRA OS CANTOS
            if (lY && lX)
            {
                tbBall.nAngulo = (tbBall.nAngulo - 180) + nRam.Next(-5, 5);
                return (nRetorno);
            }

            if (lY)
            {
                tbBall.nAngulo = (-tbBall.nAngulo) + nRam.Next(5);
                return (nRetorno);
            }

            if (lX)
	        {
                tbBall.nAngulo = ((-tbBall.nAngulo) + 180) + nRam.Next(5);
                return (nRetorno);
	        }

            return (nRetorno);
        }
        #endregion
    }
}