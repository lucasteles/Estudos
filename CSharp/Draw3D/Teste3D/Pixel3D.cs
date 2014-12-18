using System;
namespace Teste3D
{
    public class Pixel3D : Pixel
    {
        public float nZ  = 0;
        public int nPosHor = 0, nPosVer = 0;
        public int nDepth = 600;

        public Pixel3D()
        { 
        }
        public Pixel3D(int tnCor, float tnX, float tnY, float tnZ)
        {
            nCor = tnCor;
            nX   = tnX;
            nY   = tnY;
            nZ   = tnZ;
        }
        public Pixel3D Rotate(int tnHorizontal, int tnVertical)
        {
            nPosHor = tnHorizontal;
            nPosVer = tnVertical;
            return (To3D());
        }
        public Pixel3D Cam(int tnHorizontal, int tnVertical)
        {
            nPosHor = tnHorizontal;
            nPosVer = tnVertical;
            return (this);
        }
        public Pixel To2D()
        {
            Pixel3D oRetorno = CalcCoordenadas();
            return (new Pixel(nCor, oRetorno.nX , oRetorno.nY));
        }
        public Pixel3D To3D()
        {
            return (CalcCoordenadas());
        }
        public Pixel3D CalcCoordenadas()
        {
            double nTheta = Math.PI * nPosHor / 180.0;
            double nPhi = Math.PI * nPosVer / 180.0;

            float nCosT = (float)Math.Cos(nTheta)
                , nSinT = (float)Math.Sin(nTheta);

            float nCosP = (float)Math.Cos(nPhi)
                , nSinP = (float)Math.Sin(nPhi);

            float nCosTxCosP  = nCosT * nCosP, nCosTxSinP = nCosT * nSinP,
                   nSinTxCosP = nSinT * nCosP, nSinTxSinP = nSinT * nSinP;

            float nX0 = this.nX;
            float nY0 = this.nY;
            float nZ0 = this.nZ;

            float nX1 = nCosT * nX0 + nSinT * nZ0;
            float nY1 = -nSinTxSinP * nX0 + nCosP * nY0 + nCosTxSinP * nZ0;
            float nZ1 = (nCosTxCosP * nZ0) - (nSinTxCosP * nX0) - (nSinP * nY0);

            int nXR = Convert.ToInt32((nX1 * nDepth) / (nZ1+nDepth));
            int nYR = Convert.ToInt32((nY1 * nDepth) / (nZ1+nDepth));
            int nZR = Convert.ToInt32(nZ1);

            return (new Pixel3D(nCor,nXR, nYR, nZR));
        }
    }
}