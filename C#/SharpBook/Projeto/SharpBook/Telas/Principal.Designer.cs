namespace SharpBook
{
    partial class Principal
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
            this.grbLogin = new System.Windows.Forms.GroupBox();
            this.picLogo = new System.Windows.Forms.PictureBox();
            this.txtLogin = new System.Windows.Forms.TextBox();
            this.lblSenha = new System.Windows.Forms.Label();
            this.cmdLogar = new System.Windows.Forms.Button();
            this.lblLogin = new System.Windows.Forms.Label();
            this.lblCadastro = new System.Windows.Forms.LinkLabel();
            this.cmdFechar = new System.Windows.Forms.Button();
            this.txtSenha = new System.Windows.Forms.TextBox();
            this.grbCadastro = new System.Windows.Forms.GroupBox();
            this.lblStatus = new System.Windows.Forms.Label();
            this.cmdCancelar = new System.Windows.Forms.Button();
            this.lblVerifica = new System.Windows.Forms.LinkLabel();
            this.cmdCadastrar = new System.Windows.Forms.Button();
            this.lblSenhaCC = new System.Windows.Forms.Label();
            this.lblSenhaC = new System.Windows.Forms.Label();
            this.lblLoginC = new System.Windows.Forms.Label();
            this.txtSenhaCC = new System.Windows.Forms.TextBox();
            this.txtSenhaC = new System.Windows.Forms.TextBox();
            this.txtLoginC = new System.Windows.Forms.TextBox();
            this.grbLogin.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picLogo)).BeginInit();
            this.grbCadastro.SuspendLayout();
            this.SuspendLayout();
            // 
            // grbLogin
            // 
            this.grbLogin.Controls.Add(this.picLogo);
            this.grbLogin.Controls.Add(this.txtLogin);
            this.grbLogin.Controls.Add(this.lblSenha);
            this.grbLogin.Controls.Add(this.cmdLogar);
            this.grbLogin.Controls.Add(this.lblLogin);
            this.grbLogin.Controls.Add(this.lblCadastro);
            this.grbLogin.Controls.Add(this.cmdFechar);
            this.grbLogin.Controls.Add(this.txtSenha);
            this.grbLogin.Location = new System.Drawing.Point(12, 12);
            this.grbLogin.Name = "grbLogin";
            this.grbLogin.Size = new System.Drawing.Size(339, 123);
            this.grbLogin.TabIndex = 8;
            this.grbLogin.TabStop = false;
            this.grbLogin.Enter += new System.EventHandler(this.grbLogin_Enter);
            // 
            // picLogo
            // 
            this.picLogo.Location = new System.Drawing.Point(7, 19);
            this.picLogo.Name = "picLogo";
            this.picLogo.Size = new System.Drawing.Size(149, 88);
            this.picLogo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picLogo.TabIndex = 16;
            this.picLogo.TabStop = false;
            // 
            // txtLogin
            // 
            this.txtLogin.Location = new System.Drawing.Point(203, 19);
            this.txtLogin.Name = "txtLogin";
            this.txtLogin.Size = new System.Drawing.Size(118, 20);
            this.txtLogin.TabIndex = 0;
            this.txtLogin.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtLogin_KeyPress);
            // 
            // lblSenha
            // 
            this.lblSenha.AutoSize = true;
            this.lblSenha.Location = new System.Drawing.Point(162, 45);
            this.lblSenha.Name = "lblSenha";
            this.lblSenha.Size = new System.Drawing.Size(38, 13);
            this.lblSenha.TabIndex = 15;
            this.lblSenha.Text = "Senha";
            // 
            // cmdLogar
            // 
            this.cmdLogar.Location = new System.Drawing.Point(165, 68);
            this.cmdLogar.Name = "cmdLogar";
            this.cmdLogar.Size = new System.Drawing.Size(75, 23);
            this.cmdLogar.TabIndex = 2;
            this.cmdLogar.Text = "Logar";
            this.cmdLogar.UseVisualStyleBackColor = true;
            this.cmdLogar.Click += new System.EventHandler(this.cmdLogar_Click);
            // 
            // lblLogin
            // 
            this.lblLogin.AutoSize = true;
            this.lblLogin.Location = new System.Drawing.Point(162, 19);
            this.lblLogin.Name = "lblLogin";
            this.lblLogin.Size = new System.Drawing.Size(33, 13);
            this.lblLogin.TabIndex = 14;
            this.lblLogin.Text = "Login";
            // 
            // lblCadastro
            // 
            this.lblCadastro.AutoSize = true;
            this.lblCadastro.BackColor = System.Drawing.Color.Transparent;
            this.lblCadastro.Cursor = System.Windows.Forms.Cursors.Hand;
            this.lblCadastro.Location = new System.Drawing.Point(162, 94);
            this.lblCadastro.Name = "lblCadastro";
            this.lblCadastro.Size = new System.Drawing.Size(166, 13);
            this.lblCadastro.TabIndex = 4;
            this.lblCadastro.TabStop = true;
            this.lblCadastro.Text = "Ainda não cadastrado, Click aqui.";
            this.lblCadastro.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.lblCadastro_LinkClicked);
            // 
            // cmdFechar
            // 
            this.cmdFechar.Location = new System.Drawing.Point(246, 68);
            this.cmdFechar.Name = "cmdFechar";
            this.cmdFechar.Size = new System.Drawing.Size(75, 23);
            this.cmdFechar.TabIndex = 3;
            this.cmdFechar.Text = "Fechar";
            this.cmdFechar.UseVisualStyleBackColor = true;
            this.cmdFechar.Click += new System.EventHandler(this.cmdFechar_Click);
            // 
            // txtSenha
            // 
            this.txtSenha.Location = new System.Drawing.Point(203, 42);
            this.txtSenha.Name = "txtSenha";
            this.txtSenha.PasswordChar = '*';
            this.txtSenha.Size = new System.Drawing.Size(118, 20);
            this.txtSenha.TabIndex = 1;
            this.txtSenha.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtSenha_KeyPress);
            // 
            // grbCadastro
            // 
            this.grbCadastro.Controls.Add(this.lblStatus);
            this.grbCadastro.Controls.Add(this.cmdCancelar);
            this.grbCadastro.Controls.Add(this.lblVerifica);
            this.grbCadastro.Controls.Add(this.cmdCadastrar);
            this.grbCadastro.Controls.Add(this.lblSenhaCC);
            this.grbCadastro.Controls.Add(this.lblSenhaC);
            this.grbCadastro.Controls.Add(this.lblLoginC);
            this.grbCadastro.Controls.Add(this.txtSenhaCC);
            this.grbCadastro.Controls.Add(this.txtSenhaC);
            this.grbCadastro.Controls.Add(this.txtLoginC);
            this.grbCadastro.Location = new System.Drawing.Point(12, 151);
            this.grbCadastro.Name = "grbCadastro";
            this.grbCadastro.Size = new System.Drawing.Size(339, 167);
            this.grbCadastro.TabIndex = 9;
            this.grbCadastro.TabStop = false;
            this.grbCadastro.Text = "Novo Login";
            // 
            // lblStatus
            // 
            this.lblStatus.AutoSize = true;
            this.lblStatus.BackColor = System.Drawing.Color.Transparent;
            this.lblStatus.Location = new System.Drawing.Point(209, 45);
            this.lblStatus.Name = "lblStatus";
            this.lblStatus.Size = new System.Drawing.Size(47, 13);
            this.lblStatus.TabIndex = 24;
            this.lblStatus.Text = "lblStatus";
            this.lblStatus.Visible = false;
            // 
            // cmdCancelar
            // 
            this.cmdCancelar.Location = new System.Drawing.Point(88, 127);
            this.cmdCancelar.Name = "cmdCancelar";
            this.cmdCancelar.Size = new System.Drawing.Size(75, 23);
            this.cmdCancelar.TabIndex = 10;
            this.cmdCancelar.Text = "Cancelar";
            this.cmdCancelar.UseVisualStyleBackColor = true;
            this.cmdCancelar.Click += new System.EventHandler(this.cmdCancelar_Click);
            // 
            // lblVerifica
            // 
            this.lblVerifica.AutoSize = true;
            this.lblVerifica.BackColor = System.Drawing.Color.Transparent;
            this.lblVerifica.Cursor = System.Windows.Forms.Cursors.Hand;
            this.lblVerifica.Location = new System.Drawing.Point(91, 45);
            this.lblVerifica.Name = "lblVerifica";
            this.lblVerifica.Size = new System.Drawing.Size(112, 13);
            this.lblVerifica.TabIndex = 6;
            this.lblVerifica.TabStop = true;
            this.lblVerifica.Text = "Verificar se disponivel.";
            this.lblVerifica.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.lblVerifica_LinkClicked);
            // 
            // cmdCadastrar
            // 
            this.cmdCadastrar.Location = new System.Drawing.Point(7, 127);
            this.cmdCadastrar.Name = "cmdCadastrar";
            this.cmdCadastrar.Size = new System.Drawing.Size(75, 23);
            this.cmdCadastrar.TabIndex = 9;
            this.cmdCadastrar.Text = "Cadastrar";
            this.cmdCadastrar.UseVisualStyleBackColor = true;
            this.cmdCadastrar.Click += new System.EventHandler(this.cmdCadastrar_Click);
            // 
            // lblSenhaCC
            // 
            this.lblSenhaCC.AutoSize = true;
            this.lblSenhaCC.Location = new System.Drawing.Point(4, 92);
            this.lblSenhaCC.Name = "lblSenhaCC";
            this.lblSenhaCC.Size = new System.Drawing.Size(85, 13);
            this.lblSenhaCC.TabIndex = 23;
            this.lblSenhaCC.Text = "Confirmar Senha";
            // 
            // lblSenhaC
            // 
            this.lblSenhaC.AutoSize = true;
            this.lblSenhaC.Location = new System.Drawing.Point(6, 69);
            this.lblSenhaC.Name = "lblSenhaC";
            this.lblSenhaC.Size = new System.Drawing.Size(38, 13);
            this.lblSenhaC.TabIndex = 22;
            this.lblSenhaC.Text = "Senha";
            // 
            // lblLoginC
            // 
            this.lblLoginC.AutoSize = true;
            this.lblLoginC.Location = new System.Drawing.Point(6, 22);
            this.lblLoginC.Name = "lblLoginC";
            this.lblLoginC.Size = new System.Drawing.Size(33, 13);
            this.lblLoginC.TabIndex = 17;
            this.lblLoginC.Text = "Login";
            // 
            // txtSenhaCC
            // 
            this.txtSenhaCC.Location = new System.Drawing.Point(92, 92);
            this.txtSenhaCC.Name = "txtSenhaCC";
            this.txtSenhaCC.PasswordChar = '*';
            this.txtSenhaCC.Size = new System.Drawing.Size(129, 20);
            this.txtSenhaCC.TabIndex = 8;
            // 
            // txtSenhaC
            // 
            this.txtSenhaC.Location = new System.Drawing.Point(92, 69);
            this.txtSenhaC.Name = "txtSenhaC";
            this.txtSenhaC.PasswordChar = '*';
            this.txtSenhaC.Size = new System.Drawing.Size(129, 20);
            this.txtSenhaC.TabIndex = 7;
            // 
            // txtLoginC
            // 
            this.txtLoginC.Location = new System.Drawing.Point(94, 22);
            this.txtLoginC.Name = "txtLoginC";
            this.txtLoginC.Size = new System.Drawing.Size(227, 20);
            this.txtLoginC.TabIndex = 5;
            // 
            // Principal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(363, 321);
            this.Controls.Add(this.grbCadastro);
            this.Controls.Add(this.grbLogin);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "Principal";
            this.Opacity = 0.95D;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "#Book";
            this.Load += new System.EventHandler(this.Principal_Load);
            this.grbLogin.ResumeLayout(false);
            this.grbLogin.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picLogo)).EndInit();
            this.grbCadastro.ResumeLayout(false);
            this.grbCadastro.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grbLogin;
        private System.Windows.Forms.PictureBox picLogo;
        private System.Windows.Forms.TextBox txtLogin;
        private System.Windows.Forms.Label lblSenha;
        private System.Windows.Forms.Button cmdLogar;
        private System.Windows.Forms.Label lblLogin;
        private System.Windows.Forms.LinkLabel lblCadastro;
        private System.Windows.Forms.Button cmdFechar;
        private System.Windows.Forms.TextBox txtSenha;
        private System.Windows.Forms.GroupBox grbCadastro;
        private System.Windows.Forms.Button cmdCancelar;
        private System.Windows.Forms.LinkLabel lblVerifica;
        private System.Windows.Forms.Button cmdCadastrar;
        private System.Windows.Forms.Label lblSenhaCC;
        private System.Windows.Forms.Label lblSenhaC;
        private System.Windows.Forms.Label lblLoginC;
        private System.Windows.Forms.TextBox txtSenhaCC;
        private System.Windows.Forms.TextBox txtSenhaC;
        private System.Windows.Forms.TextBox txtLoginC;
        private System.Windows.Forms.Label lblStatus;
    }
}

