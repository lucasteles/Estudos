namespace SharpBook.Telas
{
    partial class EditPerfil
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
            this.pcbFoto = new System.Windows.Forms.PictureBox();
            this.txtNome = new System.Windows.Forms.TextBox();
            this.lnkFoto = new System.Windows.Forms.LinkLabel();
            this.lblNome = new System.Windows.Forms.Label();
            this.lblSobreNome = new System.Windows.Forms.Label();
            this.txtSobreNome = new System.Windows.Forms.TextBox();
            this.dtpAniver = new System.Windows.Forms.DateTimePicker();
            this.lblAniver = new System.Windows.Forms.Label();
            this.lblCidade = new System.Windows.Forms.Label();
            this.txtCidade = new System.Windows.Forms.TextBox();
            this.lblEstado = new System.Windows.Forms.Label();
            this.txtEstado = new System.Windows.Forms.TextBox();
            this.cmdSalvar = new System.Windows.Forms.Button();
            this.cmdCancelar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pcbFoto)).BeginInit();
            this.SuspendLayout();
            // 
            // pcbFoto
            // 
            this.pcbFoto.BackColor = System.Drawing.Color.White;
            this.pcbFoto.Location = new System.Drawing.Point(12, 12);
            this.pcbFoto.Name = "pcbFoto";
            this.pcbFoto.Size = new System.Drawing.Size(140, 140);
            this.pcbFoto.TabIndex = 0;
            this.pcbFoto.TabStop = false;
            // 
            // txtNome
            // 
            this.txtNome.Location = new System.Drawing.Point(224, 14);
            this.txtNome.Name = "txtNome";
            this.txtNome.Size = new System.Drawing.Size(233, 20);
            this.txtNome.TabIndex = 0;
            // 
            // lnkFoto
            // 
            this.lnkFoto.AutoSize = true;
            this.lnkFoto.Location = new System.Drawing.Point(9, 155);
            this.lnkFoto.Name = "lnkFoto";
            this.lnkFoto.Size = new System.Drawing.Size(58, 13);
            this.lnkFoto.TabIndex = 8;
            this.lnkFoto.TabStop = true;
            this.lnkFoto.Text = "Mudar foto";
            this.lnkFoto.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.lnkFoto_LinkClicked);
            // 
            // lblNome
            // 
            this.lblNome.AutoSize = true;
            this.lblNome.Location = new System.Drawing.Point(159, 13);
            this.lblNome.Name = "lblNome";
            this.lblNome.Size = new System.Drawing.Size(35, 13);
            this.lblNome.TabIndex = 3;
            this.lblNome.Text = "Nome";
            // 
            // lblSobreNome
            // 
            this.lblSobreNome.AutoSize = true;
            this.lblSobreNome.Location = new System.Drawing.Point(159, 39);
            this.lblSobreNome.Name = "lblSobreNome";
            this.lblSobreNome.Size = new System.Drawing.Size(66, 13);
            this.lblSobreNome.TabIndex = 5;
            this.lblSobreNome.Text = "Sobre Nome";
            // 
            // txtSobreNome
            // 
            this.txtSobreNome.Location = new System.Drawing.Point(224, 40);
            this.txtSobreNome.Name = "txtSobreNome";
            this.txtSobreNome.Size = new System.Drawing.Size(233, 20);
            this.txtSobreNome.TabIndex = 1;
            // 
            // dtpAniver
            // 
            this.dtpAniver.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpAniver.Location = new System.Drawing.Point(224, 66);
            this.dtpAniver.Name = "dtpAniver";
            this.dtpAniver.Size = new System.Drawing.Size(95, 20);
            this.dtpAniver.TabIndex = 3;
            // 
            // lblAniver
            // 
            this.lblAniver.AutoSize = true;
            this.lblAniver.Location = new System.Drawing.Point(159, 66);
            this.lblAniver.Name = "lblAniver";
            this.lblAniver.Size = new System.Drawing.Size(59, 13);
            this.lblAniver.TabIndex = 7;
            this.lblAniver.Text = "Aniversário";
            // 
            // lblCidade
            // 
            this.lblCidade.AutoSize = true;
            this.lblCidade.Location = new System.Drawing.Point(159, 92);
            this.lblCidade.Name = "lblCidade";
            this.lblCidade.Size = new System.Drawing.Size(40, 13);
            this.lblCidade.TabIndex = 9;
            this.lblCidade.Text = "Cidade";
            // 
            // txtCidade
            // 
            this.txtCidade.Location = new System.Drawing.Point(200, 92);
            this.txtCidade.Name = "txtCidade";
            this.txtCidade.Size = new System.Drawing.Size(183, 20);
            this.txtCidade.TabIndex = 4;
            // 
            // lblEstado
            // 
            this.lblEstado.AutoSize = true;
            this.lblEstado.Location = new System.Drawing.Point(389, 92);
            this.lblEstado.Name = "lblEstado";
            this.lblEstado.Size = new System.Drawing.Size(21, 13);
            this.lblEstado.TabIndex = 11;
            this.lblEstado.Text = "UF";
            // 
            // txtEstado
            // 
            this.txtEstado.Location = new System.Drawing.Point(416, 92);
            this.txtEstado.Name = "txtEstado";
            this.txtEstado.Size = new System.Drawing.Size(41, 20);
            this.txtEstado.TabIndex = 5;
            // 
            // cmdSalvar
            // 
            this.cmdSalvar.Location = new System.Drawing.Point(301, 138);
            this.cmdSalvar.Name = "cmdSalvar";
            this.cmdSalvar.Size = new System.Drawing.Size(75, 23);
            this.cmdSalvar.TabIndex = 6;
            this.cmdSalvar.Text = "Salvar";
            this.cmdSalvar.UseVisualStyleBackColor = true;
            this.cmdSalvar.Click += new System.EventHandler(this.cmdSalvar_Click);
            // 
            // cmdCancelar
            // 
            this.cmdCancelar.Location = new System.Drawing.Point(382, 138);
            this.cmdCancelar.Name = "cmdCancelar";
            this.cmdCancelar.Size = new System.Drawing.Size(75, 23);
            this.cmdCancelar.TabIndex = 7;
            this.cmdCancelar.Text = "Cancelar";
            this.cmdCancelar.UseVisualStyleBackColor = true;
            this.cmdCancelar.Click += new System.EventHandler(this.cmdCancelar_Click);
            // 
            // EditPerfil
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(464, 173);
            this.Controls.Add(this.cmdCancelar);
            this.Controls.Add(this.cmdSalvar);
            this.Controls.Add(this.lblEstado);
            this.Controls.Add(this.txtEstado);
            this.Controls.Add(this.lblCidade);
            this.Controls.Add(this.txtCidade);
            this.Controls.Add(this.lblAniver);
            this.Controls.Add(this.dtpAniver);
            this.Controls.Add(this.lblSobreNome);
            this.Controls.Add(this.txtSobreNome);
            this.Controls.Add(this.lblNome);
            this.Controls.Add(this.lnkFoto);
            this.Controls.Add(this.txtNome);
            this.Controls.Add(this.pcbFoto);
            this.Name = "EditPerfil";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "EditPerfil";
            ((System.ComponentModel.ISupportInitialize)(this.pcbFoto)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pcbFoto;
        private System.Windows.Forms.TextBox txtNome;
        private System.Windows.Forms.LinkLabel lnkFoto;
        private System.Windows.Forms.Label lblNome;
        private System.Windows.Forms.Label lblSobreNome;
        private System.Windows.Forms.TextBox txtSobreNome;
        private System.Windows.Forms.DateTimePicker dtpAniver;
        private System.Windows.Forms.Label lblAniver;
        private System.Windows.Forms.Label lblCidade;
        private System.Windows.Forms.TextBox txtCidade;
        private System.Windows.Forms.Label lblEstado;
        private System.Windows.Forms.TextBox txtEstado;
        private System.Windows.Forms.Button cmdSalvar;
        private System.Windows.Forms.Button cmdCancelar;
    }
}