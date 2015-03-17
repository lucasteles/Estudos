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

       

            for (int i = 0; i < matrix.GetLength(0); i++)
                for (int j = 0; j < matrix.GetLength(1); j++){
                    temp[i, j] = (byte)Math.Round(((pgm.ReduceTo - 1) * (double)matrix[i, j] / 255));
                    temp[i, j] = (byte)Math.Round(255 * (double)temp[i, j] / (pgm.ReduceTo - 1));                   
                }


            /*
            // outra forma - mais lenta
           var newColorArray = new int[pgm.ReduceTo];
           for (int i = 0; i < pgm.ReduceTo ; i++)
               newColorArray[i] = i * (255 / (pgm.ReduceTo-1));
            
           for (int i = 0; i < matrix.GetLength(0); i++)
               for (int j = 0; j < matrix.GetLength(1); j++)
                   temp[i, j] = (byte)Closest((int)matrix[i, j], newColorArray);  
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
