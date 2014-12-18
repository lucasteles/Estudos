using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SharpBook.Classes;
using System.IO;

namespace SharpBook.Telas
{
    
    public partial class FormPerfil : Form
    {
        public Usuario uPerfil = null;
        public FormPerfil(Usuario tuPerfil)
        {
            InitializeComponent();
            uPerfil = tuPerfil;
        }

        private void FormPerfil_Load(object sender, EventArgs e)
        {
            Inicio();
        }

        public void Inicio()
        {
            picPerfil.Image = uPerfil.iFoto;
            lblNome.Text    = uPerfil.cNome + " " + uPerfil.cSobreNome;

            if (uPerfil.cLogin != Dados.oUsuLogado.cLogin)
            {
                edtEditPerfil.Visible = false;
                btnRemover.Visible = false;
                btnRemFilme.Visible = false;
                btnBuscarFilme.Visible = false;
                btnRmvMsg.Visible = false;
                btnRespnder.Visible = false;
                btnEnviarTodos.Visible = false;

                Boolean lNoFound = true;
                foreach (Usuario Usu in Dados.oUsuLogado.lAmigos)
                {
                    if (uPerfil.cLogin.Equals(Usu.cLogin))
                        lNoFound = false;
                    
                }
                lblADD.Visible = lNoFound;

            }
            else
            {
                edtEditPerfil.Visible = true;
                btnRemover.Visible = true;
                lblADD.Visible = false;
                btnRemFilme.Visible = true;
                btnBuscarFilme.Visible = true;
                btnRmvMsg.Visible = true;
                btnRespnder.Visible = true;
                btnEnviarTodos.Visible = true;
                cmdPerfil.Text = uPerfil.cNome;
            }


            gridAmigos.DataSource = Dados.GetTableAmigos(uPerfil.lAmigos);
            Dados.EditGrid(gridAmigos);

            gridFilmes.DataSource = Dados.GetTableFilmes(uPerfil.lFilmes);
            Dados.EditGrid(gridFilmes);

            gridMsg.DataSource = Dados.GetTableMsg(uPerfil.lMsgs);
            Dados.EditGrid(gridMsg);

            gridMsg.Columns[4].Visible = false;
        }

        private void edtEditPerfil_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            EditPerfil oEditPerf = new EditPerfil(Dados.oUsuLogado);
            oEditPerf.ShowDialog();
            uPerfil = Dados.oUsuLogado;
            Inicio();
        }

        private void cmdAmigos_Click(object sender, EventArgs e)
        {
            gridMsg.Visible = false;
            boxMsgs.Visible = false;

            gridAmigos.Visible = true;
            boxAcaoAmigos.Visible = true;

            gridFilmes.Visible = false;
            boxFilmes.Visible = false;
        }

        private void cmdMsg_Click(object sender, EventArgs e)
        {
            gridMsg.Visible = true;
            boxMsgs.Visible = true;

            gridAmigos.Visible = false;
            boxAcaoAmigos.Visible = false;

            gridFilmes.Visible = false;
            boxFilmes.Visible = false;

        }

        private void cmdFilmes_Click(object sender, EventArgs e)
        {
            gridFilmes.Visible = true;
            boxFilmes.Visible = true;

            gridMsg.Visible = false;
            boxMsgs.Visible = false;

            gridAmigos.Visible = false;
            boxAcaoAmigos.Visible = false;
        }

        private void cmdPerfil_Click(object sender, EventArgs e)
        {
            gridMsg.Visible = false;
            boxMsgs.Visible = false;

            gridAmigos.Visible = false;
            boxAcaoAmigos.Visible = false;

            gridFilmes.Visible = false;
            boxFilmes.Visible = false;

            uPerfil = Dados.oUsuLogado;
            Inicio();
        }

        private void btnVerPerfil_Click(object sender, EventArgs e)
        {
            if (gridAmigos.RowCount == 0){return;}

            String Amigo = gridAmigos.CurrentRow.Cells[1].Value.ToString();

            uPerfil = Dados.mUsuarios[Amigo];
            Inicio();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            Usuario uNovo = null;

            BuscaPerfils oBuscarPerfils = new BuscaPerfils();

            oBuscarPerfils.ShowDialog();
            uNovo = oBuscarPerfils.Selecionado;

            if (uNovo != null)
            {
                uPerfil = uNovo;
                Inicio();
            }
        }

