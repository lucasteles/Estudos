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


namespace PGM_EDITOR
{
    public class Tools
    {

        public  PgmImg Average(PgmImg pgm)
        {
            var ret = new PgmImg(pgm.Width, pgm.Height);

            
            Parallel.For(0, pgm.Width, i =>
            {
                Parallel.For(0, pgm.Height, j =>
                {
                    ret[i, j] = LocalAverage(pgm, i, j);
                });
            });

         
            return ret;
        }

        private byte LocalAverage(PgmImg img,int x,int y)
        {
            double media = 0;
            
            int size = img.ReduceTo,
                x_aux = x - size / 2,
                y_aux = y - size / 2,
                divisor = 0;


            var mat = img.Matrix;
            for (int i = x_aux; i < x_aux + size; i++)
                for (int j = y_aux; j < y_aux + size; j++)
                    if (j < img.Height && j >= 0 && i >= 0 && i < img.Width)
                    {
                        media += mat[i, j];
                        divisor++;
                    }
            
            return (byte)Math.Round(media / divisor); //Math.Pow(img.ReduceTo, 2));
        }



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

 

        public  PgmImg ReduceColors(PgmImg pgm)
        {
            var temp = pgm.Clone();
            

            for (int i = 0; i < pgm.Width; i++)
                for (int j = 0; j < pgm.Height; j++)
                    temp[i, j] = Reduce(pgm[i,j], pgm.ReduceTo);


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


        private  byte Reduce(byte value, int colors)
        {
            byte ret;
            ret = (byte)Math.Round((colors - 1) * (double)value / 255);
            ret = (byte)Math.Round(255 * (double)ret / (colors - 1));

            return ret;
        }

        private  byte Normalize(double color)
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

    }
}
