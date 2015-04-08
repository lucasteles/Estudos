using System;
using System.Text;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

namespace PGM_EDITOR
{
    public static class PGMUtil
    {
        
        public static PgmImg ReadPgmImg(string filePath)
        {


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

                        var mat = new PgmImg(width, height);
                        
                                                
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
                        
                        return mat;                            
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

                var width = pgmImage.Width;
                var height = pgmImage.Height;
                ColorPalette grayScale;

                Bitmap bmp = new Bitmap(width, height, PixelFormat.Format8bppIndexed);
                
               grayScale = bmp.Palette;
               for (int i = 0; i < 256; i++)     
                   grayScale.Entries[i] = Color.FromArgb(i, i, i);
                    
                
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
                            *ptr = pgmImage[j, i];
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
            sb.Length = 0;

            char c = reader.ReadChar();

            if (c == '#')
                while(c != '\n')
                    c = reader.ReadChar();

            while (c == '\n')
                c = reader.ReadChar();


            while (Char.IsDigit(c))
            {
                sb.Append(c);
                c = reader.ReadChar();
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
