using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading;

namespace Teste3D
{
    public partial class Form1 : Form
    {
        public Graphics oGraf = null;
        public Color oPen = Color.White;
        //PAPEIS PARA OS FUNDOS
        public Bitmap bFundo1 = null;
        public Thread oThread = null;

        public Point oMouse,oMagMouse = new Point();
        public Matriz3D oMatriz = null;
        public Pixel3D[] oVertices = null;
        public int nAzimuth,nElevation= 0;
        public int nLarg, nAltu = 0;
        int nScale = 200;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Clear();
        }
        
        public void Clear()
        {
            nLarg = Box3D.Width;
            nAltu = Box3D.Height;
            oMatriz = new Matriz3D(nLarg, nAltu, nLarg);
            bFundo1 = new Bitmap(nLarg, nAltu);

            for (int i = 0; i < nScale; i++)
            {
                oMatriz.Add(new Pixel3D(oPen.ToArgb(), i, 0, 0));
                oMatriz.Add(new Pixel3D(oPen.ToArgb(), 0, i, 0));
                oMatriz.Add(new Pixel3D(oPen.ToArgb(), 0, 0, -i));
            }

            for (int i = 0; i < nScale; i = i + 5)
            {
                oMatriz.Add(new Pixel3D(oPen.ToArgb(), -i, 0, 0));
                oMatriz.Add(new Pixel3D(oPen.ToArgb(), 0, -i, 0));
                oMatriz.Add(new Pixel3D(oPen.ToArgb(), 0, 0, i));
            }

            Draw();
        }
        public void Draw()
        {
            oMatriz.AlterCam(nAzimuth, nElevation);
            oGraf = Graphics.FromImage(bFundo1);
            oGraf.Clear(Color.Black);
            int nPonter = oMatriz.GetPointer();

            for (int i = nPonter / 2; i < nPonter; i++)
			{
                Pixel oPontos = oMatriz.Cart2Pixel(oMatriz.GetList()[i].To2D());
                if (oPontos.nX < nLarg && oPontos.nY < nAltu && (oPontos.nX > 0 && oPontos.nY > 0))
                {
                    Color oCor = Color.FromArgb(oPontos.nCor);
                    bFundo1.SetPixel((int)oPontos.nX, (int)oPontos.nY, oCor);    
                }
                oPontos = oMatriz.Cart2Pixel(oMatriz.GetList()[nPonter-i].To2D());
                if (oPontos.nX < nLarg && oPontos.nY < nAltu && (oPontos.nX > 0 && oPontos.nY > 0))
                {
                    bFundo1.SetPixel((int)oPontos.nX, (int)oPontos.nY, Color.FromArgb(oPontos.nCor));
                }
			}
            Box3D.Image = bFundo1;
        }

        private void Box3D_MouseClick(object sender, MouseEventArgs e)
        {
            oMagMouse = new Point(e.X, e.Y);
        }

        private void Box3D_MouseMove(object sender, MouseEventArgs e)
        {
            oMouse = new Point(e.X, e.Y);
            if (e.Button !=0)
            {
                nAzimuth -= e.X - oMagMouse.X;
                nElevation += e.Y - oMagMouse.Y;
                oMagMouse.X = e.X;
                oMagMouse.Y = e.Y;

                Draw();
            }
        }

        private void cmdDraw_Click(object sender, EventArgs e)
        {
            int nX, nY, nZ;
            nX = int.Parse(txtX.Text);
            nY = int.Parse(txtY.Text);
            nZ = -int.Parse(txtZ.Text);

            int nTam = 360;
            int lnNX = 0;
            int lnNY = 0;

            for (int r = 0; r <= nTam; r=r+50)
            {
                for (int i = 0; i <= nTam; i++)
                {
                    double DegInRad = 0;

                    DegInRad = i * (Math.PI / 180);
                     
                    lnNX = Convert.ToInt32(Math.Round(0 + ((Math.Cos(DegInRad) * 20)), 0));
                    lnNY = Convert.ToInt32(Math.Round(0 + ((Math.Sin(DegInRad) * 20)), 0));
                    Pixel3D oPixel = new Pixel3D(oPen.ToArgb(), lnNX, lnNY, 0).Rotate(0, r);

                    oMatriz.Add(new Pixel3D(Color.Red.ToArgb(), oPixel.nX + nX, oPixel.nY + nY, oPixel.nZ + nZ));
                }
            }
            for (int r = 0; r <= nTam; r = r + 50)
            {
                for (int i = 0; i <= nTam; i++)
                {
                    double DegInRad = 0;

                    DegInRad = i * (Math.PI / 180);

                    lnNX = Convert.ToInt32(Math.Round(0 + ((Math.Cos(DegInRad) * 20)), 0));
                    lnNY = Convert.ToInt32(Math.Round(0 + ((Math.Sin(DegInRad) * 20)), 0));
                    Pixel3D oPixel = new Pixel3D(oPen.ToArgb(), lnNX, lnNY, 0).Rotate(r, 0);

                    oMatriz.Add(new Pixel3D(Color.Red.ToArgb(), oPixel.nX + nX, oPixel.nY + nY, oPixel.nZ + nZ));
                }
            }
            //Random random = new Random();
            //for (int r = 0; r <= 500; r++)
            //{

            //    oMatriz.Add(new Pixel3D(Color.White.ToArgb(), random.Next(400), random.Next(400), -random.Next(400)));
            //    oMatriz.Add(new Pixel3D(Color.White.ToArgb(), random.Next(400), -random.Next(400), random.Next(400)));
            //    oMatriz.Add(new Pixel3D(Color.White.ToArgb(), -random.Next(400), random.Next(400), random.Next(400)));

            //    oMatriz.Add(new Pixel3D(Color.White.ToArgb(), -random.Next(400), random.Next(400), random.Next(400)));
            //    oMatriz.Add(new Pixel3D(Color.White.ToArgb(), random.Next(400), -random.Next(400), random.Next(400)));
            //    oMatriz.Add(new Pixel3D(Color.White.ToArgb(), random.Next(400), random.Next(400), -random.Next(400)));

            //    oMatriz.Add(new Pixel3D(Color.White.ToArgb(), -random.Next(400), random.Next(400), -random.Next(400)));
            //    oMatriz.Add(new Pixel3D(Color.White.ToArgb(), -random.Next(400), -random.Next(400), random.Next(400)));
            //    oMatriz.Add(new Pixel3D(Color.White.ToArgb(), random.Next(400), -random.Next(400), -random.Next(400)));
            //}
        }

        private void cmdRodar_Click(object sender, EventArgs e)
        {
            oThread = new Thread(Rodar);
            oThread.Start();
        }
        public void Rodar()
        {
            Random oRan = new Random();
            while (true)
            {
                Thread.Sleep(50);
                nAzimuth -= 5;
                nElevation += 5;
                Draw();
            }

        }

        private void cmdParar_Click(object sender, EventArgs e)
        {
            oThread.Suspend();
        }

        private void Box3D_Resize(object sender, EventArgs e)
        {
            
        }

        private void Form1_Resize(object sender, EventArgs e)
        {
            Box3D.Width = Width - 50;
            Clear();
        }
    }
}
