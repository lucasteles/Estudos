using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace PGM_EDITOR
{
    /// <summary>
    /// Interaction logic for main.xaml
    /// </summary>
    public partial class main : Window
    {
        private Bitmap bitmap;
        private Stack<Bitmap> history = new Stack<Bitmap>();
        
        
        public main()
        {
            InitializeComponent();
        }

        private void btnLoad_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog op = new OpenFileDialog();
            op.Title = "Selecione uma foto";
            op.Filter = "All supported graphics|*.pgm";

            
            

            if (op.ShowDialog() == true)
            {
 
                bitmap = PGMUtil.ToBitmap(op.FileName);
                show();
            }
        }


        private void show()
        {
            BitmapImage bitmapImage = new BitmapImage();
             using (MemoryStream memory = new MemoryStream())
                {
                    bitmap.Save(memory, ImageFormat.Png);
                    memory.Position = 0;
                    bitmapImage.BeginInit();
                    bitmapImage.StreamSource = memory;
                    bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                    bitmapImage.EndInit();
                }
                
                imgPhoto.Source = bitmapImage;
        }

        private void btnRotateR_Click(object sender, RoutedEventArgs e)
        {
            history.Push(bitmap.Clone() as Bitmap);
            bitmap = tools.RotateR(bitmap);
            show();
        }
        private void btnRotateL_Click(object sender, RoutedEventArgs e)
        {
            history.Push(bitmap.Clone() as Bitmap);
            bitmap = tools.RotateL(bitmap);
            show();
        }

        private void btnUndo_Click(object sender, RoutedEventArgs e)
        {
            if (history.Count == 0)
                return;

            bitmap = history.Pop();
            show();
        }

    }
}
