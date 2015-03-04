using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;

namespace PGM_EDITOR
{
    public class PgmImg
    {
        private Byte[,] _matrix;
        public Bitmap Bitmap;

        public int Width;
        public int Height;

        public Byte[,] Matrix
        {
            get {
                return _matrix;
            }
            set{
                _matrix = value;
                Bitmap = PGMUtil.ToBitmap(this);

                Width = Bitmap.Width;
                Height = Bitmap.Height;
            }
        }

        public PgmImg Clone()
        {
            return new PgmImg(Matrix);
        }

        public PgmImg()
        {
        }
        public PgmImg(byte[,] matrix)
        {
            this.Matrix = matrix;
        }   
    }
}
