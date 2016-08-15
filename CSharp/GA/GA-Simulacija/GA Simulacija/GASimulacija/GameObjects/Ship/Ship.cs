using Genetic_Algorithm;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GASimulacija.Ship
{
    public partial class Ship : GameObject
    {
        #region Constants
        private const double THRUST_PER_SECOND = 20;
        private const double ROTATION_PER_SECOND = 2;
        private const double TWO_PI = Math.PI * 2;
        private const double GRAVITY = 1.7;
        private const double SCALING_FACTOR = 1;
        #endregion

        private Genome objGenome;
        public Genome Genome
        {
            get { return objGenome; }
            set { objGenome = value; }
        }

        public Ship()
        {

        }

        public void Update(TimeSpan ts)
        {
            WorldTransform();
        }
    }
}
