namespace SharpBook.Telas
{
    partial class FormPerfil
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.picPerfil = new System.Windows.Forms.PictureBox();
            this.grbOpcoes = new System.Windows.Forms.GroupBox();
            this.lblADD = new System.Windows.Forms.LinkLabel();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.cmdPerfil = new System.Windows.Forms.Button();
            this.cmdFilmes = new System.Windows.Forms.Button();
            this.cmdAmigos = new System.Windows.Forms.Button();
            this.cmdMsg = new System.Windows.Forms.Button();
            this.edtEditPerfil = new System.Windows.Forms.LinkLabel();
            this.lblNome = new System.Windows.Forms.Label();
            this.gridMsg = new System.Windows.Forms.DataGridView();
            this.gridAmigos = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.gridFilmes = new System.Windows.Forms.DataGridView();
            this.boxFilmes = new System.Windows.Forms.GroupBox();
            this.btnAddFavorit = new System.Windows.Forms.Button();
            this.btnRemFilme = new System.Windows.Forms.Button();
            this.btnBuscarFilme = new System.Windows.Forms.Button();
            this.boxMsgs = new System.Windows.Forms.GroupBox();
            this.btnAbrirMsg = new System.Windows.Forms.Button();
            this.btnRmvMsg = new System.Windows.Forms.Button();
            this.boxAcaoAmigos = new System.Windows.Forms.GroupBox();
            this.btnEnviarTodos = new System.Windows.Forms.Button();
            this.btnSentMsg = new System.Windows.Forms.Button();
            this.btnRemover = new System.Windows.Forms.Button();
            this.btnVerPerfil = new System.Windows.Forms.Button();
            this.btnRespnder = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.picPerfil)).BeginInit();
            this.grbOpcoes.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gridMsg)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridAmigos)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridFilmes)).BeginInit();
            this.boxFilmes.SuspendLayout();
            this.boxMsgs.SuspendLayout();
            this.boxAcaoAmigos.SuspendLayout();
            this.SuspendLayout();
            // 
            // picPerfil
            // 
            this.picPerfil.BackColor = System.Drawing.Color.White;
            this.picPerfil.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.picPerfil.Location = new System.Drawing.Point(12, 12);
            this.picPerfil.Name = "picPerfil";
            this.picPerfil.Size = new System.Drawing.Size(140, 140);
            this.picPerfil.TabIndex = 0;
            this.picPerfil.TabStop = false;
            // 
            // grbOpcoes
            // 
            this.grbOpcoes.Controls.Add(this.lblADD);
            this.grbOpcoes.Controls.Add(this.btnBuscar);
            this.grbOpcoes.Controls.Add(this.cmdPerfil);
            this.grbOpcoes.Controls.Add(this.cmdFilmes);
            this.grbOpcoes.Controls.Add(this.cmdAmigos);
            this.grbOpcoes.Controls.Add(this.cmdMsg);
            this.grbOpcoes.Controls.Add(this.edtEditPerfil);
            this.grbOpcoes.Location = new System.Drawing.Point(12, 158);
            this.grbOpcoes.Name = "grbOpcoes";
            this.grbOpcoes.Size = new System.Drawing.Size(140, 321);
            this.grbOpcoes.TabIndex = 1;
            this.grbOpcoes.TabStop = false;
            this.grbOpcoes.Text = "Opções";
            // 
            // lblADD
            // 
            this.lblADD.AutoSize = true;
            this.lblADD.Location = new System.Drawing.Point(7, 20);
            this.lblADD.Name = "lblADD";
            this.lblADD.Size = new System.Drawing.Size(111, 13);
            this.lblADD.TabIndex = 12;
            this.lblADD.TabStop = true;
            this.lblADD.Text = "Adicionar como amigo";
            this.lblADD.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.lblADD_LinkClicked);
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(8, 152);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(124, 23);
            this.btnBuscar.TabIndex = 5;
            this.btnBuscar.Text = "Buscar Perfil";
            this.btnBuscar.UseVisualStyleBackColor = true;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // cmdPerfil
            // 
            this.cmdPerfil.Location = new System.Drawing.Point(10, 36);
            this.cmdPerfil.Name = "cmdPerfil";
            this.cmdPerfil.Size = new System.Drawing.Size(124, 23);
            this.cmdPerfil.TabIndex = 4;
            this.cmdPerfil.UseVisualStyleBackColor = true;
            this.cmdPerfil.Click += new System.EventHandler(this.cmdPerfil_Click);
            // 
            // cmdFilmes
            // 
            this.cmdFilmes.Location = new System.Drawing.Point(10, 123);
            this.cmdFilmes.Name = "cmdFilmes";
            this.cmdFilmes.Size = new System.Drawing.Size(124, 23);
            this.cmdFilmes.TabIndex = 3;
            this.cmdFilmes.Text = "Filmes";
            this.cmdFilmes.UseVisualStyleBackColor = true;
            this.cmdFilmes.Click += new System.EventHandler(this.cmdFilmes_Click);
            // 
            // cmdAmigos
            // 
            this.cmdAmigos.Location = new System.Drawing.Point(10, 94);
            this.cmdAmigos.Name = "cmdAmigos";
            this.cmdAmigos.Size = new System.Drawing.Size(124, 23);
            this.cmdAmigos.TabIndex = 2;
            this.cmdAmigos.Text = "Amigos";
            this.cmdAmigos.UseVisualStyleBackColor = true;
            this.cmdAmigos.Click += new System.EventHandler(this.cmdAmigos_Click);
            // 
            // cmdMsg
            // 
            this.cmdMsg.Location = new System.Drawing.Point(10, 65);
            this.cmdMsg.Name = "cmdMsg";
            this.cmdMsg.Size = new System.Drawing.Size(124, 23);
            this.cmdMsg.TabIndex = 1;
            this.cmdMsg.Text = "Menssagens";
            this.cmdMsg.UseVisualStyleBackColor = true;
            this.cmdMsg.Click += new System.EventHandler(this.cmdMsg_Click);
            // 
            // edtEditPerfil
            // 
            this.edtEditPerfil.AutoSize = true;
            this.edtEditPerfil.Location = new System.Drawing.Point(7, 20);
            this.edtEditPerfil.Name = "edtEditPerfil";
            this.edtEditPerfil.Size = new System.Drawing.Size(60, 13);
            this.edtEditPerfil.TabIndex = 0;
            this.edtEditPerfil.TabStop = true;
            this.edtEditPerfil.Text = "Editar Perfil";
            this.edtEditPerfil.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.edtEditPerfil_LinkClicked);
            // 
            // lblNome
            // 
            this.lblNome.AutoSize = true;
            this.lblNome.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNome.Location = new System.Drawing.Point(158, 8);
            this.lblNome.Name = "lblNome";
            this.lblNome.Size = new System.Drawing.Size(323, 25);
            this.lblNome.TabIndex = 5;
            this.lblNome.Text = "Nome e Sobre Nome do Perfil";
            // 
            // gridMsg
            // 
            this.gridMsg.BackgroundColor = System.Drawing.Color.White;
            this.gridMsg.GridColor = System.Drawing.Color.White;
            this.gridMsg.Location = new System.Drawing.Point(158, 36);
            this.gridMsg.Name = "gridMsg";
            this.gridMsg.ReadOnly = true;
            this.gridMsg.RowHeadersVisible = false;
            this.gridMsg.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.gridMsg.Size = new System.Drawing.Size(377, 383);
            this.gridMsg.TabIndex = 8;
            this.gridMsg.Visible = false;
            this.gridMsg.DoubleClick += new System.EventHandler(this.btnAbrirMsg_Click);
            // 
            // gridAmigos
            // 
            this.gridAmigos.BackgroundColor = System.Drawing.Color.White;
            this.gridAmigos.GridColor = System.Drawing.Color.White;
            this.gridAmigos.Location = new System.Drawing.Point(158, 36);
            this.gridAmigos.MultiSelect = false;
            this.gridAmigos.Name = "gridAmigos";
            this.gridAmigos.RowHeadersVisible = false;
            this.gridAmigos.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.gridAmigos.Size = new System.Drawing.Size(377, 383);
            this.gridAmigos.TabIndex = 10;
            this.gridAmigos.Visible = false;
            this.gridAmigos.DoubleClick += new System.EventHandler(this.btnVerPerfil_Click);
            // 
            // label1
            // 
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(186, 100);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(323, 91);
            this.label1.TabIndex = 11;
            this.label1.Text = "Bem vindo ao #Book, aonde tudo acontece ;)";
            // 
            // gridFilmes
            // 
            this.gridFilmes.BackgroundColor = System.Drawing.Color.White;
            this.gridFilmes.GridColor = System.Drawing.Color.White;
            this.gridFilmes.Location = new System.Drawing.Point(158, 36);
            this.gridFilmes.MultiSelect = false;
            this.gridFilmes.Name = "gridFilmes";
            this.gridFilmes.RowHeadersVisible = false;
            this.gridFilmes.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.gridFilmes.Size = new System.Drawing.Size(377, 383);
            this.gridFilmes.TabIndex = 12;
            this.gridFilmes.Visible = false;
            this.gridFilmes.RowEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.gridFilmes_RowEnter);
            // 
            // boxFilmes
            // 
            this.boxFilmes.Controls.Add(this.btnAddFavorit);
            this.boxFilmes.Controls.Add(this.btnRemFilme);
            this.boxFilmes.Controls.Add(this.btnBuscarFilme);
            this.boxFilmes.Location = new System.Drawing.Point(158, 426);
            this.boxFilmes.Name = "boxFilmes";
            this.boxFilmes.Size = new System.Drawing.Size(212, 52);
            this.boxFilmes.TabIndex = 13;
            this.boxFilmes.TabStop = false;
            this.boxFilmes.Text = "Ações";
            this.boxFilmes.Visible = false;
            // 
            // btnAddFavorit
            // 
            this.btnAddFavorit.Location = new System.Drawing.Point(16, 19);
            this.btnAddFavorit.Name = "btnAddFavorit";
            this.btnAddFavorit.Size = new System.Drawing.Size(91, 23);
            this.btnAddFavorit.TabIndex = 3;
            this.btnAddFavorit.Text = "Add Favoritos";
            this.btnAddFavorit.UseVisualStyleBackColor = true;
            this.btnAddFavorit.Visible = false;
            this.btnAddFavorit.Click += new System.EventHandler(this.btnAddFavorit_Click);
            // 
            // btnRemFilme
            // 
            this.btnRemFilme.Location = new System.Drawing.Point(113, 19);
            this.btnRemFilme.Name = "btnRemFilme";
            this.btnRemFilme.Size = new System.Drawing.Size(91, 23);
            this.btnRemFilme.TabIndex = 2;
            this.btnRemFilme.Text = "Remover";
            this.btnRemFilme.UseVisualStyleBackColor = true;
            this.btnRemFilme.Click += new System.EventHandler(this.btnRemFilme_Click);
            // 
            // btnBuscarFilme
            // 
            this.btnBuscarFilme.Location = new System.Drawing.Point(16, 19);
            this.btnBuscarFilme.Name = "btnBuscarFilme";
            this.btnBuscarFilme.Size = new System.Drawing.Size(91, 23);
            this.btnBuscarFilme.TabIndex = 1;
            this.btnBuscarFilme.Text = "Buscar Filme";
            this.btnBuscarFilme.UseVisualStyleBackColor = true;
            this.btnBuscarFilme.Click += new System.EventHandler(this.btnBuscarFilme_Click);
            // 
            // boxMsgs
            // 
            this.boxMsgs.Controls.Add(this.btnRespnder);
            this.boxMsgs.Controls.Add(this.btnAbrirMsg);
            this.boxMsgs.Controls.Add(this.btnRmvMsg);
            this.boxMsgs.Location = new System.Drawing.Point(165, 429);
            this.boxMsgs.Name = "boxMsgs";
            this.boxMsgs.Size = new System.Drawing.Size(317, 52);
            this.boxMsgs.TabIndex = 14;
            this.boxMsgs.TabStop = false;
            this.boxMsgs.Text = "Ações";
            this.boxMsgs.Visible = false;
            // 
            // btnAbrirMsg
            // 
            this.btnAbrirMsg.Location = new System.Drawing.Point(14, 19);
            this.btnAbrirMsg.Name = "btnAbrirMsg";
            this.btnAbrirMsg.Size = new System.Drawing.Size(91, 23);
            this.btnAbrirMsg.TabIndex = 20;
            this.btnAbrirMsg.Text = "Abrir Mensagem";
            this.btnAbrirMsg.UseVisualStyleBackColor = true;
            this.btnAbrirMsg.Click += new System.EventHandler(this.btnAbrirMsg_Click);
            // 
            // btnRmvMsg
            // 
            this.btnRmvMsg.Location = new System.Drawing.Point(111, 19);
            this.btnRmvMsg.Name = "btnRmvMsg";
            this.btnRmvMsg.Size = new System.Drawing.Size(91, 23);
            this.btnRmvMsg.TabIndex = 19;
            this.btnRmvMsg.Text = "Remover";
            this.btnRmvMsg.UseVisualStyleBackColor = true;
            this.btnRmvMsg.Click += new System.EventHandler(this.btnRmvMsg_Click);
            // 
            // boxAcaoAmigos
            // 
            this.boxAcaoAmigos.Controls.Add(this.btnEnviarTodos);
            this.boxAcaoAmigos.Controls.Add(this.btnSentMsg);
            this.boxAcaoAmigos.Controls.Add(this.btnRemover);
            this.boxAcaoAmigos.Controls.Add(this.btnVerPerfil);
            this.boxAcaoAmigos.Location = new System.Drawing.Point(159, 428);
            this.boxAcaoAmigos.Name = "boxAcaoAmigos";
            this.boxAcaoAmigos.Size = new System.Drawing.Size(313, 51);
            this.boxAcaoAmigos.TabIndex = 16;
            this.boxAcaoAmigos.TabStop = false;
            this.boxAcaoAmigos.Text = "Ações";
            this.boxAcaoAmigos.Visible = false;
            // 
            // btnEnviarTodos
            // 
            this.btnEnviarTodos.Location = new System.Drawing.Point(229, 18);
            this.btnEnviarTodos.Name = "btnEnviarTodos";
            this.btnEnviarTodos.Size = new System.Drawing.Size(75, 23);
            this.btnEnviarTodos.TabIndex = 12;
            this.btnEnviarTodos.Text = "Msg Todos";
            this.btnEnviarTodos.UseVisualStyleBackColor = true;
            this.btnEnviarTodos.Click += new System.EventHandler(this.btnEnviarTodos_Click);
            // 
            // btnSentMsg
            // 
            this.btnSentMsg.Location = new System.Drawing.Point(14, 19);
            this.btnSentMsg.Name = "btnSentMsg";
            this.btnSentMsg.Size = new System.Drawing.Size(75, 23);
            this.btnSentMsg.TabIndex = 11;
            this.btnSentMsg.Text = "Mandar Msg";
            this.btnSentMsg.UseVisualStyleBackColor = true;
            this.btnSentMsg.Click += new System.EventHandler(this.btnSentMsg_Click);
            // 
            // btnRemover
            // 
            this.btnRemover.Location = new System.Drawing.Point(165, 19);
            this.btnRemover.Name = "btnRemover";
            this.btnRemover.Size = new System.Drawing.Size(59, 23);
            this.btnRemover.TabIndex = 2;
            this.btnRemover.Text = "Remover";
            this.btnRemover.UseVisualStyleBackColor = true;
            this.btnRemover.Click += new System.EventHandler(this.btnRemover_Click);
            // 
            // btnVerPerfil
            // 
            this.btnVerPerfil.Location = new System.Drawing.Point(92, 19);
            this.btnVerPerfil.Name = "btnVerPerfil";
            this.btnVerPerfil.Size = new System.Drawing.Size(67, 23);
            this.btnVerPerfil.TabIndex = 1;
            this.btnVerPerfil.Text = "Ver Perfil";
            this.btnVerPerfil.UseVisualStyleBackColor = true;
            this.btnVerPerfil.Click += new System.EventHandler(this.btnVerPerfil_Click);
            // 
            // btnRespnder
            // 
            this.btnRespnder.Location = new System.Drawing.Point(208, 19);
            this.btnRespnder.Name = "btnRespnder";
            this.btnRespnder.Size = new System.Drawing.Size(91, 23);
            this.btnRespnder.TabIndex = 21;
            this.btnRespnder.Text = "Responder";
            this.btnRespnder.UseVisualStyleBackColor = true;
            this.btnRespnder.Click += new System.EventHandler(this.btnRespnder_Click);
            // 
            // FormPerfil
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(549, 482);
            this.Controls.Add(this.boxAcaoAmigos);
            this.Controls.Add(this.boxMsgs);
            this.Controls.Add(this.boxFilmes);
            this.Controls.Add(this.gridMsg);
            this.Controls.Add(this.gridFilmes);
            this.Controls.Add(this.gridAmigos);
            this.Controls.Add(this.lblNome);
            this.Controls.Add(this.grbOpcoes);
            this.Controls.Add(this.picPerfil);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.MaximizeBox = false;
            this.Name = "FormPerfil";
            this.Opacity = 0.95D;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Perfil";
            this.Load += new System.EventHandler(this.FormPerfil_Load);
            ((System.ComponentModel.ISupportInitialize)(this.picPerfil)).EndInit();
            this.grbOpcoes.ResumeLayout(false);
            this.grbOpcoes.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gridMsg)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridAmigos)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridFilmes)).EndInit();
            this.boxFilmes.ResumeLayout(false);
            this.boxMsgs.ResumeLayout(false);
            this.boxAcaoAmigos.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox picPerfil;
        private System.Windows.Forms.GroupBox grbOpcoes;
        private System.Windows.Forms.Button cmdPerfil;
        private System.Windows.Forms.Button cmdFilmes;
        private System.Windows.Forms.Button cmdAmigos;
        private System.Windows.Forms.Button cmdMsg;
        private System.Windows.Forms.LinkLabel edtEditPerfil;
        private System.Windows.Forms.Label lblNome;
        private System.Windows.Forms.DataGridView gridMsg;
        private System.Windows.Forms.DataGridView gridAmigos;
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.LinkLabel lblADD;
        private System.Windows.Forms.DataGridView gridFilmes;
        private System.Windows.Forms.GroupBox boxFilmes;
        private System.Windows.Forms.Button btnAddFavorit;
        private System.Windows.Forms.Button btnRemFilme;
        private System.Windows.Forms.Button btnBuscarFilme;
        private System.Windows.Forms.GroupBox boxMsgs;
        private System.Windows.Forms.Button btnAbrirMsg;
        private System.Windows.Forms.Button btnRmvMsg;
        private System.Windows.Forms.GroupBox boxAcaoAmigos;
        private System.Windows.Forms.Button btnSentMsg;
        private System.Windows.Forms.Button btnRemover;
        private System.Windows.Forms.Button btnVerPerfil;
        private System.Windows.Forms.Button btnEnviarTodos;
        private System.Windows.Forms.Button btnRespnder;
    }
}