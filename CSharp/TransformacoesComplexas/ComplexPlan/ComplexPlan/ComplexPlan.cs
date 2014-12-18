using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using ComplexCalc;
using ComplexPlan.Classes;

namespace ComplexPlan
{
    public partial class ComplexPlan : Form
    {
        public static Form form     = ComplexPlan.ActiveForm;

        // VARIAVEIS DE GRAFICOS
        public static Graphics Tela      = null;
        public static Graphics oPainel1  = null;
        public static Graphics oPainel2  = null;
        public static Graphics Fundo     = null;
        public static Graphics CalcFundo = null;

        // FERRAMENTAS DE DESENHO
        public static SolidBrush Preto    = new SolidBrush(Color.Black);
        public static SolidBrush Vermelho = new SolidBrush(Color.Red);
        public static SolidBrush Azul     = new SolidBrush(Color.Blue);
        public static Pen Caneta          = new Pen(Preto, 1);

        //TELA PARA DESENHO
        public static Boolean Desenhar      = false;
        public static Boolean DesenharForma = false;
        public static Boolean Image         = false;
        public static int Forma             = 0; // 0 = DESENHAR EM PONTOS

        public static Point[] Pontos     = new Point[9999];
        public static int ContP          = 0;
        public static Point[] PontosCalc = new Point[9999];

        // PONTOS PADROES
        public static int X  = 30;  //POSIÇÃO X DA IMAGE NO FORM
        public static int Y  = 30;  //POSIÇÃO Y DA IMAGE NO FORM
        public static int M  = 360; //TAMANHO A IMAGE
        public static int Q2 = 400; //DISTANCIA DE X DA PRIMEIRA IMAGE PARA O X DA SEGUNDA
        public static int E  = 20;  //ESCALA DOS PONTOS
        public static int E2 = 20;  //ESCALA DOS PONTOS 2

        //PAPEIS PARA OS FUNDOS
        public static Bitmap DesenhoFundo = new Bitmap(M, M);
        public static Bitmap DesenhoCalc  = new Bitmap(M, M);

        //CLASSE INTERMEDIARIA DE CALCULO
        private static Calc Calculo     = new Calc(E,M/2);
        private static Formas oFormas   = new Formas(E,M,null);

        public ComplexPlan()
        {
            InitializeComponent();
        }

        private void ComplexPlan_Load(object sender, EventArgs e)
        {
            // CRIA ITENS DO MENU DE CONTEXTO
            ContextMenu.Items.Add("Save", null, salvar);
            // DEFINE LISTA PARA CLASSE DE FORMAS
            oFormas.oListaCalc = lstCALC;
            // TAMANHO DA LINHA
            sbarLINHA.Value = Convert.ToInt32(Caneta.Width);
            txtLINHA.Text = Convert.ToInt32(Caneta.Width).ToString();

            Limpar();

            //CONFIGURA IMAGENS
            Imagem1.Left    = X;
            Imagem1.Top     = Y;
            Imagem1.Width   = M;
            Imagem1.Height  = M;

            Imagem2.Left    = X + Q2;
            Imagem2.Top     = Y + 1;
            Imagem2.Width   = M;
            Imagem2.Height  = M;
            
            Tela = this.CreateGraphics();
            oPainel1 = Imagem1.CreateGraphics();
            oPainel2 = Imagem2.CreateGraphics();

            // LISTA DE CALCULOS
            string[] ListaCalc = Calculo.GetCalcs();

            for (int i = 0; i < ListaCalc.Length; i++)
            {
                cboREGRAS.Items.Add(ListaCalc[i].TrimEnd());
            }
            cboREGRAS.SelectedIndex = 0;
            cboREGRAS.Refresh();

            // LISTA DE FORMAS
            string[] ListaFormas = Formas.GetFormas();

            for (int i = 0; i < ListaFormas.Length; i++)
            {
                if (!String.IsNullOrEmpty(ListaFormas[i]))
                {
                    cboFORMAS.Items.Add(ListaFormas[i].TrimEnd());    
                }
            }
            cboFORMAS.SelectedIndex = 0;
            cboFORMAS.Refresh();
        }

        #region FUNCOES

