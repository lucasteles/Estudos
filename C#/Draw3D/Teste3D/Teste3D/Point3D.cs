using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;

namespace Teste3D
{
    public class Point3D
    {
        private float nX, nY, nZ  = 0;
        public int nHorizontal  = 0,nVertical    = 0;

        public Point3D()
        { 
        }

        public Point3D(float tnX, float tnY, float tnZ)
        {
            nX = tnX;
            nY = tnY;
            nZ = tnZ;
        }
        public Point3D Refresh(int tnHorizontal, int tnVertical)
        {
            nHorizontal = tnHorizontal;
            nVertical = tnVertical;
            return (this);
        }

        public Point To2D()
        {
            double nTheta = Math.PI * nHorizontal / 180.0;
            double nPhi = Math.PI * nVertical / 180.0;

            float nCosT = (float)Math.Cos(nTheta)
                , nSinT = (float)Math.Sin(nTheta);

            float nCosP = (float)Math.Cos(nPhi)
                , nSinP = (float)Math.Sin(nPhi);

            float nCosTxCosP = nCosT * nCosP, cosTsinP = nCosT * nSinP,
                   nSinTxCosP = nSinT * nCosP, sinTsinP = nSinT * nSinP;

            float nX0 = this.nX;
            float nY0 = this.nY;
            float nZ0 = this.nZ;

            // compute an orthographic projection
            float nX1 = nCosT * nX0 + nSinT * nZ0;
            float nY1 = -sinTsinP * nX0 + nCosP * nY0 + cosTsinP * nZ0;

            // now adjust things to get a perspective projection
            //float nZ1 = (nCosTxCosP * nZ0) - (nSinTxCosP * nX0) - (nSinP * nY0);

            int nX = (int)nX1;
            int nY = (int)nY1;

            return (new Point(nX, nY));
        }
    }
}
