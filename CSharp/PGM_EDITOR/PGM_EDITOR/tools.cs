using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using draw = System.Drawing;


namespace PGM_EDITOR
{
    public static class tools
    {

        public static PgmImg ReduceColors(PgmImg pgm)
        {
            var matrix = pgm.Matrix;
            var temp = new Byte[matrix.GetLength(0), matrix.GetLength(1)];
            var ret = new PgmImg();
            
            var ColorArray = pgm.Pallete
                                .Select((v, i) => new { v, i })
                                .Where(e => e.v)
                                .Select(e => e.i)
                                .ToArray();

            var newColorArray = new int[pgm.ReduceTo];
            for (int i = 0; i < pgm.ReduceTo ; i++)
                newColorArray[i] = i * (255 / (pgm.ReduceTo-1));

            newColorArray.OrderBy(e => e);

            for (int i = 0; i < matrix.GetLength(0); i++)
            {
                for (int j = 0; j < matrix.GetLength(1); j++)
                {
                    temp[i, j] = (byte)Closest((int)matrix[i, j], newColorArray);
                    
                    ret.Pallete[temp[i, j]] = true;
                }

            }


            /*
            var maxColor = (int)ColorArray.Max();
            
            for (int i = 0; i < matrix.GetLength(0); i++)
            {
                for (int j = 0; j < matrix.GetLength(1); j++)
                {
                    temp[i, j] = (byte)Math.Round((double)(pgm.ReduceTo * matrix[i, j] / 255));
                    temp[i, j] = (byte)Math.Round((double)(temp[i, j] * 255 / pgm.ReduceTo));
                    
                    ret.Pallete[temp[i, j]] = true;
                }

            }
            */
            ret.Matrix = temp;

            
            return ret;
        }

        private static int Closest(int closest, int[] values)
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

        public static PgmImg Transpose(PgmImg pgm)
        {
            var matrix = pgm.Matrix;
            var temp =new Byte[matrix.GetLength(1),matrix.GetLength(0) ];

            for (int i = 0; i < matrix.GetLength(0); i++)
            {
                for (int j = 0; j < matrix.GetLength(1); j++)
                {
                    temp[j, i] = matrix[i, j];
                }
            }

            return new PgmImg(temp);
        }

        public static PgmImg MirrorX(PgmImg pgm)
        {
            var matrix = pgm.Matrix;

            var temp = new Byte[matrix.GetLength(0), matrix.GetLength(1)];

            for (int i = 0; i < matrix.GetLength(0); i++)
            {
                for (int j = 0; j < matrix.GetLength(1); j++)
                {
                    temp[i, j] = matrix[matrix.GetLength(0)-1-i, j];
                }
            }

            return new PgmImg(temp);

        }

        public static PgmImg MirrorY(PgmImg pgm)
        {
            var matrix = pgm.Matrix;

            var temp = new Byte[matrix.GetLength(0), matrix.GetLength(1)];

            for (int i = 0; i < matrix.GetLength(0); i++)
            {
                for (int j = 0; j < matrix.GetLength(1); j++)
                {
                    temp[i, j] = matrix[i, matrix.GetLength(1) - 1 - j];
                }
            }

            return new PgmImg(temp);

        }


        public static PgmImg RotateR(PgmImg bitmap)
        {
            var ret = MirrorX(Transpose(bitmap));            
            return ret;
        }

        public static PgmImg RotateL(PgmImg bitmap)
        {
            var ret = MirrorY(Transpose(bitmap));
            return ret;
        }

    }
}
