using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;

namespace ComplexPlan
{
    class SpecialPoint
    {
        public int nX = 0;
        public int nY = 0;
        public Color Cor = new Color();

        public SpecialPoint(int X, int Y,Color tCor)
        {
            nX = X;
            nY = Y;
            Cor = tCor;
        }

    }
}
