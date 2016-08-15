using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GASimulacija
{
    public class Vector2D
    {
        private double x;
        private double y;
        public double X
        {
            get { return x; }
            set { x = value; }
        }
        public double Y
        {
            get { return y; }
            set { y = value; }
        }

        public Vector2D() { }
        public Vector2D(double X, double Y)
        {
            this.x = X;
            this.y = Y;
        }
    }
}
