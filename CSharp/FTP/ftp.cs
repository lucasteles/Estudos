using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Web;
using System.Net;

namespace TesteFTP
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            OpenFileDialog d = new OpenFileDialog();
            


            if (d.ShowDialog() != DialogResult.OK)
                return;




          MemoryStream reqFile = new MemoryStream();   
          BinaryWriter writer = new BinaryWriter(reqFile);
          StreamReader sourceStream = new StreamReader(d.FileName, Encoding.GetEncoding(1252));
          writer.Write(Encoding.GetEncoding(1252).GetBytes(sourceStream.ReadToEnd()));
         


            String IpAddress = "localhost";

            FtpWebRequest request = (FtpWebRequest)WebRequest.Create(new Uri("ftp://" +
            IpAddress + "/" + d.SafeFileName));
            request.UseBinary = true;
            request.Method = WebRequestMethods.Ftp.UploadFile;
            request.Credentials = new NetworkCredential("user", "123");

            int amountRead = 0;
            long toRead = Int32.MaxValue;

            reqFile.Position = 0;

            using (Stream str = request.GetRequestStream())
            {

                for (int i = 0; i <= Math.Ceiling((decimal)(reqFile.Length / Int32.MaxValue)); i++)
                {

                    if (toRead + amountRead > reqFile.Length)
                    {
                        toRead = reqFile.Length - amountRead;
                    }

                    byte[] arrFile = new byte[toRead];

                    amountRead = reqFile.Read(arrFile, 0, (int)toRead);

                    str.Write(arrFile, 0, (int)toRead);
                    str.Flush();
                }

                str.Close();
            }

            FtpWebResponse response = (FtpWebResponse)request.GetResponse();

            MessageBox.Show(response.StatusDescription);
            

        }


    }
}
