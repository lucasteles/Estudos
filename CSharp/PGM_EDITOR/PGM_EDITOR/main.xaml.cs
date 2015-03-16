﻿using Microsoft.Win32;
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

            if (op.ShowDialog() == true)
            {
 
                bitmap = PGMUtil.ReadPgmImg(op.FileName);
                show();
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


            this.btnSave.IsEnabled =
                this.btnRotateL.IsEnabled =
                    this.btnRotateR.IsEnabled =
                        this.btnReduzir.IsEnabled =
                            bitmap==null ? false :!bitmap.IsEmpty();
             
        }

        private void btnReduzir_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new InputDialog();

            if ((bool)dialog.ShowDialog())
            {
                int outV;
                if (Int32.TryParse(dialog.Answer, out outV) && outV > 1 && outV < 256)
                {
                    bitmap.ReduceTo = outV;
                    apply(tools.ReduceColors);
                }
                else
                    MessageBox.Show("valor invalido!");
            }

        }

        private void Window_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            imgPhoto.Width = e.NewSize.Width - 50;
            imgPhoto.Height = e.NewSize.Height - 100;

            rectangle1.Width = imgPhoto.Width;
            rectangle1.Height = imgPhoto.Height;
        }
       

    }
}
