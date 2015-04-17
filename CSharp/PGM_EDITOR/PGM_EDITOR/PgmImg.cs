using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;

namespace PGM_EDITOR
{
    public class PgmImg
    {
        private Byte[,] _matrix = null;
        public Bitmap Bitmap
        {
            get { return PGMUtil.ToBitmap(this); }
        }

        public int Width;
        public int Height;
        public int[] Pallete;
        public int ReduceTo;
        public double Sigma;
        
        
        public byte this[int x, int y]
        {
            get {
                return Matrix[x,y]; 
            }
            set {

                if (Pallete == null) { 
                    Pallete = new int[256];
                    Pallete[0] = Width * Height;
                }

                var current = (int)Matrix[x, y];

                
                if (Pallete[current] > 0)
                    Pallete[current]--;

                Pallete[value]++;
                Matrix[x, y] = value;
                
            }
        }
        

        public Byte[,] Matrix
        {
            get {
                return _matrix;
            }
            set{
                _matrix = value;
                Width = _matrix.GetLength(0);
                Height = _matrix.GetLength(1);
            }
        }

        public PgmImg Clone()
        {
            return new PgmImg((byte[,])Matrix.Clone())
                            { 
                                Pallete = (int[])this.Pallete.Clone(), 
                                Width = this.Width, 
                                Height = this.Height,
                                ReduceTo = this.ReduceTo,
                                Sigma = this.Sigma
                            };
        }

        public PgmImg(int width, int height)
        {
            this.Matrix = new byte[width, height];
        }
        public PgmImg(byte[,] matrix)
        {
            this.Matrix = matrix;
        }

        public int[] CumulativePallete()
        {
            var ret = Pallete.Clone() as int[];
                    
            for (int i = 1; i < ret.Length; i++)
                ret[i] += ret[i] + ret[i - 1];

            return ret;
        }

        public bool IsEmpty()
        {
            return Matrix == null;
        }
    }
}
