﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;

namespace PGM_EDITOR
{
    public class PgmImg
    {
        private Byte[,] _matrix = null;
        public Bitmap Bitmap;

        public int Width;
        public int Height;
        public bool[] Pallete;
        public int ReduceTo;
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
            return new PgmImg(Matrix) { Pallete = Pallete};
        }

        public PgmImg()
        {
            startPallete();
        }
        public PgmImg(byte[,] matrix)
        {
            this.Matrix = matrix;
            startPallete();
        }   

        private void startPallete()
        {
            Pallete = Enumerable.Repeat(false, 256).ToArray();
        }

        public bool IsEmpty()
        {
            return Matrix == null;
        }
    }
}
