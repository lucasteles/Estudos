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
    public partial class CadastraFilme : Form
    {

        public CadastraFilme()
        {
            InitializeComponent();
        }

        private void CadastraFilme_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (txtComent.Text == String.Empty || txtNome.Text == String.Empty || tctAtores.Text == String.Empty)
            {
                MessageBox.Show("Preencha todos os campos!");
                return;
            }
            else
            {
                String cNome = txtNome.Text;
                String cAtors = tctAtores.Text;
                String cComent = txtComent.Text;

                if (Dados.mFilmes.ContainsKey(cNome))
                {
                    MessageBox.Show("Filme já cadastrado");
                    return;
                }


                Dados.CadastraFilme( new Filme(cNome, cAtors, cComent) );
                Close();

            }


        }
    }
}
