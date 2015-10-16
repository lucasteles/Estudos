using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace replica
{
    class Program
    {
        static void Main(string[] args)
        {
            string origem = "C:\\Users\\telesl\\Desktop\\revistas\\New\\1";
            string Base = "C:\\Users\\telesl\\Desktop\\revistas\\New\\";

            for (int i = 1; i < 68; i++)
            {
                string dest = Base + i.ToString();

                if (!Directory.Exists(dest))
                {
                    Directory.CreateDirectory(dest);
                    DirectoryCopy(origem, dest, true);
                }
            }


        }

        static void DirectoryCopy(string sourceDirName, string destDirName, bool copySubDirs)
        {
            try
            {
                var dir = new DirectoryInfo(sourceDirName);
                var dirs = dir.GetDirectories();

                if (!dir.Exists)
                {
                    throw new DirectoryNotFoundException(
                        "Diretório de origem não existe ou não pode ser encontrado: "
                        + sourceDirName);
                }

                if (!Directory.Exists(destDirName))
                    Directory.CreateDirectory(destDirName);

                var files = dir.GetFiles();
                foreach (FileInfo file in files)
                {
                    var temppath = Path.Combine(destDirName, file.Name);
                    file.CopyTo(temppath, true);
                }

                if (copySubDirs)
                {
                    foreach (DirectoryInfo subdir in dirs)
                    {
                        var temppath = Path.Combine(destDirName, subdir.Name);
                        DirectoryCopy(subdir.FullName, temppath, true);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }


    }
}
