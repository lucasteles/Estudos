using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GASimulacija.Game
{
    public class Game
    {
        private Ship.Ship objShip;
        private Bitmap bmpCanvas;

        public Game()
        {
            objShip = new Ship.Ship();
            #region Ship Init
            List<Vector2D> lstVector = new List<Vector2D>();
            lstVector.Add(new Vector2D(2, 1));
            lstVector.Add(new Vector2D(2, -1));
            lstVector.Add(new Vector2D(-2, -1));
            lstVector.Add(new Vector2D(-2, 1));
            lstVector.Add(new Vector2D(-1, 1));
            lstVector.Add(new Vector2D(-1, 2));
            lstVector.Add(new Vector2D(1, 2));
            lstVector.Add(new Vector2D(1, 1));
            objShip.VectorObjectVertexBuffer = lstVector.ToArray();
            objShip.Scale = 5;
            objShip.Position = new Vector2D(50, 50);
            objShip.Rotation = 90;
            objShip.ObjectColor = Color.Blue;
            #endregion
            bmpCanvas = new Bitmap(200, 200);
        }

        public void Update(TimeSpan ts)
        {
            objShip.Update(ts);
        }

        public Bitmap Draw()
        {
            using (Graphics g = Graphics.FromImage(bmpCanvas))
            {
                g.Clear(Color.White);
                objShip.Draw(g);
            }
            return bmpCanvas;
        }
    }
}
