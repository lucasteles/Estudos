namespace Teste3D
{
    public class Pixel
    {
        public float nX, nY = 0;
        public int nCor     = 0;

        public Pixel()
        {
        }

        public Pixel(int tnCor, int tnX,int tnY)
        {
            nCor = tnCor;
            nX  = tnX;
            nY  = tnY;
        }

        public Pixel(int tnCor, float tnX, float tnY)
        {
            nCor = tnCor;
            nX = tnX;
            nY = tnY;
        }
    }
}
