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
    public partial class Mensagem : Form
    {
        Usuario uDestinatario = null;
        Filme Recomendacao = null;

        public Mensagem(Usuario tDestinatario)
        {
            InitializeComponent();

            uDestinatario = tDestinatario;
            txtPara.Text = tDestinatario.cLogin;

            lblDEPARA.Text = "Para";

        }

        public Mensagem()
        {
            InitializeComponent();            

            lblDEPARA.Text = "Para";
            txtPara.Text = "Todos";
            txtPara.ReadOnly = true;
        }

        public Mensagem(Msg mensagem, String Acao)
        {
            InitializeComponent();  
            if (Acao.Equals("Resp"))
            {

                txtPara.ReadOnly = true;
                uDestinatario = mensagem.uRemetente;
                txtPara.Text = uDestinatario.cLogin;

                lblDEPARA.Text = "Para";

                txtAssunto.Text = "Re:" + mensagem.LerAssunto();

            }
        }

        public Mensagem(Msg mensagem)
        {
            
            InitializeComponent();


            EspMsg espMsg = null;

            if (mensagem is EspMsg)
                espMsg = (EspMsg)mensagem;
           



            txtAssunto.Text = mensagem.cAssunto;
            txtMSG.Text = mensagem.LerMsg();
            txtPara.Text = mensagem.uRemetente.cLogin;

            if (espMsg != null)
            {
                if (espMsg.fRecomend != null)
                {
                    txtFilme.Text = espMsg.fRecomend.cNome;
                
                    lblACC.Visible = true;
                    Recomendacao = espMsg.fRecomend;
                }
            }

            lblDEPARA.Text = "De";
            btnEnviar.Visible = false;

            lblReco.Visible = false;
            txtAssunto.ReadOnly = true;
            txtMSG.ReadOnly = true;
            txtPara.ReadOnly = true;

        }
            
            
        private void btnEnviar_Click(object sender, EventArgs e)
        {

            if(!Dados.mUsuarios.ContainsKey(txtPara.Text.Trim()) && !txtPara.Text.Equals("Todos"))
            {
                MessageBox.Show("Destinatario não encontrado!");
                return;
            }



            if (String.IsNullOrEmpty(txtAssunto.Text) || String.IsNullOrEmpty(txtMSG.Text) || String.IsNullOrEmpty(txtPara.Text))
            {
                MessageBox.Show("Preencha os campos!","Aviso!");
                return;
            }

            if (!txtPara.Text.Equals("Todos"))
              uDestinatario = Dados.mUsuarios[txtPara.Text.Trim()];

            Msg msg = new Msg(Dados.oUsuLogado, txtAssunto.Text, txtMSG.Text);
            EspMsg msgEsp = null;

            if (Recomendacao != null)
            {
                msgEsp = new EspMsg(msg.uRemetente, msg.LerAssunto(), msg.LerMsg());
                msgEsp.fRecomend = Recomendacao;

                if (txtPara.Text.Equals("Todos"))
                {
                    foreach (Usuario item in Dados.oUsuLogado.lAmigos)
                    {
                        item.lMsgs.Add(msgEsp);
                    }
                }
                else
                {
                    uDestinatario.lMsgs.Add(msgEsp);
                }

            }
            else
            {
                if (txtPara.Text.Equals("Todos"))
                {
                    foreach (Usuario item in Dados.oUsuLogado.lAmigos)
                    {
                        item.lMsgs.Add(msg);
                    }
                }
                else
                {
                    uDestinatario.lMsgs.Add(msg);
                }
            }
            
            Close();
        }

        private void Mensagem_Load(object sender, EventArgs e)
        {

        }

        private void lblADD_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            FilmeRecomendar oFilmeRecomendar = new FilmeRecomendar(Dados.oUsuLogado.lFilmes);
            oFilmeRecomendar.ShowDialog();

            Filme filme = oFilmeRecomendar.Selecionado;

            if (filme != null)
            {
                Recomendacao = filme;
                txtFilme.Text = filme.cNome;
            }

            

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            if(Recomendacao==null){return;}

            if (!Dados.oUsuLogado.lFilmes.Contains(Recomendacao))
            {
                Dados.oUsuLogado.lFilmes.Add(Recomendacao);
                MessageBox.Show("Recomendação Aceita!");

            }
            else
            {
                MessageBox.Show("Filme já consta na sua lista!");
            }
        }
        


    }
}
