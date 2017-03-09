
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;
using TinifyAPI;
using WpfAnimatedGif;

namespace TinyPNGApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Tinify.Key = "f8z7lB1UpypNQZQ_kXeuLtIzjX8zbMHH";

        }

        private async void Window_Drop(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop))
            {
                // Note that you can have more than one file.
                var  files = (string[])e.Data.GetData(DataFormats.FileDrop);
                await TinyPNG(files);
                
            }
        }

        async Task TinyPNG (params string[] files)
        {
            try
            {

           
            BringToFront(image1);
            
          
            var folders = new List<string>();
            foreach (var item in files)
            {
                var path = Path.Combine(Path.GetDirectoryName(item), "opt");
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                label.Content = Path.GetFileName(item);
                var source = Tinify.FromFile(item);
                await source.ToFile(Path.Combine(path, Path.GetFileName(item)));

                if (!folders.Contains(path))
                    folders.Add(path);

            }

            foreach (var item in folders)
            {
                Process.Start(item);   
            }
            label.Content = string.Empty;
            BringToFront(image);


            }
            catch (System.Exception e)
            {
                var errors = new List<string>();
                var err = e;
                while(err!=null)
                {
                    errors.Add(err.Message);
                    err = e.InnerException;
                }
                errors.Reverse();
                MessageBox.Show(string.Join("\n", errors));


            }

        }

        private async void image_MouseDown(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            var dialog = new OpenFileDialog();
            dialog.Filter = dialog.Filter = "Image files (*.png) | *.png"; 
            dialog.Multiselect = true;

            if (dialog.ShowDialog() ?? false)
            {
                var files = dialog.FileNames;
                await TinyPNG(files);
            }

            

        }
        public static void BringToFront(FrameworkElement element)
        {
            if (element == null) return;

            Panel parent = element.Parent as Panel;
            if (parent == null) return;

            var maxZ = parent.Children.OfType<UIElement>()
              .Where(x => x != element)
              .Select(x => Panel.GetZIndex(x))
              .Max();
            Panel.SetZIndex(element, maxZ + 1);
        }
    }
    
}
