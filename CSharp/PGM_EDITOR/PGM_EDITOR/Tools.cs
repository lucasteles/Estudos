using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using draw = System.Drawing;
using System.Windows;
using System.Diagnostics;


namespace PGM_EDITOR
{
    public class Tools
    {


        private void Export(double[,] matrix)
        {
            var width = matrix.GetLength(0);
            var height = matrix.GetLength(1);
            using (TextWriter tw = new StreamWriter("out.txt"))
            {
                for (int j = 0; j < width; j++)
                {
                    for (int i = 0; i < height; i++)
                    {
                        if (i != 0)
                        {
                            tw.Write(" ");
                        }
                        tw.Write(matrix[i, j]);
                    }
                    tw.WriteLine();
                }
            }
        }

        #region "Modulo 11"
   
        public PgmImg Erosion(PgmImg img)
        {
            var ret = img.Clone();
            var Estruturante = CriaMatrizEstruturante(img);

            for (int i = 0; i < img.Width; i++) 
                for (int j = 0; j < img.Height; j++)
                    windowMorpho(0, img, ret, Estruturante, i, j);
                
            

            return ret;
        }

        public PgmImg Expansion(PgmImg img)
        {
            var ret = img.Clone();
            var EstruturanteNormal = CriaMatrizEstruturante(img);

            // espelha estrutura
            var Estruturante = (double[,])EstruturanteNormal.Clone();
            var n = img.ReduceTo;
            for (int i = 0; i < n; i++)
                for (int j = 0; j < n; j++)
                    Estruturante[i, j] = EstruturanteNormal[n-i-1,n-j-1];

            for (int i = 0; i < img.Width; i++)
                for (int j = 0; j < img.Height; j++)
                    windowMorpho(1, img, ret, Estruturante, i, j);
     
            return ret;
        }

        private void windowMorpho(int type, PgmImg img,  PgmImg ret, double[,] estruturante, int x, int y)
        {
            int size = img.ReduceTo,
               x_aux = x - size / 2,
               y_aux = y - size / 2,
               E = type == 0 ? 255 : 0;
         

            for (int i = x_aux; i < x_aux + size; i++) 
                for (int j = y_aux; j < y_aux + size; j++)
                    if (j < img.Height && j >= 0 && i >= 0 && i < img.Width)
                    {
                        var val = estruturante[i + (size / 2) - x, j + (size / 2) - y];
                        if (!Double.IsNegativeInfinity(val))
                        {
                            if (type==0) // erosion
                                if (E > img[i, j] - val)
                                    E = (int)(img[i, j] - val);
                            
                            if (type == 1) // dilatação
                                if (E < img[i, j] + val)
                                    E = (int)(img[i, j] + val);
                        }
                    }

            for (int i = x_aux; i < x_aux + size; i++)
                for (int j = y_aux; j < y_aux + size; j++)
                    if (j < img.Height && j >= 0 && i >= 0 && i < img.Width)
                    {
                       var val  = (estruturante[i + (size / 2) - x, j + (size / 2) - y] + E);
                       if (!double.IsNegativeInfinity(val))
                           ret[i, j] = (byte)Normalize(val);                        
                    }
        }

        private double[,] CriaMatrizEstruturante(PgmImg img)
        {
            var dim = img.ReduceTo;
            var ret = new Double[dim, dim];


            using (FileStream fs = new FileStream("elements\\" + dim.ToString() + ".txt", FileMode.Open))
            {
                using (BinaryReader reader = new BinaryReader(fs, Encoding.ASCII))
                {
                    for (int i = 0; i < dim; i++)
                        for (int j = 0; j < dim; j++)
                        {
                            var c = reader.ReadChar();
                            if (c == '\n' || c == '\r')
                            {
                                j--;
                                continue;
                            }

                            double val = 0;

                            if (c == 'X' || c == 'x')
                                val = Double.NegativeInfinity;
                            else
                                val = Double.Parse(c.ToString());

                            ret[i, j] = val;
                        }

                }
            }


            return ret;
        }

        #endregion

        #region "Modulo 9, 10"

        public PgmImg Highlight(PgmImg pgm)
        {
            var lapla = LaplacianaMatrix(pgm);

            var matCalc = new double[pgm.Width, pgm.Height];

              Parallel.For(0, pgm.Width, i => {
                  Parallel.For(0, pgm.Height, j => {
                      matCalc[i, j] =  ((double)pgm[i, j]) - lapla[i, j]; 
                  });
              });


            return Map(matCalc);
        }

       public PgmImg Laplaciana(PgmImg pgm)
       {
           var lapla = LaplacianaMatrix(pgm, e => e / 8 + (255f/2) );
           //Export(lapla);
           return Map(lapla);
       }


