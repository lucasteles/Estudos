using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TSAProblem.GeneticAlgorithm
{
    public class MapTSP
    {
        private int MapSize = 250;
        private List<Coordinate> lstCityCoordinates;
        public List<Coordinate> CityCoordinates
        {
            get { return lstCityCoordinates; }
        }
        private int numberOfCities;
        private double bestPossibleRoute;
        public double BestPossibleRoute
        {
            get { return bestPossibleRoute; }
        }
        private Bitmap bmpImage;
        public Bitmap MapImage
        {
            get { return bmpImage; }
        }

        public MapTSP(int numberOfCities)
        {
            this.numberOfCities = numberOfCities;
            this.lstCityCoordinates = new List<Coordinate>();

            CreateCitiesCirular(MapSize);
            CalculateBestPossibleRoute();
        }

        public Bitmap CreateBitMap()
        {
            Brush RedBrush = new SolidBrush(Color.Red);
            bmpImage = new Bitmap((int)(2 * 110), (int)(2 * 110));

            Graphics g = Graphics.FromImage(bmpImage);

            var Ran = new Random();

            foreach (var item in lstCityCoordinates)
            {
                g.FillEllipse(RedBrush, (float)item.X, (float)item.Y, 10, 10);
            }
            return bmpImage;
        }
        public void CreateCitiesCirular(double MapSize)
        {
            var Ran = new Random();

            for (int i = 0; i < numberOfCities; i++)
            {
                var x = Ran.Next(10,(int)MapSize-50);
                var y = Ran.Next(10, (int)MapSize-50);

                lstCityCoordinates.Add(new Coordinate() { X = x, Y = y });
            }
        }

        public Bitmap Draw(List<int> pointList)
        {
            Brush blackBrush = new SolidBrush(Color.Black);
            Bitmap myImage = CreateBitMap();
            using (Graphics g = Graphics.FromImage(myImage))
            {
                for (int i = 0; i < pointList.Count-1; i++)
                {
                    int x1 = (int)lstCityCoordinates[pointList[i]].X + 5;
                    int y1 = (int)lstCityCoordinates[pointList[i]].Y + 5;
                    int x2 = (int)lstCityCoordinates[pointList[i + 1]].X + 5;
                    int y2 = (int)lstCityCoordinates[pointList[i + 1]].Y + 5;
                    g.DrawLine(new Pen(blackBrush,2), new Point(x1, y1), new Point(x2, y2));
                }

            }
            return myImage;
        }

        private double CalculateA2B(Coordinate A, Coordinate B)
        {
            return Math.Sqrt(Math.Pow(A.X - B.X, 2) + Math.Pow(A.Y - B.Y, 2));
        }

        private void CalculateBestPossibleRoute()
        {
            bestPossibleRoute = 0;
            for (int i = 0; i < lstCityCoordinates.Count-1; i++)
            {
                bestPossibleRoute += CalculateA2B(lstCityCoordinates[i], lstCityCoordinates[i + 1]);
            }
            bestPossibleRoute += CalculateA2B(lstCityCoordinates[lstCityCoordinates.Count - 1],
                lstCityCoordinates[0]);
        }

        public double GetTourLength(List<int> listOfCities)
        {
            double tourLength = 0;
                for (int i = 0; i < listOfCities.Count - 1; i++)
                {
                    tourLength += CalculateA2B(lstCityCoordinates[listOfCities[i]],
                        lstCityCoordinates[listOfCities[i + 1]]);
                }
                tourLength += CalculateA2B(lstCityCoordinates[lstCityCoordinates.Count - 1],
                    lstCityCoordinates[0]);
            
            return tourLength;
        }
    }
}