        public void inicio()
        {
            // DESENHA PONTOS DE REFERENCIA DO FUNDO
            if (!Image)
            {
                LinhaPotilhada(Preto, Fundo, E);
                LinhaPotilhada(Preto, CalcFundo, E2);
            }

            DesenharPontos(Azul, Fundo, Pontos);
            DesenharPontos(Azul, CalcFundo, PontosCalc);

            Imagem1.Image = DesenhoFundo;
            Imagem2.Image = DesenhoCalc;

            Pontos      = new Point[9999];
            PontosCalc  = new Point[9999];
            ContP = 0;
        }

        public Point AjustaEscala(Point Ponto, Bitmap Desenho)
        {
            if (!Image)
            {
                Ponto = Calculo.Conv(Ponto);
            }

            int nDIVI = 1;
            if (this.optZ1.Checked) { nDIVI = 1; }
            if (this.optZ2.Checked) { nDIVI = 2; }
            if (this.optZ3.Checked) { nDIVI = 4; }
            Ponto.X /= nDIVI;
            Ponto.Y /= nDIVI;
            
            Calculo.Escala = E2;

            if (Image && nDIVI>1)  
            {
                Ponto.X = (Ponto.X) + (M / 2) - ((Desenho.Width / 2) / nDIVI);
                Ponto.Y = (Ponto.Y) + (M / 2) - ((Desenho.Height / 2) / nDIVI);
            }

            if (!Image)
            {
                Ponto = Calculo.DConv(Ponto);
            }

            return Ponto;
        }

        public void PointsImg(bool AplicarCalc)
        {

            Bitmap DesenhoCalc2 = DesenhoFundo;

            SpecialPoint[] Spoint = new SpecialPoint[999999];

            Point Pixel = new Point();
            int count = 0;
            int i = 1;
            int i2 = 1;

            for (i = 1; i < DesenhoFundo.Width; i++)
            {
                for (i2 = 1; i2 < DesenhoFundo.Height; i2++)
                {
                    Pixel = new Point(i, i2);

                    Pixel = AjustaEscala(Pixel, DesenhoCalc);

                    if (AplicarCalc)
                    {
                        Pixel = Calculo.AplicaCalc(Pixel, lstCALC);
                    }

                    Spoint[count] = new SpecialPoint(Pixel.X, Pixel.Y, DesenhoFundo.GetPixel(i, i2));

                    count++;
                }
            }

            // REDESENHA OS PIXELS EM UMA NOVA IMAGEM EM BRANCO
            Pixels CalcPixels = new Pixels(new Bitmap(M, M), Spoint, count);
            DesenhoCalc = CalcPixels.ModifyPixels();

            Imagem2.Image = DesenhoCalc;
            Imagem2.Refresh();
        }

        public void Limpar()
        {
            txtIMAGEM.Text = "";
            //lstCALC.Items.Clear(); //&&&
            DesenhoFundo = new Bitmap(M, M);
            DesenhoCalc = new Bitmap(M, M);

            Fundo = Graphics.FromImage(DesenhoFundo);
            CalcFundo = Graphics.FromImage(DesenhoCalc);

            Image = false;
            inicio();
        }

        private void AtuEscala()
        {
            if (Image)
            {
                PointsImg(true);
            }
            else
            {
                Limpar();
                inicio();
            }
        }
        #endregion

        #region MOUSE

        private void painel1_MouseMove(object sender, MouseEventArgs e)
        {
            if (!Image)
            {
                Point oMouse = new Point(e.X, e.Y);
                Point[] pForma = null;

                Imagem1.Refresh();
                Imagem2.Refresh();

                //MUDA PONTO PARA FORMATO CARTESIANO
                txtX.Text = (Convert.ToDouble(Calculo.Conv(oMouse).X)/E).ToString();
                txtY.Text = (Convert.ToDouble(Calculo.Conv(oMouse).Y)/E).ToString(); 

                txtX2.Text = (Convert.ToDouble(Calculo.Conv(oMouse).X)/E).ToString();
                txtY2.Text = (Convert.ToDouble(Calculo.Conv(oMouse).Y)/E).ToString();

                MovLinha(Vermelho, oPainel1, oMouse);
                MovLinha(Vermelho, oPainel2, AjustaEscala(Calculo.AplicaCalc(oMouse, lstCALC), new Bitmap(1, 1)));

                pForma = oFormas.DesenharFormas(cboFORMAS.SelectedIndex, oMouse);

                DesenhaFormas(pForma);
            }
        }

