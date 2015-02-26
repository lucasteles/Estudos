using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace UsandoCaptcha.Models
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
            //---- WITHOUT an image for the background ------

            // Create a new 32-bit bitmap image.
            Bitmap bitmap = new Bitmap(this.width, this.height, PixelFormat.Format32bppArgb);

            // Create a graphics object for drawing.
            Graphics g = Graphics.FromImage(bitmap);
            g.SmoothingMode = SmoothingMode.AntiAlias;
            Rectangle rect = new Rectangle(0, 0, this.width, this.height);

            // Fill in the background.
            //HatchBrush hatchBrush = new HatchBrush(HatchStyle.SmallConfetti, ColorTranslator.FromHtml("#607f20"), ColorTranslator.FromHtml("#ffea00"));
            //HatchBrush hatchBrush = new HatchBrush(HatchStyle.Trellis, ColorTranslator.FromHtml("#ffffff"), ColorTranslator.FromHtml("#607f20"));
            HatchBrush hatchBrush = new HatchBrush(HatchStyle.SmallConfetti, Color.FromArgb(114, 172, 236), Color.FromArgb(161, 214, 255));
            //Color.FromArgb(76,136,198)    medium
            //Color.FromArgb(0,79,136)      dark
            //Color.FromArgb(114,172,236)   medium-light
            //Color.FromArgb(135,188,254)   light
            //Color.FromArgb(161,214,255)   really light
            g.FillRectangle(hatchBrush, rect);

            //---- WITH a background image ----------
            //string bgpath = HttpContext.Current.Server.MapPath("CaptchaBG.bmp");
            //Bitmap bitmap = new Bitmap(bgpath);
            //Graphics g = Graphics.FromImage(bitmap);
            //g.SmoothingMode = SmoothingMode.AntiAlias;
            //HatchBrush hatchBrush = null;
            //Rectangle rect = new Rectangle(0, 0, this.width, this.height);

            //-----------------------------------------

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

            // Create a path using the text and warp it randomly.
            GraphicsPath path = new GraphicsPath();
            path.AddString(this.text, font.FontFamily, (int)font.Style, font.Size, rect, format);
            float v = 4F;
            PointF[] points =
                {
                    new PointF(random.Next(this.width) / v, random.Next(this.height) / v),
                    new PointF(this.width - random.Next(this.width) / v, random.Next(this.height) / v),
                    new PointF(random.Next(this.width) / v, this.height - random.Next(this.height) / v),
                    new PointF(this.width - random.Next(this.width) / v, this.height - random.Next(this.height) / v)
                };
            Matrix matrix = new Matrix();
            matrix.Translate(0F, 0F);
            path.Warp(points, rect, matrix, WarpMode.Perspective, 0F);

            // Draw the text.
            hatchBrush = new HatchBrush(HatchStyle.SmallConfetti, ColorTranslator.FromHtml("#000000"), ColorTranslator.FromHtml("#000000"));
            //  white numbers
            //  hatchBrush = new HatchBrush(HatchStyle.SmallConfetti, ColorTranslator.FromHtml("#ffffff"), ColorTranslator.FromHtml("#ffffff"));
            //  yellow numbers
            //hatchBrush = new HatchBrush(HatchStyle.SmallConfetti, ColorTranslator.FromHtml("#ffea00"), ColorTranslator.FromHtml("#ffea00"));
            g.FillPath(hatchBrush, path);

            //// Add some random noise.
            int m = Math.Max(this.width, this.height);
            for (int i = 0; i < (int)(this.width * this.height / 30F); i++)
            {
                int x = random.Next(this.width);
                int y = random.Next(this.height);
                int w = random.Next(m / 50);
                int h = random.Next(m / 50);
                g.FillEllipse(hatchBrush, x, y, w, h);
            }

            // Clean up.
            font.Dispose();
            hatchBrush.Dispose();
            g.Dispose();

            // Set the image.
            this.image = bitmap;
        }

        public static string GenerateRandomCode()
        {
            string s = "";
            for (int i = 0; i < 6; i++)
                s = String.Concat(s, random.Next(10).ToString());
            return s;
        }
    }
}