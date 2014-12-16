namespace SharpBook.Telas
{
    partial class BuscaPerfils
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
            this.gridAmigos = new System.Windows.Forms.DataGridView();
            this.btnSelecionar = new System.Windows.Forms.Button();
            this.txtBuscar = new System.Windows.Forms.TextBox();
            this.radioLogin = new System.Windows.Forms.RadioButton();
            this.radioNome = new System.Windows.Forms.RadioButton();
            ((System.ComponentModel.ISupportInitialize)(this.gridAmigos)).BeginInit();
            this.SuspendLayout();
            // 
            // gridAmigos
            // 
            this.gridAmigos.BackgroundColor = System.Drawing.Color.White;
            this.gridAmigos.GridColor = System.Drawing.Color.White;
            this.gridAmigos.Location = new System.Drawing.Point(12, 46);
            this.gridAmigos.MultiSelect = false;
            this.gridAmigos.Name = "gridAmigos";
            this.gridAmigos.RowHeadersVisible = false;
            this.gridAmigos.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.gridAmigos.Size = new System.Drawing.Size(377, 383);
            this.gridAmigos.TabIndex = 11;
            this.gridAmigos.DoubleClick += new System.EventHandler(this.btnSelecionar_Click);
            // 
            // btnSelecionar
            // 
            this.btnSelecionar.Location = new System.Drawing.Point(12, 435);
            this.btnSelecionar.Name = "btnSelecionar";
            this.btnSelecionar.Size = new System.Drawing.Size(91, 23);
            this.btnSelecionar.TabIndex = 12;
            this.btnSelecionar.Text = "Selecionar";
            this.btnSelecionar.UseVisualStyleBackColor = true;
            this.btnSelecionar.Click += new System.EventHandler(this.btnSelecionar_Click);
            // 
            // txtBuscar
            // 
            this.txtBuscar.Location = new System.Drawing.Point(173, 12);
            this.txtBuscar.Name = "txtBuscar";
            this.txtBuscar.Size = new System.Drawing.Size(180, 20);
            this.txtBuscar.TabIndex = 16;
            this.txtBuscar.TextChanged += new System.EventHandler(this.txtSenha_TextChanged);
            // 
            // radioLogin
            // 
            this.radioLogin.AutoSize = true;
            this.radioLogin.Checked = true;
            this.radioLogin.Location = new System.Drawing.Point(36, 12);
            this.radioLogin.Name = "radioLogin";
            this.radioLogin.Size = new System.Drawing.Size(51, 17);
            this.radioLogin.TabIndex = 18;
            this.radioLogin.TabStop = true;
            this.radioLogin.Text = "Login";
            this.radioLogin.UseVisualStyleBackColor = true;
            // 
            // radioNome
            // 
            this.radioNome.AutoSize = true;
            this.radioNome.Location = new System.Drawing.Point(103, 12);
            this.radioNome.Name = "radioNome";
            this.radioNome.Size = new System.Drawing.Size(53, 17);
            this.radioNome.TabIndex = 19;
            this.radioNome.TabStop = true;
            this.radioNome.Text = "Nome";
            this.radioNome.UseVisualStyleBackColor = true;
            // 
            // BuscaPerfils
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(400, 463);
            this.Controls.Add(this.radioNome);
            this.Controls.Add(this.radioLogin);
            this.Controls.Add(this.txtBuscar);
            this.Controls.Add(this.btnSelecionar);
            this.Controls.Add(this.gridAmigos);
            this.Name = "BuscaPerfils";
            this.Text = "BuscaPerfils";
            this.Load += new System.EventHandler(this.BuscaPerfils_Load);
            ((System.ComponentModel.ISupportInitialize)(this.gridAmigos)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView gridAmigos;
        private System.Windows.Forms.Button btnSelecionar;
        private System.Windows.Forms.TextBox txtBuscar;
        private System.Windows.Forms.RadioButton radioLogin;
        private System.Windows.Forms.RadioButton radioNome;
    }
}