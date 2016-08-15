using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GASimulacija
{
    public class GameObject
    {
        private Vector2D[] vectorObjectVertexBuffer;
        public Vector2D[] VectorObjectVertexBuffer
        {
            get { return vectorObjectVertexBuffer; }
            set { vectorObjectVertexBuffer = value;
            vectorObjectVertexBufferTrans = new Vector2D[vectorObjectVertexBuffer.Length];
            }
        }
        private Vector2D[] vectorObjectVertexBufferTrans;
        //public Vector2D[] VectorObjectVertexBufferTrans
        //{
        //    get { return vectorObjectVertexBufferTrans; }
        //    set { vectorObjectVertexBufferTrans = value; }
        //}

        private Vector2D worldPosition = new Vector2D(0, 0);
        public Vector2D Position
        {
            get { return worldPosition; }
            set { worldPosition = value; }
        }
        private Vector2D velocity = new Vector2D(1, 1);
        public Vector2D Velocity
        {
            get { return velocity; }
            set { velocity = value; }
        }

        private double mass = 1;
        public double Mass
        {
            get { return mass; }
            set { mass = value; }
        }
        private double scale = 1;
        public double Scale
        {
            get { return scale; }
            set { scale = value; }
        }
        private double rotation = 0;
        public double Rotation
        {
            get { return rotation; }
            set { rotation = value; }
        }

        private Color objectColor = Color.Black;
        public Color ObjectColor
        {
            get { return objectColor; }
            set { objectColor = value;
            objectBrush = new SolidBrush(objectColor);
            }
        }
        private Brush objectBrush = new SolidBrush(Color.Black);

        private Vector2D[] DeepCopy(Vector2D[] source)
        {
            Vector2D[] newArray = new Vector2D[source.Length];

            for (int i = 0; i < source.Length; i++)
            {
                newArray[i] = new Vector2D(source[i].X, source[i].Y);
            }
            return newArray;
        }

        protected void WorldTransform()
        {
            vectorObjectVertexBufferTrans = DeepCopy(vectorObjectVertexBuffer);

            double radians = rotation * ((2 * Math.PI) / 360);
            
            for (int i = 0; i < vectorObjectVertexBuffer.Length; i++)
            {
                double tempX = vectorObjectVertexBuffer[i].X * Math.Cos(radians) - vectorObjectVertexBuffer[i].Y * Math.Sin(radians);
                double tempY = vectorObjectVertexBuffer[i].X * Math.Sin(radians) + vectorObjectVertexBuffer[i].Y * Math.Cos(radians);
                vectorObjectVertexBufferTrans[i].X = tempX;
                vectorObjectVertexBufferTrans[i].Y = tempY;
            }

            for (int i = 0; i < vectorObjectVertexBuffer.Length; i++)
            {
                double tempX = vectorObjectVertexBufferTrans[i].X * scale;
                double tempY = vectorObjectVertexBufferTrans[i].Y * scale;
                vectorObjectVertexBufferTrans[i].X = tempX;
                vectorObjectVertexBufferTrans[i].Y = tempY;
            }

            for (int i = 0; i < vectorObjectVertexBuffer.Length; i++)
            {
                vectorObjectVertexBufferTrans[i].X += worldPosition.X;
                vectorObjectVertexBufferTrans[i].Y += worldPosition.Y;
            }
        }
        public void Draw(Graphics g)
        {
            g.FillClosedCurve(objectBrush, Convert(vectorObjectVertexBufferTrans), System.Drawing.Drawing2D.FillMode.Winding, 0);
        }

        private static PointF[] Convert(Vector2D[] array)
        {
            PointF[] newArray = new PointF[array.Length];
            for (int i = 0; i < array.Length; i++)
            {
                newArray[i].X = (float)array[i].X;
                newArray[i].Y = (float)array[i].Y;
            }
            return newArray;
        }
    }
}
