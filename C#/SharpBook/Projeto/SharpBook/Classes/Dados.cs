using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data;
using System.Data.OleDb;
using System.ComponentModel;
using System.Drawing;
using System.IO;

namespace SharpBook.Classes
{
    public static class Dados
    {
        public static Dictionary<String, Usuario> mUsuarios = new Dictionary<String, Usuario>();
        public static Dictionary<String, Filme> mFilmes = new Dictionary<String, Filme>();
        public static Usuario oUsuLogado = null;

        public static void PreCadastrados()
        {
            CadastraUsuario(new Usuario("James",    "123").PreConfig());
            CadastraUsuario(new Usuario("Thais",    "123").PreConfig());
            CadastraUsuario(new Usuario("Julios",   "123").PreConfig());
            CadastraUsuario(new Usuario("Jacques",  "123").PreConfig());
            CadastraUsuario(new Usuario("Rafael",   "123").PreConfig());
            CadastraUsuario(new Usuario("Clayton",  "123").PreConfig());
            CadastraUsuario(new Usuario("Ryu",      "123").PreConfig());
            CadastraUsuario(new Usuario("Cristian", "123").PreConfig());
            CadastraUsuario(new Usuario("Marengone","123").PreConfig());
            CadastraUsuario(new Usuario("Ana",      "123").PreConfig());

            CadastraFilme(new Filme("Die Hard", "Bruce Wilis", "Filme bruto"));
            CadastraFilme(new Filme("Matrix", "Keano Reaves", "Melhores efeitos"));
            CadastraFilme(new Filme("Star Wars", "Harison Ford", "Num universo muito, muito distante"));
            CadastraFilme(new Filme("Lord Of The RIngs", "Tolkien", "O primeiro RGP da historia"));
            CadastraFilme(new Filme("Blade Runner", "Harison Ford", "Uma das melhores ficções ja feitas"));
            CadastraFilme(new Filme("007 James Bond", "Shun Connery ", "Bond, James Bond"));

            mUsuarios["Julios"].lFilmes.Add(mFilmes["Matrix"]);
            mUsuarios["Julios"].lFilmes.Add(mFilmes["Star Wars"]);

            mUsuarios["James"].lFilmes.Add(mFilmes["Blade Runner"]);
            mUsuarios["James"].lFilmes.Add(mFilmes["Matrix"]);
            mUsuarios["Cristian"].lFilmes.Add(mFilmes["Blade Runner"]);

            mUsuarios["Julios"].lAmigos.Add(mUsuarios["Thais"]);
            mUsuarios["Julios"].lAmigos.Add(mUsuarios["Rafael"]);
            mUsuarios["Julios"].lAmigos.Add(mUsuarios["James"]);

            mUsuarios["Thais"].lAmigos.Add(mUsuarios["Julios"]);
            mUsuarios["Rafael"].lAmigos.Add(mUsuarios["Julios"]);
            mUsuarios["James"].lAmigos.Add(mUsuarios["Julios"]);
            
            Msg msg1 = new Msg(mUsuarios["James"],"Teste","teste de ensagem muito bom",false);
            EspMsg msg2 = new EspMsg(mUsuarios["James"], "Teste 2", "teste muito legal");
            Msg msg3 = new Msg(mUsuarios["Julios"], "Teste 3", "teste muito legal 2", false);
            msg2.fRecomend = mFilmes["Die Hard"];

            mUsuarios["Julios"].lMsgs.Add(msg1);
            mUsuarios["Julios"].lMsgs.Add(msg2);
            mUsuarios["Julios"].lMsgs.Add(msg3);
            
        }
        public static Usuario BuscaUsu(String tcLogin)
        {
            return mUsuarios[tcLogin];
        }

        public static void CadastraUsuario(Usuario toUsu)
        {
            mUsuarios.Add(toUsu.cLogin, toUsu);
        }
        
        public static void CadastraUsuario(String tcLogin, String tcSenha)
        {
            mUsuarios.Add(tcLogin,new Usuario(tcLogin, tcSenha));
        }

        public static void CadastraFilme(Filme filme)
        {
            mFilmes.Add(filme.cNome, filme);
        }