        private void Imagem1_MouseDown(object sender, MouseEventArgs e)
        {
            Desenhar = true;

            if (cboFORMAS.SelectedIndex > 0)
            {
                DesenharForma = true;
                oFormas.oFixPonto.X = e.X;
                oFormas.oFixPonto.Y = e.Y;
            }
        }

        private void Imagem1_MouseUp(object sender, MouseEventArgs e)
        {
            Desenhar = false;

            if (DesenharForma)
            {
                Point oMouse = new Point(e.X, e.Y);

                Point[] oPontos = oFormas.DesenharFormas(cboFORMAS.SelectedIndex, oMouse);

                for (int i = 0; i < oPontos.Length; i++)
                {
                    Pontos[ContP] = oPontos[i];

                    // SEGUNDO PLANO
                    PontosCalc[ContP] = AjustaEscala(Pontos[ContP], new Bitmap(1, 1));
                    PontosCalc[ContP] = Calculo.AplicaCalc(PontosCalc[ContP], lstCALC);
                    ContP++;
                }

                DesenharForma = false;
            }

            //FIXA OS PONTOS NO FUNDO PARA EVITAR PERDA DE DESEMPENHO
            inicio();
        }
    #endregion

        # region DESENHAR

        public void DesenhaFormas(Point[] toPoints)
        {
            if (Desenhar && (cboFORMAS.SelectedIndex == 0))
            {
                GravaPontos(Azul, toPoints);
            }

            if (Desenhar && (cboFORMAS.SelectedIndex > 0))
            {
                GravaLinhas(Azul, toPoints);
            }
        }

        public void GravaPontos(Brush toCOR, Point[] toPontos)
        {
            for (int i = 0; i < toPontos.Length; i++)
            {
                Pontos[ContP] = toPontos[i];

                // DESENHA SEGUNDO PLANO
                PontosCalc[ContP] = AjustaEscala(Pontos[ContP], new Bitmap(1, 1));
                PontosCalc[ContP] = Calculo.AplicaCalc(PontosCalc[ContP], lstCALC);

                DesenharPontos(toCOR, oPainel1, Pontos);
                DesenharPontos(toCOR, oPainel2, PontosCalc);
                ContP++;
            }
        }

        public void GravaLinhas(Brush toCOR, Point[] toPontos)
        {
            DesenharLinhas(toCOR, oPainel1, toPontos);

            for (int i = 0; i < toPontos.Length; i++)
            {
                toPontos[i] = AjustaEscala(toPontos[i], new Bitmap(1, 1));
                toPontos[i] = Calculo.AplicaCalc(toPontos[i], lstCALC);
            }

            DesenharLinhas(toCOR, oPainel2, toPontos);
        }

        public void MovLinha(Brush oCor, Graphics oPapel, Point oMoseMov)
        {
            Caneta.Width = 1;
            DesenharLinhas(oCor, oPapel, oFormas.Linha((M / 2), (M / 2), oMoseMov.X, oMoseMov.Y));
            Caneta.Width = sbarLINHA.Value / 10;
        }

        public void LinhaPotilhada(Brush toCOR, Graphics Papel, int nEscala)
        {
            Caneta.Width = 1;
            for (int i2 = nEscala; i2 <= M + nEscala; i2 = i2 + nEscala)
            {
                for (int i = nEscala; i <= M + nEscala; i = i + nEscala)
                {
                    DesenharLinhas(toCOR, Papel, oFormas.Linha(i, i2, i + 1, i2));
                }
            }
            DesenharLinhas(toCOR, Papel, oFormas.Linha(M / 2, 0, M / 2, M));
            DesenharLinhas(toCOR, Papel, oFormas.Linha(0, M / 2 + 1, M, M / 2 + 1));
            Caneta.Width = sbarLINHA.Value / 10;
        }

        public void DesenharPontos(Brush oCor, Graphics Papel, Point[] pontos)
        {
            // SÓ DESENHA APARTIR DE 2 PONTOS
            if (ContP > 1)
            {
                Caneta.Brush = oCor;
                Papel.DrawCurve(Caneta, pontos, 0, ContP - 1, 0);
            }
        }

