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
        private PgmImg bitmap;
        private Stack<PgmImg> Undo = new Stack<PgmImg>();
        private Stack<PgmImg> Redo = new Stack<PgmImg>();
        private Tools tools = new Tools();
        private Options? lastEffect = null;

        public main()
        {
            InitializeComponent();
            CheckUI();
        }
           
        
        private void addHistory()
        {
            Redo = new Stack<PgmImg>();
            Undo.Push(bitmap.Clone());
        }

        private void btnLoad_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog op = new OpenFileDialog();
            op.Title = "Selecione uma foto";
            op.Filter = "All supported graphics|*.pgm";

            Redo = new Stack<PgmImg>();
            Undo = new Stack<PgmImg>();
            lastEffect = null;

            if (op.ShowDialog() == true)
            {
 
                bitmap = PGMUtil.ReadPgmImg(op.FileName);
                show();

                this.Title = "PGM Editor - " + op.FileName.Split('\\').Last() + " (" + bitmap.Width+"x"+bitmap.Height+")";

            }
        }


        private void show()
        {
            var trueBitmap = bitmap.Bitmap;

            BitmapImage bitmapImage = new BitmapImage();
             using (MemoryStream memory = new MemoryStream())
                {
                    trueBitmap.Save(memory, ImageFormat.Png);
                    memory.Position = 0;
                    bitmapImage.BeginInit();
                    bitmapImage.StreamSource = memory;
                    bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                    bitmapImage.EndInit();
                }
                
                imgPhoto.Source = bitmapImage;
                CheckUI();
        }

        private void btnRotateR_Click(object sender, RoutedEventArgs e)
        {
            apply(tools.RotateR);
        }
        private void btnRotateL_Click(object sender, RoutedEventArgs e)
        {
            apply(tools.RotateL);
        }

        private void apply(Func<PgmImg, PgmImg> transform)
        {
            addHistory();
            bitmap = transform(bitmap);
            show();
        }

        private void btnUndo_Click(object sender, RoutedEventArgs e)
        {
            if (Undo.Count == 0)
                return;

            Redo.Push(bitmap.Clone());
            bitmap = Undo.Pop();
            show();
        }

        private void btnRedo_Click(object sender, RoutedEventArgs e)
        {
            if (Redo.Count == 0)
                return;

            Undo.Push(bitmap.Clone());
            bitmap = Redo.Pop();
            show();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            SaveFileDialog op = new SaveFileDialog();
            op.Title = "Salvar";
            op.Filter = "All supported graphics|*.pgm";
            
            if (op.ShowDialog() == true)
            {
                PGMUtil.Save(bitmap, op.FileName);
            }
        }

       
        private void CheckUI()
        {
            this.btnRedo.IsEnabled = Redo.Count > 0;
            this.btnUndo.IsEnabled = Undo.Count > 0;
            this.btnAgain.IsEnabled = lastEffect.HasValue;

            this.btnSave.IsEnabled =
                this.btnRotateL.IsEnabled =
                    this.btnRotateR.IsEnabled =
                        this.btnReduzir.IsEnabled =
                            this.btnHisto.IsEnabled = 
                                bitmap==null ? false :!bitmap.IsEmpty();
             
        }

        private void btnReduzir_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new InputDialog();

            if ((bool)dialog.ShowDialog())
            {
                int outV;
                if ((Int32.TryParse(dialog.Answer, out outV) && outV > 1 && outV < 256) || !dialog.txtAnswer.IsEnabled)
                {
                    bitmap.ReduceTo = outV;


                    if ((dialog.Option == Options.AverageFilter || dialog.Option == Options.MedianFilter || dialog.Option == Options.Erosion)
                        && !(outV % 2 != 0 && outV >= 3))
                    {
                        MessageBox.Show("deve ser impar e maior/igual que tres!");
                        return;
                    }

                    double outD = 0;
                    double.TryParse(dialog.Extra, out outD);
                    bitmap.Sigma = outD;
                   

                     lastEffect = dialog.Option;
                     SelectFilter(dialog.Option);
                     
                    
                }
                else
                    MessageBox.Show("valor invalido!");
            }

        }

        private void SelectFilter(Options opt)
        {
            
            switch (opt)
            {
                case Options.ReduceColors:
                    apply(tools.ReduceColors);
                    break;
                case Options.FloydSteinberg:
                    apply(tools.FloydSteinberg);
                    break;
                case Options.HistogramEqualization:
                    apply(tools.Equalize);
                    break;
                case Options.AverageFilter:
                    apply(tools.Average);   
                    break;
                case Options.MedianFilter:
                    apply(tools.Median);
                    break;
                case Options.Gaussian:
                    apply(tools.Gaussian);
                    break;
                case Options.Laplace:
                    apply(tools.Laplaciana);
                    break;
                case Options.Highlight:
                    apply(tools.Highlight);
                    break;
                case  Options.Erosion:
                    apply(tools.Erosion);
                    break;
                case Options.Expansion:
                    apply(tools.Expansion);
                    break;
                default:
                    break;
            }
        }

        private void Window_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            imgPhoto.Width = e.NewSize.Width - 50;
            imgPhoto.Height = e.NewSize.Height - 90;

            rectangle1.Width = imgPhoto.Width;
            rectangle1.Height = imgPhoto.Height-35;

            

        }


        private void btnHisto_Click(object sender, RoutedEventArgs e)
        {
            var hist = new Histograma(bitmap);

            hist.ShowDialog();
        }

        private void btnAgain_Click(object sender, RoutedEventArgs e)
        {
            if (lastEffect.HasValue)
                SelectFilter((Options)lastEffect);
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

        }

               

    }
}
