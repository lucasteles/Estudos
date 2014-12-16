using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Teste3D
{
    public partial class Form1 : Form
    {
        public Graphics oGraf = null;
        public Pen oPen = new Pen(Color.Black);

        public Point oMouse,oMagMouse = new Point();
        public List<Point3D[]> oForma = new List<Point3D[]>();
        public Point3D[] oVertices = null;
        public int nAzimuth,nElevation= 0;
        int nScale = 50;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            oGraf       = Box3D.CreateGraphics();
            nScale      = (int)(Width / 5f);
            Clear();
        }
        
        public void Clear()
        {
            oForma.Clear();

            Point3D[] oPontos = new Point3D[4];

            oPontos[0] = new Point3D(0, 0, 0);
            oPontos[1] = new Point3D(nScale, 0, 0);
            oPontos[2] = new Point3D(0, nScale, 0);
            oPontos[3] = new Point3D(0, 0, -nScale);

            Point3D[] oLine1 = new Point3D[2];
            oLine1[0] = oPontos[0];
            oLine1[1] = oPontos[1];
            oForma.Add(oLine1);
            Point3D[] oLine2 = new Point3D[2];
            oLine2[0] = oPontos[0];
            oLine2[1] = oPontos[2];            
            oForma.Add(oLine2);
            Point3D[] oLine3 = new Point3D[2];
            oLine3[0] = oPontos[0];
            oLine3[1] = oPontos[3];
            oForma.Add(oLine3);

            Draw();
        }
        public void Draw()
        {
            oGraf.Clear(Color.White);
            foreach (Point3D[] oP in oForma)
            {
                Point[] oPontos = new Point[oP.Length];
                for (int i = 0; i < oP.Length; i++)
                {
                    oPontos[i] = Cart2Pixel(oP[i].Refresh(nAzimuth, nElevation).To2D());
                }
                oGraf.DrawLines(oPen, oPontos);
            }
        }

        private void Box3D_MouseClick(object sender, MouseEventArgs e)
        {
            oMagMouse = new Point(e.X, e.Y);
            lblMagMouseX.Text = "MagX="+e.X.ToString();
            lblMagMouseY.Text = "MagY=" + e.Y.ToString();
        }

        private void Box3D_MouseMove(object sender, MouseEventArgs e)
        {
            oMouse = new Point(e.X, e.Y);
            lblMouseX.Text = "X="+e.X.ToString();
            lblMouseY.Text = "Y="+e.Y.ToString();

            if (e.Button !=0)
            {
                nAzimuth -= e.X - oMagMouse.X;
                nElevation += e.Y - oMagMouse.Y;
                oMagMouse.X = e.X;
                oMagMouse.Y = e.Y;

                Draw();
            }
            lblCood.Text = "Elev: " + nElevation + " deg, Azim: " + nAzimuth + " deg";
        }

        //Conversor de escala
        public Point Pixel2Cart(Point Ponto)
        {

            Ponto.X += -Width / 2;
            Ponto.Y += -Height / 2;

            Ponto.Y *= -1;

            return Ponto;
        }
        //Conversor de escala
        public Point Cart2Pixel(Point Ponto)
        {

            Ponto.X += Width / 2;
            Ponto.Y += -Height / 2;

            Ponto.Y *= -1;


            return Ponto;
        }

        private void cmdDraw_Click(object sender, EventArgs e)
        {

            float nX, nY, nZ;
            nX = float.Parse(txtX.Text);
            nY = float.Parse(txtY.Text);
            nZ = -float.Parse(txtZ.Text);

            int nTam = 360;
            int lnNX = 0;
            int lnNY = 0;
            Point3D[] Pontos = new Point3D[nTam + 1];

            for (int i = 0; i <= nTam; i++)
            {
                double DegInRad = 0;

                DegInRad = i * (Math.PI / 180);

                lnNX = Convert.ToInt32(Math.Round(nX + ((Math.Cos(DegInRad) * 50)), 0));
                lnNY = Convert.ToInt32(Math.Round(nY + ((Math.Sin(DegInRad) * 50)), 0));

                Pontos[i] = new Point3D(lnNX, lnNY, nZ);
            }
            oForma.Add(Pontos);

            Point3D[] oLine1 = new Point3D[2];
            oLine1[0] = new Point3D(nX, nY, nZ);
            oLine1[1] = new Point3D(nX + 10, nY + 10, nZ + 10);
            oForma.Add(oLine1);

            Draw();
        }
    }
}
