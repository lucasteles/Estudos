using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using SharpBook.Classes;

namespace SharpBook
{
    static class Program
    {
        public static Principal oPrincipal = new Principal();
        /// <summary>
        /// The main entry point for the application.
        /// </summary>

        [STAThread]
        static void Main()
        {
            Dados.PreCadastrados();
            //Application.SetCompatibleTextRenderingDefault(false);
            Application.EnableVisualStyles();
            Application.Run(oPrincipal);
            // carrega usuarios pre cadastrados
            
        }
    }
}