        private void btnRemover_Click(object sender, EventArgs e)
        {
            if (gridAmigos.RowCount == 0){return;}
            String Amigo = gridAmigos.CurrentRow.Cells[1].Value.ToString();
            Dados.mUsuarios[Amigo].lAmigos.Remove(uPerfil);
            uPerfil.lAmigos.Remove( Dados.mUsuarios[Amigo]);
            Inicio();
        }

        private void lblADD_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Dados.oUsuLogado.lAmigos.Add(uPerfil);
            uPerfil.lAmigos.Add(Dados.oUsuLogado);
            Inicio();
        }

        private void btnRemFilme_Click(object sender, EventArgs e)
        {
            if (gridFilmes.RowCount == 0) { return; }
            String filme = gridFilmes.CurrentRow.Cells[0].Value.ToString();
            uPerfil.lFilmes.Remove(Dados.mFilmes[filme]);
            Inicio();
        }

        private void btnBuscarFilme_Click(object sender, EventArgs e)
        {
            BuscarFilme oBuscarFilme = new BuscarFilme();
            oBuscarFilme.ShowDialog();

            if (oBuscarFilme.Selecionado != null)
                Dados.oUsuLogado.lFilmes.Add(oBuscarFilme.Selecionado);


            Inicio();

        }

        private void gridFilmes_RowEnter(object sender, DataGridViewCellEventArgs e)
        {

            if (gridFilmes.RowCount == 0) {
                btnAddFavorit.Visible = false;
                return; 
            }

            String filme = gridFilmes.Rows[e.RowIndex].Cells[0].Value.ToString();

            if (!Dados.oUsuLogado.lFilmes.Contains(Dados.mFilmes[filme]))
            {
                btnAddFavorit.Visible = true;
            }
            else
            {
                btnAddFavorit.Visible = false;
            }


        }

        private void btnAddFavorit_Click(object sender, EventArgs e)
        {
             if (gridFilmes.RowCount == 0) { return; }
            
            String filme = gridFilmes.CurrentRow.Cells[0].Value.ToString();

            Dados.oUsuLogado.lFilmes.Add(Dados.mFilmes[filme]);
            Inicio();

        }

        private void btnSentMsg_Click(object sender, EventArgs e)
        {
            if (gridAmigos.RowCount == 0) { return; }
            String Amigo = gridAmigos.CurrentRow.Cells[1].Value.ToString();
            Mensagem oMensagem = new Mensagem(Dados.mUsuarios[Amigo]);
            oMensagem.ShowDialog();
            
        }

        private void btnRmvMsg_Click(object sender, EventArgs e)
        {
            if (gridMsg.RowCount == 0) { return; }
            
            Msg msg = (Msg) gridMsg.CurrentRow.Cells[4].Value;
            Dados.oUsuLogado.lMsgs.Remove(msg);
            Inicio();
        }

        private void btnAbrirMsg_Click(object sender, EventArgs e)
        {
            if (gridMsg.RowCount == 0) { return; }
            Msg msg = (Msg) gridMsg.CurrentRow.Cells[4].Value;

            if(uPerfil.cLogin==Dados.oUsuLogado.cLogin){msg.SetLida(true);}
            
            Mensagem oMensagem = new Mensagem(msg);
            oMensagem.ShowDialog();
            Inicio();
            

        }

        private void btnEnviarTodos_Click(object sender, EventArgs e)
        {
            if (gridAmigos.RowCount == 0) { return; }
            String Amigo = gridAmigos.CurrentRow.Cells[1].Value.ToString();
            Mensagem oMensagem = new Mensagem();
            oMensagem.ShowDialog();
        }

        private void btnRespnder_Click(object sender, EventArgs e)
        {
            if (gridMsg.RowCount == 0) { return; }
            Msg msg = (Msg)gridMsg.CurrentRow.Cells[4].Value;

            if (uPerfil.cLogin == Dados.oUsuLogado.cLogin) { msg.SetLida(true); }

            Mensagem oMensagem = new Mensagem(msg,"Resp");
            oMensagem.ShowDialog();
            Inicio();
        }
        
    }
}