       private double[,] LaplacianaMatrix(PgmImg pgm, Func<double, double> Map = null)
        {
            // Laplaciana
            Func<double, double, double, double, double>
               g = (x, y, r, t) => (-1 / (Math.PI * Math.Pow(t,4))) * (1 - ((x * x + y * y) / (2 * t * t))) * Math.Exp( -((x * x + y * y ) / (2 * t * t)) );

            /* Func<double, double, double, double, double>
                g = (x, y, r, t) =>
                {
                    var ret = 0.00;

                    if (x == 0 && y == 0)
                        ret = 4;

                    if (x == 1 && y == 0)
                        ret = -1;

                    if (x == 0 && y == 1)
                        ret = -1;

                    if (x == 1 && y == 1)
                        ret = 0;

                    return ret;
                };*/

            return windowFor(pgm, g, Map); 
        }

        public PgmImg Gaussian(PgmImg pgm)
        {
            // Gaussiana
            Func<double, double, double, double, double>
                g = (x, y, r, t) => (1F / (2F * Math.PI * t * t)) * Math.Pow(Math.E,  ((-1F * (x * x + y * y)) / (2F * t * t)) );

            var betaMatrix = windowFor(pgm, g);
            return Map(betaMatrix);
        }

        private double[,] windowFor(PgmImg pgm, Func<double, double, double, double, double> F, Func<double, double> MapF = null)
        {
            var ret = new double[pgm.Width,pgm.Height];
            
            /*
            Parallel.For(0, pgm.Width, i =>
            {
                Parallel.For(0, pgm.Height, j =>
                {
                    var newValue = windowProcess(pgm, i, j, F);

                    if (MapF != null)
                        newValue = MapF(newValue);

                    ret[i, j] = newValue;
                }); 
            });
            */

            for (int i = 0; i < pgm.Width; i++)
            {
                for (int j = 0; j < pgm.Height; j++)
                {
                    var newValue = windowConvolution(pgm, i, j, F);

                    if (MapF != null)
                        newValue = MapF(newValue);

                    ret[i, j] = newValue;
                }
            }
            return ret;
        }

        private double windowConvolution(PgmImg img, int x, int y, Func<double, double, double, double, double> F)
        {
            int size = img.ReduceTo,
               x_aux = x - size / 2,
               y_aux = y - size / 2;

            double ret = 0;
                          

            for (int i = x_aux; i < x_aux + size; i++)
                for (int j = y_aux; j < y_aux + size; j++)
                    if (j < img.Height && j >= 0 && i >= 0 && i < img.Width)
                        ret += ((double)img[i, j]) * F(Math.Abs(x - i), Math.Abs(y - j), size, img.Sigma == 0 ? (size / 6F) : img.Sigma);

            
            return ret;
            
        }

        private PgmImg Map(double[,] mat)
        {
            var pgm = new PgmImg((int)mat.GetLongLength(0), (int)mat.GetLongLength(1));

            Parallel.For(0, pgm.Width, i =>
            {
                Parallel.For(0, pgm.Height, j =>
                {
                    pgm[i, j] = Normalize(Math.Round(mat[i, j]));
                });
            });

            return pgm;
        }
        #endregion

        #region "Modulo 7,  8"
        public  PgmImg Average(PgmImg pgm)
        {
            return SiblingScan(AverageOptions.Normal, pgm);
        }

        public  PgmImg Median(PgmImg pgm)
        {

            return SiblingScan(AverageOptions.Median, pgm);
         
        }


        private PgmImg SiblingScan(AverageOptions opt, PgmImg pgm)
        {

            var ret = new PgmImg(pgm.Width, pgm.Height);
            ret.ReduceTo = pgm.ReduceTo;

            Parallel.For(0, pgm.Width, i => {
                Parallel.For (0, pgm.Height, j => {
                    ret[i, j] = LocalAverage(pgm, i, j, opt);
                });
            });

            return ret;
        }

        private byte LocalAverage(PgmImg img, int x, int y, AverageOptions Opt)
        {

            
            int size = img.ReduceTo,
                x_aux = x - size / 2,
                y_aux = y - size / 2,
                media = 0,
                size2 = (int)Math.Pow(size, 2),
                divisor = 0;
                

            var siblings = new int[size2];

            var mat = img.Matrix;
            for (int i = x_aux; i < x_aux + size; i++)
                for (int j = y_aux; j < y_aux + size; j++)
                    if (j < img.Height && j >= 0 && i >= 0 && i < img.Width)
                    {
                        media += mat[i, j];
                        siblings[divisor] = mat[i, j];
                        divisor++;
                    }

            //decisoes de saida
            byte ret = 0;
            if (Opt == AverageOptions.Normal)
                ret = (byte)Math.Round((double)media / divisor);
            else if (Opt == AverageOptions.Median)
            {
                int meio = (int)(((double)divisor / 2));
                siblings = counting_sort(siblings);

                if (divisor%2 == 0)
                    ret = (byte)((siblings[meio]+siblings[meio-1])/2);
                else
                    ret = (byte)siblings[meio];
            }


            return ret;
        }

