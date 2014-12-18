using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SharpBook.Classes;

namespace SharpBook.Telas
{
    public partial class BuscarFilme : Form
    {
        private List<Filme> AllFilms = new List<Filme>();
        private DataTable tmpGRADE;
        public Filme Selecionado = null;

        public BuscarFilme()
        {
            InitializeComponent();
        }

        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {

            DataView dv = tmpGRADE.DefaultView;
            String cFiltro = "";

            if (radioNome.Checked)
            {
                cFiltro = "nome LIKE '%" + txtBuscar.Text.Trim() + "%'";
            }

            if (radioAtores.Checked)
            {
                cFiltro = "atores LIKE '%" + txtBuscar.Text.Trim() + "%'";
            }


            dv.RowFilter = cFiltro;
            Dados.EditGrid(grid);

        }

        private void Carregar()
        {

            

            List<KeyValuePair<string, Filme>> lFilms = Dados.mFilmes.ToList();
            AllFilms.Clear();
            foreach (KeyValuePair<string, Filme> aux in lFilms)
            {
                AllFilms.Add(aux.Value);
            }

            tmpGRADE = Dados.GetTableFilmes(AllFilms);
            grid.DataSource = tmpGRADE;
            Dados.EditGrid(grid);

        }

        private void BuscarFilme_Load(object sender, EventArgs e)
        {
            Carregar();
        }

        private void btnSelecionar_Click(object sender, EventArgs e)
        {
            String filme = grid.CurrentRow.Cells[0].Value.ToString();
            Selecionado = Dados.mFilmes[filme];
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CadastraFilme oCadastraFilme = new CadastraFilme();
            oCadastraFilme.ShowDialog();
            
            Carregar();
        }




    }
}