        public void DesenharLinhas(Brush oCor, Graphics Papel, Point[] oPontos)
        {
            Caneta.Brush = oCor;
            if (oPontos.Length > 1)
            {
                try{Papel.DrawLines(Caneta, oPontos);}
                catch (Exception){}
            }
        }

        #endregion

        # region EVENTOS

        private void cmdLIMPAR_Click(object sender, EventArgs e)
        {
            Limpar();
        }

        private void cmdBROWSERIMG_Click(object sender, EventArgs e)
        {
            OpenFile.Title = "Escolha Uma Imagem";
            OpenFile.Filter = "Imagens|*.jpg|Imagens|*.gif";
            OpenFile.ShowDialog();
            

            if (!(String.IsNullOrEmpty(OpenFile.FileName)))
            {

                txtIMAGEM.Text = OpenFile.FileName;
                DesenhoFundo = new Bitmap(txtIMAGEM.Text);

                //redimensiona imagem para nao perder suas proporções e nao pesar muito
                Bitmap FundoAux = new Bitmap(M, M);
                Graphics loGfx = Graphics.FromImage(FundoAux);
                loGfx.Clear(Color.White);


                if (DesenhoFundo.Width > DesenhoFundo.Height)
                {
                    int nConv = (DesenhoFundo.Height * M / DesenhoFundo.Width);
                    loGfx.DrawImage(DesenhoFundo, 0, ((M / 2) - (nConv / 2)), M, nConv);
                }

                if (DesenhoFundo.Width < DesenhoFundo.Height)
                {
                    int nConv = (DesenhoFundo.Width * M / DesenhoFundo.Height);
                    loGfx.DrawImage(DesenhoFundo, ((M / 2) - (nConv / 2)), 0, nConv, M);
                }

                if (DesenhoFundo.Width == DesenhoFundo.Height)
                {
                    loGfx.DrawImage(DesenhoFundo, 0, 0, M, M);
                }

                DesenhoFundo = FundoAux;
                DesenhoCalc  = new Bitmap(DesenhoFundo);
                
                Fundo       = Graphics.FromImage(DesenhoFundo);
                CalcFundo   = Graphics.FromImage(DesenhoCalc);
                Image = true;
                PointsImg(false);
                lstCALC.ClearSelected();

                inicio();               
            }
        }

        private void cmdADD_Click(object sender, EventArgs e)
        {
            lstCALC.Items.Add(cboREGRAS.Text);

            if (Image)
            {
                PointsImg(true);
            }
        }

        private void cmdREMOVER_Click(object sender, EventArgs e)
        {
            lstCALC.Select();
            lstCALC.Items.Remove(lstCALC.SelectedItem);
            lstCALC.Focus();

            if (Image)
            {
                PointsImg(true);
            }
        }

        private void btnOther_Click(object sender, EventArgs e)
        {
            string cNew = Calculo.MoreCalcs();

            if (!string.IsNullOrEmpty(cNew))
            {
                lstCALC.Items.Add(cNew);     
            }
            if (Image)
            {
                PointsImg(true);
            }
        }
        
        private void optZ1_CheckedChanged(object sender, EventArgs e)
        {
            E2 = 20;
            AtuEscala();
        }

        private void optZ2_CheckedChanged(object sender, EventArgs e)
        {
            E2 = 10;
            AtuEscala();
        }

        private void optZ3_CheckedChanged(object sender, EventArgs e)
        {
            E2 = 5;
            AtuEscala();
        }

        private void salvar(object sender, EventArgs e)
        { 
            SaveFile.Title = "Salvar Imagem!";
            SaveFile.Filter = "JPeg Image|*.jpg|Bitmap Image|*.bmp|Gif Image|*.gif";
            SaveFile.ShowDialog();

            if (!(String.IsNullOrEmpty(SaveFile.FileName)))
            {
                DesenhoCalc.Save(SaveFile.FileName);
            }
        }

        private void cboFORMAS_SelectedIndexChanged(object sender, EventArgs e)
        {
            Forma = cboFORMAS.SelectedIndex;
        }

        private void sbarLINHA_Scroll(object sender, ScrollEventArgs e)
        {
            Caneta.Width = sbarLINHA.Value / 10;
            txtLINHA.Text = (sbarLINHA.Value/10).ToString();
        }

    #endregion
    }
}