        public static Boolean ValidaUsuario(Usuario toUsu)
        {
            Boolean lRetorno = false;

            if (mUsuarios.ContainsKey(toUsu.cLogin))
            {
                if (mUsuarios[toUsu.cLogin].cSenha == toUsu.cSenha || String.IsNullOrEmpty(toUsu.cSenha))
                {
                    lRetorno = true;
                }
            }
            return lRetorno;
        }
        public static Boolean ValidaUsuario(String tcUsu, String tcSenha)
        {
            return ValidaUsuario(new Usuario(tcUsu,tcSenha));
        }
        public static Boolean ValidaUsuario(String tcUsu)
        {
            return ValidaUsuario(new Usuario(tcUsu));;
        }

        public static void EnableControls(GroupBox toGroup, Boolean tlEnable)
        {
            foreach (Control oItem in toGroup.Controls)
            {
                oItem.Enabled = tlEnable;
            }
        }
        public static bool IsEmpty(GroupBox toGroup)
        {
            bool lRetorno = false;
            foreach (Control oItem in toGroup.Controls)
            {
                if (String.IsNullOrEmpty(oItem.Text))
                {
                    lRetorno = true;
                }
            }
            return lRetorno;
        }

        public static DataTable GetTableAmigos(List<Usuario> tuUsu)
        {
            DataTable DT =  new DataTable();

            DT.Columns.Add("Image", typeof(Byte[]));
            DT.Columns.Add("Login", typeof(String));
            DT.Columns.Add("Nome", typeof(String));

            foreach (Usuario uUsu in tuUsu)
            {
                MemoryStream ms = new MemoryStream();
                uUsu.GetImg("", 50, 50).Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                Byte[] Imagem = ms.ToArray();

                DataRow dr = DT.NewRow();
                dr["Image"] = Imagem;
                dr["Login"] = uUsu.cLogin;
                dr["Nome"] = uUsu.cNome +" "+ uUsu.cSobreNome;
                
                DT.Rows.Add(dr);
            }
            return DT;
        }

        public static DataTable GetTableFilmes(List<Filme> tfFilmes)
        {

            List<Usuario> AllUsers = new List<Usuario>();
            List<KeyValuePair<string, Usuario>> lUsuarios = Dados.mUsuarios.ToList();
            AllUsers.Clear();
            foreach (KeyValuePair<string, Usuario> aux in lUsuarios)
            {
                AllUsers.Add(aux.Value);
            }


            DataTable DT = new DataTable();

            DT.Columns.Add("Nome", typeof(String));
            DT.Columns.Add("Atores", typeof(String));
            DT.Columns.Add("Coment.", typeof(String));
            DT.Columns.Add("Popularidade", typeof(int));

            foreach (Filme filme in tfFilmes)
            {
                DataRow dr = DT.NewRow();
                dr["Nome"]      = filme.cNome;
                dr["Atores"]    = filme.cAtores;
                dr["Coment."]   = filme.cComen;

                int qtd = 0;

                foreach (Usuario item in AllUsers)
                {
                    if (item.lFilmes.Contains(filme))
                        qtd++;
                }
                dr["Popularidade"] = qtd;

                DT.Rows.Add(dr);
            }


            DT.DefaultView.Sort = "Popularidade desc" ;
            return DT;
        }

        public static DataTable GetTableMsg(List<Msg> tMSG)
        {
            DataTable DT = new DataTable();

            DT.Columns.Add("Lido", typeof(String));
            DT.Columns.Add("Data", typeof(DateTime));
            DT.Columns.Add("Assunto", typeof(String));
            DT.Columns.Add("Remetente", typeof(String));
            DT.Columns.Add("msg", typeof(Msg));
            
            foreach (Msg msg in tMSG)
            {
                DataRow dr = DT.NewRow();
                dr["Data"] = msg.dData;
                dr["Assunto"] = msg.cAssunto;
                dr["Remetente"] = msg.uRemetente.cLogin;
                dr["msg"] = msg;

                String status;
                if (msg.lLida){status="Sim";}else{status="Não";}
                dr["lido"] = status;

                DT.Rows.Add(dr);
            }
            return DT;
        }

        public static void EditGrid(DataGridView Grid)
        {
            Boolean vGrid = Grid.Visible;
            Grid.Visible = true;
            Grid.Columns[1].Width = 100;
            Grid.AllowUserToResizeRows = false;
            Grid.AllowUserToAddRows = false;
            Grid.ReadOnly = true;
            for (int i = 0; i < Grid.Rows.Count; i++)
            {
                Grid.AutoResizeRow(i);
            }
            Grid.Visible = vGrid;
        }
    }
}
