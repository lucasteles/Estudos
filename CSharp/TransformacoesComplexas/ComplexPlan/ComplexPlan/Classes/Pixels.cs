using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using ComplexPlan.Classes;

namespace ComplexPlan.Classes
{
    class Pixels
     {
        private Bitmap ImagemCalc   = null;
        private SpecialPoint[] SPoint = new SpecialPoint[999999];
        private int nTPixels = 0;

        public Pixels(Bitmap tbiDesenhoCalc,SpecialPoint[] spSPoint,int nQT)
        {
            ImagemCalc  = tbiDesenhoCalc;
            SPoint      = spSPoint;
            nTPixels = nQT;
        }

        public Bitmap ModifyPixels()
        {
            for (int i = 0; i < nTPixels; i++)
            {
                if ((SPoint[i].nX >= 0) && (SPoint[i].nY >= 0))
                {
                    if ((SPoint[i].nX < ImagemCalc.Width) && (SPoint[i].nY < ImagemCalc.Height))
                    {
                        ImagemCalc.SetPixel(SPoint[i].nX, SPoint[i].nY, SPoint[i].Cor);
                    }
                }
            }

            return (ImagemCalc);
        }
    }
}
