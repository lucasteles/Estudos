using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace BradescoCadastro
{
    public class Captcha
    {
        private string text;
        private int width;
        private int height;
        private string familyName;
        private Bitmap image;
        private static Random random = new Random();

        public string FamilyName
        {
            get { return familyName; }
            set { familyName = value; }
        }
        public string Text
        {
            get { return this.text; }
            set { text = value; }
        }
        public Bitmap Image
        {
            get
            {
                if (!string.IsNullOrEmpty(text) && height > 0 && width > 0)
                    GenerateImage();
                return this.image;
            }
        }
        public int Width
        {
            get { return this.width; }
            set { width = value; }
        }
        public int Height
        {
            get { return this.height; }
            set { height = value; }
        }

        public Captcha()
        {

        }

        ~Captcha()
        {
            Dispose(false);
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
            this.Dispose(true);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
                // Dispose of the bitmap.
                this.image.Dispose();
        }

        private void SetDimensions(int width, int height)
        {
            // Check the width and height.
            if (width <= 0)
                throw new ArgumentOutOfRangeException("width", width, "Argument out of range, must be greater than zero.");
            if (height <= 0)
                throw new ArgumentOutOfRangeException("height", height, "Argument out of range, must be greater than zero.");
            this.width = width;
            this.height = height;
        }

        private void SetFamilyName(string familyName)
        {
            try
            {
                Font font = new Font(this.familyName, 16F);
                this.familyName = familyName;
                font.Dispose();
            }
            catch
            {
                this.familyName = System.Drawing.FontFamily.GenericSerif.Name;
            }
        }

        public void GenerateImage()
        {
            

            // Create a new 32-bit bitmap image.
            Bitmap bitmap = new Bitmap(this.width, this.height, PixelFormat.Format32bppArgb);

            // Create a graphics object for drawing.
            Graphics g = Graphics.FromImage(bitmap);
            g.SmoothingMode = SmoothingMode.AntiAlias;
            Rectangle rect = new Rectangle(0, 0, this.width+20, this.height);


            HatchBrush hatchBrush = new HatchBrush(HatchStyle.Percent05, Color.FromArgb(230, 230, 230), Color.FromArgb(255, 255, 255));
           
            g.FillRectangle(hatchBrush, rect);


            // Set up the text font.
            SizeF size;
            float fontSize = this.height + 4;
            Font font;
            // Adjust the font size until the text fits within the image.
            do
            {
                fontSize--;
                font = new Font(this.familyName, fontSize, FontStyle.Bold);
                size = g.MeasureString(this.text, font);
            } while (size.Width > this.width);

        


            // Set up the text format.
            StringFormat format = new StringFormat();
            format.Alignment = StringAlignment.Center;
            format.LineAlignment = StringAlignment.Center;
            format.Trimming = StringTrimming.EllipsisPath;

            // Create a path using the text and warp it randomly.
            GraphicsPath path = new GraphicsPath();
            path.AddString(this.text, font.FontFamily, (int)font.Style, font.Size+10, rect, format);
            float v = 4F;
            PointF[] points =
                {
                    new PointF(random.Next(this.width) / v, random.Next(this.height) / v),
                    new PointF(this.width - random.Next(this.width) / v, random.Next(this.height) / v),
                    new PointF(random.Next(this.width) / v, this.height - random.Next(this.height) / v),
                    new PointF(this.width - random.Next(this.width) / v, this.height - random.Next(this.height) / v)
                };
            Matrix matrix = new Matrix();
            matrix.Translate(-5F, 0F);
            path.Warp(points, rect, matrix, WarpMode.Perspective, 0F);

            // Draw the text.
            hatchBrush = new HatchBrush(HatchStyle.SmallConfetti, Color.Black, Color.Black);
            g.FillPath(hatchBrush, path);

            //// Add some random noise.
            int m = Math.Max(this.width, this.height);
            for (int i = 0; i < (int)(this.width * this.height)/100; i++)
            {
                int x = random.Next(this.width);
                int y = random.Next(this.height);
                int w = random.Next(m / 25);
                int h = random.Next(m / 25);
                g.FillEllipse(hatchBrush, x, y, w, h);
            }

            // add line
            Pen pen = new Pen(Color.Black, 1);
            int qtPointLine = 7;


            PointF[] line = new PointF[qtPointLine];


            for (int i = 0; i < qtPointLine; i++)
            {
                line[i].X = random.Next(this.width);
                line[i].Y =  random.Next(this.height);
                
            }
            g.DrawBezier(pen, line[0], line[1], line[2], line[3]);
            g.DrawBezier(pen, line[3], line[4], line[5], line[6]);

            // Clean up.
            font.Dispose();
            hatchBrush.Dispose();
            g.Dispose();

            // Set the image.
            this.image = bitmap;
        }

        public static string GenerateRandomCode(int seed = 0)
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            Random random = seed==0 ?  new Random() : new Random(seed);
            var result = new string(
                Enumerable.Repeat(chars,4)
                          .Select(s => s[random.Next(s.Length)] )
                          .ToArray());

            return result;
        }
    }
}