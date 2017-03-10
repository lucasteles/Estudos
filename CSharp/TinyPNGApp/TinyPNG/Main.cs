using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TinifyAPI;

namespace TinyPNG
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
            Tinify.Key = "f8z7lB1UpypNQZQ_kXeuLtIzjX8zbMHH";
        }

        private void Main_Load(object sender, EventArgs e)
        {
         
        }

        private async void Main_Click(object sender, EventArgs e)
        {
            var dialog = new OpenFileDialog();
            dialog.Filter = dialog.Filter = "Image files (*.png) | *.png";
            dialog.Multiselect = true;

            if (dialog.ShowDialog() == DialogResult.OK)
            {
                var files = dialog.FileNames;
                await TinyPNG(files);
            }
        }




        async Task TinyPNG(params string[] files)
        {
            try
            {

                image.Visible = true;

                var folders = new List<string>();
                foreach (var item in files)
                {
                    var path = Path.Combine(Path.GetDirectoryName(item), "opt");
                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);

                    label.Text = Path.GetFileName(item);
                    var source = Tinify.FromFile(item);
                    await source.ToFile(Path.Combine(path, Path.GetFileName(item)));

                    if (!folders.Contains(path))
                        folders.Add(path);

                }

                foreach (var item in folders)
                {
                    Process.Start(item);
                }
                label.Text = string.Empty;
                image.Visible = false;


            }
            catch (System.Exception e)
            {
                var errors = new List<string>();
                var err = e;
                while (err != null)
                {
                    errors.Add(err.Message);
                    err = e.InnerException;
                }
                errors.Reverse();
                MessageBox.Show(string.Join("\n", errors));


            }
        }


        private async void Main_DragDrop(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop))
            {
                // Note that you can have more than one file.
                var files = (string[])e.Data.GetData(DataFormats.FileDrop);
                await TinyPNG(files);
            }

        }

        private void Main_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop)) e.Effect = DragDropEffects.Copy;
        }
    }

}





