using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using EntityTeste.Models;

namespace EntityTeste
{
    public partial class teste2 : teste<Cliente>
    {
        public teste2(IBaseDAO<Cliente> dao) : base(dao) 
        {
            InitializeComponent();
        }
    }

   
}
