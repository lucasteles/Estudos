using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GASimulacija.Ship
{
    public partial class Ship
    {
        private void Thrust(TimeSpan ts)
        {
            double shipAcceleration = (THRUST_PER_SECOND * ts.TotalSeconds) / Mass;
            Velocity.X -= shipAcceleration * Math.Cos(Rotation);
            Velocity.Y -= shipAcceleration * Math.Sin(Rotation);
        }

        private void RotateLeft(TimeSpan ts)
        {
            Rotation -= ROTATION_PER_SECOND * ts.TotalSeconds;

            if (Rotation < -Math.PI)
            {
                Rotation += TWO_PI;
            }
        }

        private void RotateRight(TimeSpan ts)
        {
            Rotation += ROTATION_PER_SECOND * ts.TotalSeconds;

            if (Rotation > TWO_PI)
            {
                Rotation -= TWO_PI;
            }
        }
    }
}
