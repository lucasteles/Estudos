using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SharpBook.Classes;
using SharpBook.Telas;
using System.Reflection;
using System.IO;

namespace SharpBook
{
    public partial class Principal : Form
    {
        public Principal()
        {
            InitializeComponent();
            this.Height = 170;
        }

        #region Metodos Iteis
        public void SetEmpty(GroupBox toGroup)
        {
            txtLoginC.Text = "";
            txtSenhaC.Text = "";
            txtSenhaCC.Text = "";
            lblStatus.Visible = false;
        }
        #endregion

        private void grbLogin_Enter(object sender, EventArgs e)
        {
            
        }

        private void lblCadastro_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Dados.EnableControls(grbLogin, false);
            this.Height = 345;
        }

        private void cmdCancelar_Click(object sender, EventArgs e)
        {
            Dados.EnableControls(grbLogin, true);
            this.Height = 170;
            SetEmpty(grbCadastro);
        }

        private void cmdCadastrar_Click(object sender, EventArgs e)
        {
            if (txtSenhaC.Text.Equals(txtSenhaCC.Text) && !Dados.ValidaUsuario(txtLoginC.Text) && !Dados.IsEmpty(grbCadastro))
            {
                Usuario oUsu = new Usuario(txtLoginC.Text, txtSenhaC.Text);
                Dados.CadastraUsuario(oUsu);
                this.Height = 170;
                Dados.EnableControls(grbLogin, true);
                txtLogin.Focus();
                SetEmpty(grbCadastro);
            }
            else
            {
                MessageBox.Show("Confirmação de senha inválida ou login já cadastrado, verifique a senha e login e tente novamente.", "Validação!");
            }
        }

        private void lblVerifica_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            if (!String.IsNullOrEmpty(txtLoginC.Text))
            {
                if (!Dados.ValidaUsuario(txtLoginC.Text))
                {
                    lblStatus.Text = "Login Disponivel!";
                    lblStatus.ForeColor = Color.Green;
                }
                else
                {
                    lblStatus.Text = "Login Indisponivel!";
                    lblStatus.ForeColor = Color.Red;
                }
                lblStatus.Visible = true;
            }
        }

        private void cmdFechar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        public void Logar()
        {
            if (Dados.ValidaUsuario(txtLogin.Text, txtSenha.Text) && !String.IsNullOrEmpty(txtSenha.Text))
            {
                Dados.oUsuLogado = Dados.BuscaUsu(txtLogin.Text);

                this.Visible = false;
                txtLogin.Text = "";
                txtSenha.Text = "";
                FormPerfil oFormPerfil = new FormPerfil(Dados.oUsuLogado);
                oFormPerfil.ShowDialog();
                this.Visible = true;
                txtLogin.Focus();
            }
            else{MessageBox.Show("Usuarios ou senha inválido(a).Tente novamente!", "Validação!");}
        }

        private void cmdLogar_Click(object sender, EventArgs e)
        {
            Logar();
        }

        private void txtLogin_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == 13) { Logar(); }
        }

        private void txtSenha_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == 13){Logar();}
        }

        private void Principal_Load(object sender, EventArgs e)
        {
           
            Assembly myAssembly = Assembly.GetExecutingAssembly();
            Stream myStream = myAssembly.GetManifestResourceStream("SharpBook.Imagens.Logo.jpg");
            picLogo.Image = new Bitmap(myStream); 
        }
    }
}