        public int[] counting_sort(int[] arr)
        {
            var k = 255;
            var count = new int[k + 1];
            for (int i = 0; i < arr.Length; i++)
                count[arr[i]]++;

            for (int i = 1; i <= k; i++)
                count[i] = count[i] + count[i - 1];

            var b = new int[arr.Length];
            for (int i = arr.Length - 1; i >= 0; i--)
            {
                count[arr[i]]--;
                b[count[arr[i]]] = arr[i];
            }
            return b;
        }

        #endregion

        #region "Modulo 6"

        public  PgmImg Equalize(PgmImg pgm)
        {

            var Acumulativo = pgm.CumulativePallete();
            var min = Acumulativo.Min();
            var max = Acumulativo[255];
            var ret = pgm.Clone();

     
           

            for (int i = 0; i < pgm.Width; i++)
                for (int j = 0; j < pgm.Height; j++)
                    ret[i, j] = (byte) (
                                            (
                                                (double)
                                                (Acumulativo[pgm[i, j]] - min) /
                                                (max - min) 
                                            )
                                        *255);   

            return ret;

        }

        #endregion

        #region "Modulo 5"
        public  PgmImg FloydSteinberg(PgmImg pgm)
        {


            var temp = pgm.Clone();
            
            var width = temp.Width-1;
            var height = temp.Height-1;

            for (int i = 0; i < temp.Width; i++)
                for (int j = 0; j < temp.Height; j++)
                {
                    var original = temp[i, j];
                    temp[i, j] = Reduce(temp[i, j], pgm.ReduceTo);
                    var error = (double)original - (double)temp[i, j];

                    if (j < height)
                        temp[i, j + 1] = Normalize(temp[i + 0, j + 1] + error * MagicNumbers.Right);

                    if (i < width)
                        temp[i + 1, j ] = Normalize(temp[i + 1, j + 0] + error * MagicNumbers.Down);

                    if (j < height && i < width)
                        temp[i + 1, j + 1] = Normalize(temp[i + 1, j + 1] + error * MagicNumbers.DownRight);

                    if (j > 0 && i < width)
                        temp[i + 1, j - 1] = Normalize(temp[i + 1, j - 1] + error * MagicNumbers.DownLeft);

                }

            return temp;
        }
        #endregion

        #region "Modulo 4"

        public PgmImg ReduceColors(PgmImg pgm)
        {
            var temp = pgm.Clone();


            for (int i = 0; i < pgm.Width; i++)
                for (int j = 0; j < pgm.Height; j++)
                    temp[i, j] = Reduce(pgm[i, j], pgm.ReduceTo);


            /*
            // outra forma - mais lenta
           var newColorArray = new int[pgm.ReduceTo];
           for (int i = 0; i < pgm.ReduceTo ; i++)
               newColorArray[i] = i * (255 / (pgm.ReduceTo-1));
            
           for (int i = 0; i < matrix.GetLength(0); i++)
               for (int j = 0; j < matrix.GetLength(1); j++)
                   temp[i, j] = (byte)Closest((int)matrix[i, j], newColorArray);  
           */


            return temp;
        }

        private  byte Reduce(byte value, int colors)
        {
            byte ret;
            ret = (byte)Math.Round((colors - 1) * (double)value / 255);
            ret = (byte)Math.Round(255 * (double)ret / (colors - 1));

            return ret;
        }

        private byte Normalize(double color)
        {
            return (byte)(color > 255 ? 255 : (color < 0 ? 0 : color));
        }

        private  int Closest(int closest, int[] values)
        {
            int indice = values.Count()-1;
            int minDiff = values[indice];
            

            for (int i = 0; i < values.Length; i++)
            {
                if (Math.Abs(closest - values[i]) <= minDiff)
                {
                    minDiff = Math.Abs(closest - values[i]);
                    indice = i;
                }

            }

            return values[indice];

            
        }
        #endregion

        #region "Modulo 2"
        public  PgmImg Transpose(PgmImg pgm)
        {
         
            var temp = new PgmImg(pgm.Height, pgm.Width);

            for (int i = 0; i < pgm.Width; i++)
                for (int j = 0; j < pgm.Height; j++)
                    temp[j, i] = pgm[i, j];


            return temp;
        }

        public  PgmImg MirrorX(PgmImg pgm)
        {
            var temp = pgm.Clone();

            for (int i = 0; i < pgm.Width; i++)
                for (int j = 0; j < pgm.Height; j++)
                    temp[i, j] = pgm[pgm.Width-1-i, j];

            return temp;

        }

        public  PgmImg MirrorY(PgmImg pgm)
        {

            var temp = pgm.Clone();

            for (int i = 0; i < pgm.Width; i++)
                for (int j = 0; j < pgm.Height; j++)
                    temp[i, j] = pgm[i, pgm.Height - 1 - j];

            return temp;

        }

        public  PgmImg RotateR(PgmImg bitmap)
        {
            var ret = MirrorX(Transpose(bitmap));            
            return ret;
        }

        public  PgmImg RotateL(PgmImg bitmap)
        {
            var ret = MirrorY(Transpose(bitmap));
            return ret;
        }
        #endregion

    }
}
