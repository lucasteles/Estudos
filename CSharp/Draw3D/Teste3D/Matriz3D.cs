
namespace Teste3D
{
    public class Matriz3D
    {
        Pixel3D[] ListPoints = null; //lista de pontos
        int nPointer = 0; // ponteiro da lista
        int nWidth, nHeight, nDepth;//tamanhos

        public Matriz3D(int tnWidth, int tnHeight,int tnDepth)
        {
            int nTam = (int)tnWidth * tnHeight;
            ListPoints  = new Pixel3D[nTam];
            nWidth      = tnWidth;
            nHeight     = tnHeight;
            nDepth      = tnDepth;
        }

        #region buscadores de valor
        public Pixel3D[] GetList()
        {
            return (this.ListPoints);
        }
        public int GetPointer()
        {
            return (nPointer);
        }
        #endregion

        #region Camera e tamanho
        public Matriz3D Resize(int nWidth, int Height, int tnDepth)
        {
            int nTam = (int)nWidth * Height;

            if (nTam > ListPoints.Length)
            {
                Pixel3D[] NewListPoints = ListPoints;
                ListPoints = new Pixel3D[nTam];

                for (int i = (nPointer/2); i < nPointer; i++)
                {
                    ListPoints[i] = NewListPoints[i];
                    ListPoints[nPointer - i] = NewListPoints[nPointer-i];
                }
            }
            return (this);
        }
        public Matriz3D AlterCam(int tnHorizontal, int tnVertical)
        {
            for (int i = (nPointer/2); i < nPointer; i++)
            {
                ListPoints[i].Cam(tnHorizontal, tnVertical);
                ListPoints[nPointer - i].Cam(tnHorizontal, tnVertical);
            }
            return (this);
        }
        #endregion

        #region Conversores
        public Pixel Pixel2Cart(Pixel oPoint)
        {
            oPoint.nX += -nWidth / 2;
            oPoint.nY += -nHeight / 2;
            oPoint.nY *= -1;

            return (oPoint);
        }
        public Pixel Cart2Pixel(Pixel oPoint)
        {
            oPoint.nX += nWidth / 2;
            oPoint.nY += -nHeight / 2;
            oPoint.nY *= -1;

            return(oPoint);
        }
        public Pixel3D Cart2Pixel(Pixel3D oPoint)
        {
            oPoint.nX += nWidth / 2;
            oPoint.nY += -nHeight / 2;
            oPoint.nZ += nDepth / 2;
            oPoint.nY *= -1;

            return (oPoint);
        }
        #endregion

        #region Formas
        public void Add(Pixel3D toPoint)
        {
            int nSeek = 0;
            for (int i = 0; i < nPointer; i++)
            {
                if (ListPoints[i] == toPoint)
                {
                    nSeek = i;
                    break;
                }
            }
            if (nSeek == 0)
            {
                nSeek = nPointer++;
            }
            ListPoints[nSeek] = toPoint;
        }
        public void AddLine(Pixel3D oXYZ1, Pixel3D oXYZ2)
        {

        }
        #endregion
    }
}
