using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Drawing;

namespace ComplexCalc
{
   public class MathComplex
   {

        #region Inicio
            //variaveis para escala
            public int Escala;
            public int Centro;
            
            //Matriz para calculos adicionais
            //Coluns 0-nome,1-R de Z1,2-i de Z1,3-funcs em Z1,4-ordem,5-operação
            private String[,] OtherCalcs = new String[100,6];
            private int nCalcIndice = 0;



            public MathComplex(int nEscala,int nCentro)
            {

                Escala = nEscala;
                Centro = nCentro;

            }
       
                   /// <summary>
        /// The main entry point for the application.
        /// </summary>
            [STAThread]
            static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Form1());
        }

       #endregion Inicio

        #region Metodos_de_retorno_para_layot

        //retorna quantidade de calculos (expressões)
        public string[] GetCalcs()
        {
            string[] cCalcsName = new string[14];
            int nIndex = 0;


            cCalcsName[nIndex] = "Z+i";
            nIndex++;

            cCalcsName[nIndex] = "Z*2";
            nIndex++;

            cCalcsName[nIndex] = "-Z";
            nIndex++;

            cCalcsName[nIndex] = "Z*i";
            nIndex++;

            cCalcsName[nIndex] = "Z*(1+i)";
            nIndex++;
     
            cCalcsName[nIndex] = "Z^2";
            nIndex++;

            cCalcsName[nIndex] = "1/Z";
            nIndex++;

            cCalcsName[nIndex] = "x+2iy";
            nIndex++;

            cCalcsName[nIndex] = "Conj(Z)";
            nIndex++;

            cCalcsName[nIndex] = "9/Conj(Z)";
            nIndex++;

            cCalcsName[nIndex] = "Exp(Z)";
            nIndex++;

            cCalcsName[nIndex] = "Exp(1/Z)";

            nIndex++;
            cCalcsName[nIndex] = "Cos(Z)";

            nIndex++;
            cCalcsName[nIndex] = "Sin(Z)";

            return cCalcsName;
        }

      

        #endregion Metodos_de_retorno_para_layot

        #region Calculos_Suporte

        //Retorna o angulo "theta"
        public double BuscaAngulo(double X, double Y)
        {
            double nAngulo = 0;
            double nModulo = Modulo(X, Y);
            double nX = Math.Abs(X);
            double nY = Math.Abs(Y);

            if (nModulo.Equals(0)) 
            {
                nModulo = 1;
            }


            //Primeiro quadrante
            if (X >= 0 && Y >= 0)
            {
                if (nX >= nY)
                {
                    nAngulo = Math.Asin(nY / nModulo);
                }
                else
                {
                    nAngulo = Math.Acos(nX / nModulo);
                }
            }

            //segundo quadrante
            if (X < 0 && Y >= 0)
            {
                nAngulo = Math.PI / 2;
                if (nX >= nY)
                {
                    nAngulo += Math.Acos(nY / nModulo);
                }
                else
                {
                    nAngulo += Math.Asin(nX / nModulo);
                }
            }


            //Terceiro quadrante
            if (X < 0 && Y < 0)
            {
                nAngulo = Math.PI;
                if (nX >= nY)
                {
                    nAngulo += Math.Asin(nY / nModulo);
                }
                else
                {
                    nAngulo += Math.Acos(nX / nModulo);
                }
            }

            //Terceiro quadrante
            if (X >= 0 && Y < 0)
            {
                nAngulo = (3 * Math.PI) / 2;
                if (nX >= nY)
                {
                    nAngulo += Math.Asin(nX / nModulo);
                }
                else
                {
                    nAngulo += Math.Acos(nY / nModulo);
                }
            }


            return nAngulo;
        }


        //retorna Modulo/Hipotenusa/raio
        public double Modulo(double X, double Y)
        {
            return Math.Sqrt((X * X) + (Y * Y));

        }


        private Point BuscaNovo(Point Z,string cNome)
        {
            Point Z1 = new Point();
            Point P1 = new Point();
            Point P2 = new Point();
            Point PF = new Point();

            for (int i = 0; i <= nCalcIndice; i++)
            {
                if (cNome==OtherCalcs[i,0])
                {

                    if (OtherCalcs[i, 1] == "") { OtherCalcs[i, 1] = "0"; }
                    if (OtherCalcs[i, 2] == "") { OtherCalcs[i, 2] = "0"; }
                    
                    Z1.X = Convert.ToInt32(OtherCalcs[i, 1])*Escala;
                    Z1.Y = Convert.ToInt32(OtherCalcs[i, 2])*Escala;


                    string item = "";
                    for (int i2 = 0; i2 < OtherCalcs[i, 3].Length; i2++)
                    {
                        item = OtherCalcs[i, 3];
                        item = item.Substring(i2,1);

                        if (item.Equals("J"))
                        {
                            Z1 = Conj(Z1);
                        }

                        if (item.Equals("E"))
                        {
                            Z1 = Exp(Z1);
                        }

                        if (item.Equals("C"))
                        {
                            Z1 = Cos(Z1);
                        }

                        if (item.Equals("S"))
                        {
                            Z1 = Sin(Z1);
                        }

                    }

                    

                    if (OtherCalcs[i, 4] == "1")
                    {
                        P1 = Z;
                        P2 = Z1; 
                    }
                    if (OtherCalcs[i, 4] == "2")
                    {
                        P1 = Z1;
                        P2 = Z;
                    }


                    switch (OtherCalcs[i, 5])
                    {
                        case "+":
                            PF = Soma(P1, P2);
                            break;

                        case "-":
                            PF = Sub(P1, P2);
                            break;

                        case "/":

                            P1.X *= (Centro / 2);
                            P1.Y *= (Centro / 2);
                            
                           
                            PF = Divi(P1, P2);
                            break;

                        case "*":

                            if (OtherCalcs[i, 4] == "1")
                            {
                                 P2.X /= Escala;
                                 P2.Y /= Escala;
                            }
                            if (OtherCalcs[i, 4] == "2")
                            {
                                 P1.X /= Escala;
                                 P1.Y /= Escala;
                            }


                            PF = Multipl(P1, P2);
                            break;

                        case "^":
                            PF = Potencia(P1, P2.X);
                            break;

                        default:
                            PF = Z;
                            break;
                    }

                    i = nCalcIndice;
                }

            }


            return PF;
        }

        #region Conversores
        //Conversor de escala
        public Point Pixel2Cart(Point Ponto)
        {

            Ponto.X += -Centro;
            Ponto.Y += -Centro;


            Ponto.Y *= -1;
          

            return Ponto;
        }
        //Conversor de escala
        public Point Cart2Pixel(Point Ponto)
        {

            Ponto.X += Centro;
            Ponto.Y += -Centro;

            Ponto.Y *= -1;


            return Ponto;
        }
        #endregion Conversores


        #endregion Calculos_Suporte

        #region Operações

        public Point Soma(Point P1, Point P2)
        {
            P1.X = P1.X + P2.X;
            P1.Y = P1.Y + P2.Y;

            return P1;
        }

        public Point Sub(Point P1, Point P2)
        {
            P1.X = P1.X - P2.X;
            P1.Y = P1.Y - P2.Y;

            return P1;
        }

        public Point Multipl(Point P1, Point P2)
        {

            Point pRetorno = new Point();

            if (P2.Y.Equals(0))
            {
                pRetorno.X = P1.X * P2.X;
                pRetorno.Y = P1.Y * P2.X;
            }
            else
            {
                //forma trigonometrica
                double nModulo = Modulo(P1.X, P1.Y) * Modulo(P2.X, P2.Y);
                double nAngulo = BuscaAngulo(P1.X, P1.Y) + BuscaAngulo(P2.X, P2.Y);

                if (nAngulo > 2 * Math.PI)
                {
                    nAngulo = nAngulo % (2 * Math.PI);
                }

                pRetorno.X = (Convert.ToInt32(Math.Cos(nAngulo) * nModulo));
                pRetorno.Y = (Convert.ToInt32(Math.Sin(nAngulo) * nModulo));

            }



            return pRetorno;

        }

        public Point Potencia(Point Ponto, double Potencia)
        {

            //forma trigonometrica
            double nModulo = Modulo(Ponto.X, Ponto.Y);
            double nAngulo = BuscaAngulo(Ponto.X, Ponto.Y);
            double nModuloF = Math.Pow(nModulo,Potencia);

            //divido por metade deo centro para nao estourar muito na tela e ver o efeito da função
            Ponto.X = (Convert.ToInt32((Math.Cos(nAngulo * Potencia) * nModuloF) / (Centro/2)));
            Ponto.Y = (Convert.ToInt32((Math.Sin(nAngulo * Potencia) * nModuloF) / (Centro / 2)));

            return Ponto;
        }

        public Point Divi(Point P1, Point P2)
        {

            Point pRetorno = new Point();

           
            //forma trigonometrica
            double nModupoP1 = Modulo(P1.X, P1.Y);
            double nModuloP2 = Modulo(P2.X, P2.Y);

            if (nModuloP2.Equals(0))
            {
                pRetorno = P2;
            }
            else
            {

                double nModulo = nModupoP1 / nModuloP2;
                double nAngulo = BuscaAngulo(P1.X, P1.Y) - BuscaAngulo(P2.X, P2.Y);

                if (nAngulo > 2 * Math.PI)
                {
                    nAngulo = nAngulo % (2 * Math.PI);
                }

                pRetorno.X = Convert.ToInt32(Math.Cos(nAngulo) * nModulo);
                pRetorno.Y = Convert.ToInt32(Math.Sin(nAngulo) * nModulo);

            }
            return pRetorno;

        }

        public Point Conj(Point Ponto)
        {
            Ponto.Y *= -1;
            return Ponto;
        }

        public Point Exp(Point Ponto)
        {

            double X = 0, Y = 0;
            double X1 = 0, Y1 = 0;
            X1 = Convert.ToDouble(Ponto.X) / Escala;
            Y1 = Convert.ToDouble(Ponto.Y) / Escala;

            X = Math.Cos(Y1) * Math.Exp(X1);
            Y = Math.Sin(Y1) * Math.Exp(X1);

            try
            {
                Ponto.X = Convert.ToInt32(Convert.ToDouble(X));
                Ponto.Y = Convert.ToInt32(Convert.ToDouble(Y));
            }
            catch (Exception)
            {
                Ponto.X = 0;
                Ponto.Y = 0;                
            }
            return Ponto;
        }
      
        public Point Cos(Point Ponto)
        {
            /*
             * Cos(Z)= (e^iz+e^-iz)/2 
             */

            Point ExpZ1 = Multipl(Ponto,new Point(0,1));
            Point ExpZ2 = Multipl(Ponto, new Point(0,-1));

            ExpZ1 = Exp(ExpZ1);
            ExpZ2 = Exp(ExpZ2);

            Point pRet = Soma(ExpZ1, ExpZ2);

            pRet = Divi(pRet, new Point(2, 0));

            return pRet;
        }

        public Point Sin(Point Ponto)
        {
            /*
            * Sin(Z)= (e^iz - e^-iz)/2i
            */

            Point ExpZ1 = Multipl(Ponto, new Point(0, 1));
            Point ExpZ2 = Multipl(Ponto, new Point(0, -1));

            ExpZ1 = Exp(ExpZ1);
           

            Point pRet = Sub(ExpZ1, ExpZ2);

            pRet = Divi(pRet, new Point(2, 1));

            return pRet;
        }

        #endregion Operações

        #region Aplicaçao

        public Point Aplicar(Point Ponto,string cIndex)
        {

            Point pAux = new Point();
            Ponto = Pixel2Cart(Ponto);


            switch (cIndex)
            {

                case "Z+i":
                    //Z=Z+i
                    pAux.X = 0;
                    pAux.Y += Escala;
                    Ponto = Soma(Ponto, pAux);

                    break;

                case "Z*2":
                    //Z=Z*2
                    pAux.X = 2;
                    pAux.Y = 0;
                    Ponto = Multipl(Ponto, pAux);

                    break;

                case "-Z":
                    //Z=-Z
                    pAux.X = -1;
                    pAux.Y = 0;
                    Ponto = Multipl(Ponto, pAux);

                    break;

                case "Z*i":
                    //Z= Z * i
                    pAux.X = 0;
                    pAux.Y = 1;
                    Ponto = Multipl(Ponto, pAux);

                    break;

                case "Z*(1+i)":
                    //Z= Z * (1+i)
                    pAux.X = 1;
                    pAux.Y = 1;
                    Ponto = Multipl(Ponto, pAux);

                    break;

                case "Z^2":
                    //Z= Z ^ 2
                    pAux.X = Ponto.X;
                    pAux.Y = Ponto.Y;
                    Ponto = Potencia(Ponto, 2);

                    break;

                case "1/Z":
                    //1/Z
                    pAux.X = Escala * (Centro / 2);
                    pAux.Y = 0;
                    Ponto = Divi(pAux,Ponto);

                    break;

                case "x+2iy":
                    //x+2iy

                    Ponto.Y *= 2;

                    break;

                case "Conj(Z)":
                    //Conjugado Z
                     Ponto=Conj(Ponto);

                    break;

                case "9/Conj(Z)":
                    // 9 / Conjugado(Z)
                    Ponto = Conj(Ponto);

                    pAux.X = (Escala * 9) * (Centro / 2);
                    pAux.Y = 0;

                    Ponto = Divi(pAux, Ponto);

                    break;                

                case "Exp(Z)":

                    Ponto = Exp(Ponto);
                    break;

                case "Exp(1/Z)":
                    pAux.X = Escala*Centro;
                    pAux.Y = 0;
                    Ponto = Divi(pAux,Ponto);
                    Ponto = Exp(Ponto);
                    break;

                case "Cos(Z)":
                    Ponto = Cos(Ponto);
                    break;

                case "Sin(Z)":
                    Ponto = Sin(Ponto);
                    break;

                default:
                    Ponto=BuscaNovo(Ponto, cIndex);
                    break;
                             
            }


            Ponto = Cart2Pixel(Ponto);

            return Ponto;
        }
       
        public string AddCalc()
        {

            OtherCalc Form = new OtherCalc(ref OtherCalcs, nCalcIndice);
            Form.ShowDialog();
            if (OtherCalcs[nCalcIndice, 0] != "")
            {
                nCalcIndice++;
                return OtherCalcs[nCalcIndice - 1, 0];
            }
            else
            {
                return "";
            }
           
        }

        #endregion Aplicaçao

    }
}
