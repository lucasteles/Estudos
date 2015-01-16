using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using EntityTeste.Models;
using System.Collections;

namespace EntityTeste
{
    public partial class teste : Form
    {
        public teste()
        {
            InitializeComponent();
        }
        
        private void teste_Load(object sender, EventArgs e)
        {
            IList ee;

            using(var context = new Repository<Cliente>())
            {
                ee = context.dbQuery.AsParallel().ToList();
            
            }
            dataGridView1.DataSource = ee;

            foreach (var item in dataGridView1.Columns)
            {
                
                var col = (item as DataGridViewColumn);

                var attributes = typeof(Cliente)
                            .GetProperty(col.Name)
                            .GetCustomAttributes(typeof(HeaderAttribute), false);

                if (attributes.Count() > 0)
                    col.HeaderText  = (attributes.First() as HeaderAttribute).desc ;

            }


        }
    }
}
