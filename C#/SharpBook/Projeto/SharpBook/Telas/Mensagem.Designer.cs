namespace SharpBook.Telas
{
    partial class Mensagem
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
            this.lblLogin = new System.Windows.Forms.Label();
            this.txtAssunto = new System.Windows.Forms.TextBox();
            this.txtMSG = new System.Windows.Forms.TextBox();
            this.boxFilmes = new System.Windows.Forms.GroupBox();
            this.lblDEPARA = new System.Windows.Forms.Label();
            this.txtPara = new System.Windows.Forms.TextBox();
            this.btnEnviar = new System.Windows.Forms.Button();
            this.lblReco = new System.Windows.Forms.LinkLabel();
            this.txtFilme = new System.Windows.Forms.TextBox();
            this.lblACC = new System.Windows.Forms.LinkLabel();
            this.SuspendLayout();
            // 
            // lblLogin
            // 
            this.lblLogin.AutoSize = true;
            this.lblLogin.Location = new System.Drawing.Point(27, 44);
            this.lblLogin.Name = "lblLogin";
            this.lblLogin.Size = new System.Drawing.Size(45, 13);
            this.lblLogin.TabIndex = 32;
            this.lblLogin.Text = "Assunto";
            // 
            // txtAssunto
            // 
            this.txtAssunto.Location = new System.Drawing.Point(90, 44);
            this.txtAssunto.Name = "txtAssunto";
            this.txtAssunto.Size = new System.Drawing.Size(180, 20);
            this.txtAssunto.TabIndex = 1;
            // 
            // txtMSG
            // 
            this.txtMSG.Location = new System.Drawing.Point(30, 97);
            this.txtMSG.Multiline = true;
            this.txtMSG.Name = "txtMSG";
            this.txtMSG.Size = new System.Drawing.Size(240, 143);
            this.txtMSG.TabIndex = 2;
            // 
            // boxFilmes
            // 
            this.boxFilmes.Location = new System.Drawing.Point(23, 79);
            this.boxFilmes.Name = "boxFilmes";
            this.boxFilmes.Size = new System.Drawing.Size(262, 170);
            this.boxFilmes.TabIndex = 35;
            this.boxFilmes.TabStop = false;
            this.boxFilmes.Text = "Mensagem";
            this.boxFilmes.Visible = false;
            // 
            // lblDEPARA
            // 
            this.lblDEPARA.AutoSize = true;
            this.lblDEPARA.Location = new System.Drawing.Point(27, 12);
            this.lblDEPARA.Name = "lblDEPARA";
            this.lblDEPARA.Size = new System.Drawing.Size(48, 13);
            this.lblDEPARA.TabIndex = 37;
            this.lblDEPARA.Text = "De/Para";
            // 
            // txtPara
            // 
            this.txtPara.Location = new System.Drawing.Point(90, 9);
            this.txtPara.Name = "txtPara";
            this.txtPara.Size = new System.Drawing.Size(180, 20);
            this.txtPara.TabIndex = 1;
            // 
            // btnEnviar
            // 
            this.btnEnviar.Location = new System.Drawing.Point(195, 310);
            this.btnEnviar.Name = "btnEnviar";
            this.btnEnviar.Size = new System.Drawing.Size(75, 23);
            this.btnEnviar.TabIndex = 3;
            this.btnEnviar.Text = "Enviar";
            this.btnEnviar.UseVisualStyleBackColor = true;
            this.btnEnviar.Click += new System.EventHandler(this.btnEnviar_Click);
            // 
            // lblReco
            // 
            this.lblReco.AutoSize = true;
            this.lblReco.Location = new System.Drawing.Point(25, 257);
            this.lblReco.Name = "lblReco";
            this.lblReco.Size = new System.Drawing.Size(68, 13);
            this.lblReco.TabIndex = 38;
            this.lblReco.TabStop = true;
            this.lblReco.Text = "Recomendar";
            this.lblReco.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.lblADD_LinkClicked);
            // 
            // txtFilme
            // 
            this.txtFilme.Location = new System.Drawing.Point(28, 275);
            this.txtFilme.Name = "txtFilme";
            this.txtFilme.ReadOnly = true;
            this.txtFilme.Size = new System.Drawing.Size(242, 20);
            this.txtFilme.TabIndex = 39;
            // 
            // lblACC
            // 
            this.lblACC.AutoSize = true;
            this.lblACC.Location = new System.Drawing.Point(27, 258);
            this.lblACC.Name = "lblACC";
            this.lblACC.Size = new System.Drawing.Size(119, 13);
            this.lblACC.TabIndex = 40;
            this.lblACC.TabStop = true;
            this.lblACC.Text = "Aceitar Recomendacao";
            this.lblACC.Visible = false;
            this.lblACC.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabel1_LinkClicked);
            // 
            // Mensagem
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(288, 345);
            this.Controls.Add(this.lblACC);
            this.Controls.Add(this.txtFilme);
            this.Controls.Add(this.lblReco);
            this.Controls.Add(this.btnEnviar);
            this.Controls.Add(this.lblDEPARA);
            this.Controls.Add(this.txtPara);
            this.Controls.Add(this.txtMSG);
            this.Controls.Add(this.lblLogin);
            this.Controls.Add(this.txtAssunto);
            this.Controls.Add(this.boxFilmes);
            this.Name = "Mensagem";
            this.Text = "Mensagem";
            this.Load += new System.EventHandler(this.Mensagem_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblLogin;
        private System.Windows.Forms.TextBox txtAssunto;
        private System.Windows.Forms.TextBox txtMSG;
        private System.Windows.Forms.GroupBox boxFilmes;
        private System.Windows.Forms.Label lblDEPARA;
        private System.Windows.Forms.TextBox txtPara;
        private System.Windows.Forms.Button btnEnviar;
        private System.Windows.Forms.LinkLabel lblReco;
        private System.Windows.Forms.TextBox txtFilme;
        private System.Windows.Forms.LinkLabel lblACC;
    }
}