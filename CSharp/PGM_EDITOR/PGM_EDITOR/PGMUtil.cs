using System;
using System.Text;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

namespace PGM_EDITOR
{
    public static class PGMUtil
    {
        private static ColorPalette grayScale;

        public static PgmImg ReadPgmImg(string filePath)
        {
            PgmImg ret = new PgmImg();

            using (FileStream fs = new FileStream(filePath, FileMode.Open))
            {
                using (BinaryReader reader = new BinaryReader(fs, Encoding.ASCII))
                {
                    if (reader.ReadChar() == 'P' && reader.ReadChar() == '5')
                    {
                        reader.ReadChar();
                        int width = 0;
                        int height = 0;
                        int level = 0;
                        bool two = false;
                        
                        
                        width = ReadNumber(reader);
                        height = ReadNumber(reader);
                        level = ReadNumber(reader);
                        two = (level > 255);

                        var mat = new Byte[width, height];

                        for (int i = 0; i < height; i++)
                        {
                            for (int j = 0; j < width; j++)
                            {
                                byte v;
                                if (two)
                                {
                                    v = (byte)(((double)((reader.ReadByte() << 8) + reader.ReadByte()) / level) * 255.0);
                                }
                                else
                                {
                                    v = reader.ReadByte();
                                }

                                mat[j, i] = v;

                            }
                        }
                        ret.Matrix = mat;
                        return ret;                            
                    }
                    else
                    {
                        throw new InvalidOperationException("Is not a PGM file");
                    }

                    
                    
                }
            }
        }


        public static Bitmap ToBitmap( PgmImg pgmImage)
        {

                var width = pgmImage.Matrix.GetLength(0);
                var height = pgmImage.Matrix.GetLength(1);


                Bitmap bmp = new Bitmap(width, height, PixelFormat.Format8bppIndexed);
                if (grayScale == null)
                {
                    grayScale = bmp.Palette;
                    for (int i = 0; i < 256; i++)
                    {
                        grayScale.Entries[i] = Color.FromArgb(i, i, i);
                    }
                }
                bmp.Palette = grayScale;
                BitmapData dt = bmp.LockBits(new Rectangle(0, 0, width, height), ImageLockMode.WriteOnly, PixelFormat.Format8bppIndexed);
                int offset = dt.Stride - dt.Width;

                unsafe
                {
                    byte* ptr = (byte*)dt.Scan0;

                    for (int i = 0; i < height; i++)
                    {
                        for (int j = 0; j < width; j++)
                        {
                            *ptr = pgmImage.Matrix[j, i];
                            ptr++;
                        }
                        ptr += offset;
                    }
                }

                bmp.UnlockBits(dt);
                return bmp;
           
        }

      
        private static int ReadNumber(BinaryReader reader)
        {
            StringBuilder sb = new StringBuilder();
            char c = '\0';
            sb.Length = 0;
            while (Char.IsDigit(c = reader.ReadChar()))
            {
                sb.Append(c);
            }
            return int.Parse(sb.ToString());
        }

        public static void Save(PgmImg imagem, string path)
        {
                       

            using (var fs = new FileStream(path, FileMode.Create))
            {
                using (var bw = new BinaryWriter(fs, Encoding.ASCII))
                {
                    // header
                    bw.Write( "P5\n".ToCharArray() );

                    // width height grayscale
                    bw.Write(String.Format("{0} {1}\n255\n", imagem.Width, imagem.Height).ToCharArray());

                    for (int i = 0; i < imagem.Height; i++)
                    {
                        for (int j = 0; j < imagem.Width; j++)
                        {
                             bw.Write( imagem.Matrix[j,i] );
                        }
                    }                   

                }
            }
            
        }

    }
}
