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
