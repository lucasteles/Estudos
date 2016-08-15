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

            Bitmap cities = CreateCitiesCirular(100);
            CalculateBestPossibleRoute();
        }

        public Bitmap CreateCitiesCirular(double radius)
        {
            Brush blackBrush = new SolidBrush(Color.Red);
            bmpImage = new Bitmap((int)(2 * radius+10),(int)( 2 * radius+10));
            Graphics g = Graphics.FromImage(bmpImage);
            for (double i = 0.0; i < 360.0; i += 18)
            {
                double angle = i * System.Math.PI / 180;

                int x = (int)(radius + radius * System.Math.Cos(angle));
                int y = (int)(radius + radius * System.Math.Sin(angle));

                lstCityCoordinates.Add(new Coordinate() { X = x, Y = y });

                g.FillEllipse(blackBrush, x, y, 10, 10);
            }
            return bmpImage;
        }

        public Bitmap Draw(List<int> pointList)
        {
            Brush blackBrush = new SolidBrush(Color.Black);
            Bitmap myImage = CreateCitiesCirular(100);
            using (Graphics g = Graphics.FromImage(myImage))
            {
                for (int i = 0; i < pointList.Count-1; i++)
                {
                    int x1 = (int)lstCityCoordinates[pointList[i]].X;
                    int y1 = (int)lstCityCoordinates[pointList[i]].Y;
                    int x2 = (int)lstCityCoordinates[pointList[i + 1]].X;
                    int y2 = (int)lstCityCoordinates[pointList[i + 1]].Y;
                    g.DrawLine(new Pen(blackBrush,2), new Point(x1, y1), new Point(x2, y2));
                }
                int x11 = (int)lstCityCoordinates[lstCityCoordinates.Count - 1].X;
                int y11 = (int)lstCityCoordinates[lstCityCoordinates.Count - 1].Y;
                int x21 = (int)lstCityCoordinates[0].X;
                int y21 = (int)lstCityCoordinates[0].Y;
                g.DrawLine(new Pen(blackBrush, 2), new Point(x11, y11), new Point(x21, y21));
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
