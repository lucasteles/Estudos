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

        public int Width { get { return Matrix.GetLength(0); } }
        public int Height { get { return Matrix.GetLength(1); } }
        public int[] Pallete;
        public int ReduceTo;
        
        
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
                
            }
        }

        public PgmImg Clone()
        {
            return new PgmImg((byte[,])Matrix.Clone()) { Pallete = (int[])this.Pallete.Clone()};
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
            var ret = new int[Pallete.Length];

            
            for (int i = 0; i < ret.Length; i++)
                for (int j = 0; j < i; j++)
                    ret[i] += Pallete[j]; ;

            return ret;
        }

        public bool IsEmpty()
        {
            return Matrix == null;
        }
    }
}
