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
    public partial class EditPerfil : Form
    {
        public Usuario uEditUsu = null;
        public String cImgPerfil = "";

        public EditPerfil(Usuario tuUsu)
        {
            InitializeComponent();
            uEditUsu = tuUsu;
            this.Text = "Editando..." + uEditUsu.cNome;
            Inicio();
        }

        public void Inicio()
        {
            txtNome.Text        = uEditUsu.cNome;
            txtSobreNome.Text   = uEditUsu.cSobreNome;
            txtCidade.Text      = uEditUsu.cCidade;
            txtEstado.Text      = uEditUsu.cEstado;
            dtpAniver.Text      = uEditUsu.cAniver;
            pcbFoto.Image       = uEditUsu.iFoto;
        }

        public void Salvar()
        {
            Dados.mUsuarios[uEditUsu.cLogin].cNome      = uEditUsu.cNome;
            Dados.mUsuarios[uEditUsu.cLogin].cSobreNome = uEditUsu.cSobreNome;
            Dados.mUsuarios[uEditUsu.cLogin].cAniver    = uEditUsu.cAniver;
            Dados.mUsuarios[uEditUsu.cLogin].cCidade    = uEditUsu.cCidade;
            Dados.mUsuarios[uEditUsu.cLogin].cEstado    = uEditUsu.cEstado;
            Dados.mUsuarios[uEditUsu.cLogin].SetImg(cImgPerfil);

            Dados.oUsuLogado = Dados.mUsuarios[uEditUsu.cLogin];
        }

        private void lnkFoto_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            // Faz a busca a imagem
            OpenFileDialog oOpenFile = new OpenFileDialog();
            oOpenFile.Title = "Escolha Uma Foto";
            oOpenFile.Filter = "Fotos|*.jpg|Fotos|*.gif|Fotos|*.bmp|Fotos|*.png";
            oOpenFile.ShowDialog();

            if (!(String.IsNullOrEmpty(oOpenFile.FileName)))
            {
                cImgPerfil = oOpenFile.FileName;
            }
            else { cImgPerfil = ""; }
            // adiciona a imagem redimencionada
            pcbFoto.Image = uEditUsu.SetImg(cImgPerfil);
        }

        private void cmdSalvar_Click(object sender, EventArgs e)
        {
            uEditUsu.cNome      = txtNome.Text;
            uEditUsu.cSobreNome = txtSobreNome.Text;
            uEditUsu.cCidade    = txtCidade.Text;
            uEditUsu.cEstado    = txtEstado.Text;
            uEditUsu.cAniver    = dtpAniver.Text;
            Salvar();
            this.Close();
        }

        private void cmdCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
