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

    

    public partial class BuscaPerfils : Form
    {

        private List<Usuario> AllUsers = new List<Usuario>();
        private DataTable tmpGRADE;
        public Usuario Selecionado = null;

        
        public BuscaPerfils()
        {
            InitializeComponent();
           
        }


        private void BuscaPerfils_Load(object sender, EventArgs e)
        {
            List<KeyValuePair<string, Usuario>> lUsers = Dados.mUsuarios.ToList();
           

            foreach (KeyValuePair<string, Usuario> aux in lUsers)
            {
                AllUsers.Add( aux.Value );
            }

            tmpGRADE = Dados.GetTableAmigos(AllUsers);
            gridAmigos.DataSource = tmpGRADE ;
            Dados.EditGrid(gridAmigos);
        }

        private void btnSelecionar_Click(object sender, EventArgs e)
        {
            String Amigo = gridAmigos.CurrentRow.Cells[1].Value.ToString();
            Selecionado = Dados.mUsuarios[Amigo];
            this.Close();
             
        }

        private void txtSenha_TextChanged(object sender, EventArgs e)
        {
            DataView dv = tmpGRADE.DefaultView;
            String cFiltro="";

            if(radioLogin.Checked)
            {
                cFiltro = "login LIKE '%" + txtBuscar.Text.Trim() + "%'";
            }

            if(radioNome.Checked)
            {
                cFiltro = "nome LIKE '%" + txtBuscar.Text.Trim() + "%'";
            }

            
            dv.RowFilter = cFiltro;
            Dados.EditGrid(gridAmigos);

        }
    }


}
