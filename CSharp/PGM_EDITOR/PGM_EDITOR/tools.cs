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
        public static Color[,] Bitmap2ColorMatrix(Bitmap bitmapFile)
        {

            int hight = bitmapFile.Height;
            int width = bitmapFile.Width;

            Color[,] colorMatrix = new Color[width,hight];
            for (int i = 0; i < width; i++)
            {
                for (int j = 0; j < hight; j++)
                {
                    colorMatrix[i, j] = bitmapFile.GetPixel(i, j);
                }
            }
            return colorMatrix;
        }

        public static Bitmap ColorMatrix2Bitmap(Color[,] matriz)
        {
            int width = matriz.GetLength(0);
            int height = matriz.GetLength(1);
            
            var b1 = new Bitmap(width, height);

           
            for (int i = 0; i < width; i++)
            {
                for (int j = 0; j < height; j++)
                {
                    b1.SetPixel(i, j, matriz[i, j]);
                }

            }
                      

            return b1;
        }
        
        public static Bitmap RotateR(Bitmap bitmap)
        {
            var ret = new Bitmap(bitmap.Width, bitmap.Height);

            var matriz = Bitmap2ColorMatrix(bitmap);


            matriz = MirrorX(Transpose(matriz));

            
            ret = ColorMatrix2Bitmap(matriz);

            return ret;
        }

        public static Bitmap RotateL(Bitmap bitmap)
        {
            var ret = new Bitmap(bitmap.Width, bitmap.Height);

            var matriz = Bitmap2ColorMatrix(bitmap);


            matriz = MirrorY(Transpose(matriz));


            ret = ColorMatrix2Bitmap(matriz);

            return ret;
        }

        public static Color[,] Transpose(Color[,] matrix)
        {
            Color[,] temp =new Color[matrix.GetLength(1),matrix.GetLength(0) ];

            for (int i = 0; i < matrix.GetLength(0); i++)
            {
                for (int j = 0; j < matrix.GetLength(1); j++)
                {
                    temp[j, i] = matrix[i, j];
                }
            }

            return temp;
        }  

        public static  Color[,] MirrorX(Color[,] matrix)
        {
            Color[,] temp = new Color[matrix.GetLength(0), matrix.GetLength(1)];

            for (int i = 0; i < matrix.GetLength(0); i++)
            {
                for (int j = 0; j < matrix.GetLength(1); j++)
                {
                    temp[i, j] = matrix[matrix.GetLength(0)-1-i, j];
                }
            }

            return temp;

        }

        public static Color[,] MirrorY(Color[,] matrix)
        {
            Color[,] temp = new Color[matrix.GetLength(0), matrix.GetLength(1)];

            for (int i = 0; i < matrix.GetLength(0); i++)
            {
                for (int j = 0; j < matrix.GetLength(1); j++)
                {
                    temp[i, j] = matrix[i, matrix.GetLength(1) - 1 - j];
                }
            }

            return temp;

        }

    }
}
