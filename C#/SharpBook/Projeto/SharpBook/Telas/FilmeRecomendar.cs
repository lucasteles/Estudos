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
    public partial class FilmeRecomendar : Form
    {
        private DataTable tmpGRADE;
        public Filme Selecionado = null;
        List<Filme> allFilmes;

        public FilmeRecomendar(List<Filme> Filmes)
        {
            InitializeComponent();
            allFilmes = Filmes;

        }

        private void Carregar()
        {

            tmpGRADE = Dados.GetTableFilmes(allFilmes);
            grid.DataSource = tmpGRADE;
            Dados.EditGrid(grid);

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

        private void btnSelecionar_Click(object sender, EventArgs e)
        {
            String filme = grid.CurrentRow.Cells[0].Value.ToString();
            Selecionado = Dados.mFilmes[filme];
            this.Close();
        }

        private void FilmeRecomendar_Load(object sender, EventArgs e)
        {
            Carregar();
        }
    }
}
