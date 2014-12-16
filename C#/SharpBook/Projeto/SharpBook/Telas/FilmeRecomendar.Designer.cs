namespace SharpBook.Telas
{
    partial class FilmeRecomendar
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
            this.radioAtores = new System.Windows.Forms.RadioButton();
            this.radioNome = new System.Windows.Forms.RadioButton();
            this.txtBuscar = new System.Windows.Forms.TextBox();
            this.btnSelecionar = new System.Windows.Forms.Button();
            this.grid = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.grid)).BeginInit();
            this.SuspendLayout();
            // 
            // radioAtores
            // 
            this.radioAtores.AutoSize = true;
            this.radioAtores.Location = new System.Drawing.Point(103, 9);
            this.radioAtores.Name = "radioAtores";
            this.radioAtores.Size = new System.Drawing.Size(55, 17);
            this.radioAtores.TabIndex = 29;
            this.radioAtores.TabStop = true;
            this.radioAtores.Text = "Atores";
            this.radioAtores.UseVisualStyleBackColor = true;
            // 
            // radioNome
            // 
            this.radioNome.AutoSize = true;
            this.radioNome.Checked = true;
            this.radioNome.Location = new System.Drawing.Point(36, 9);
            this.radioNome.Name = "radioNome";
            this.radioNome.Size = new System.Drawing.Size(53, 17);
            this.radioNome.TabIndex = 28;
            this.radioNome.TabStop = true;
            this.radioNome.Text = "Nome";
            this.radioNome.UseVisualStyleBackColor = true;
            // 
            // txtBuscar
            // 
            this.txtBuscar.Location = new System.Drawing.Point(173, 9);
            this.txtBuscar.Name = "txtBuscar";
            this.txtBuscar.Size = new System.Drawing.Size(180, 20);
            this.txtBuscar.TabIndex = 27;
            this.txtBuscar.TextChanged += new System.EventHandler(this.txtBuscar_TextChanged);
            // 
            // btnSelecionar
            // 
            this.btnSelecionar.Location = new System.Drawing.Point(12, 432);
            this.btnSelecionar.Name = "btnSelecionar";
            this.btnSelecionar.Size = new System.Drawing.Size(91, 23);
            this.btnSelecionar.TabIndex = 26;
            this.btnSelecionar.Text = "Selecionar";
            this.btnSelecionar.UseVisualStyleBackColor = true;
            this.btnSelecionar.Click += new System.EventHandler(this.btnSelecionar_Click);
            // 
            // grid
            // 
            this.grid.BackgroundColor = System.Drawing.Color.White;
            this.grid.GridColor = System.Drawing.Color.White;
            this.grid.Location = new System.Drawing.Point(13, 45);
            this.grid.MultiSelect = false;
            this.grid.Name = "grid";
            this.grid.RowHeadersVisible = false;
            this.grid.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.grid.Size = new System.Drawing.Size(387, 375);
            this.grid.TabIndex = 25;
            this.grid.DoubleClick += new System.EventHandler(this.btnSelecionar_Click);
            // 
            // FilmeRecomendar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(412, 462);
            this.Controls.Add(this.radioAtores);
            this.Controls.Add(this.radioNome);
            this.Controls.Add(this.txtBuscar);
            this.Controls.Add(this.btnSelecionar);
            this.Controls.Add(this.grid);
            this.Name = "FilmeRecomendar";
            this.Text = "FilmeRecomendar";
            this.Load += new System.EventHandler(this.FilmeRecomendar_Load);
            ((System.ComponentModel.ISupportInitialize)(this.grid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.RadioButton radioAtores;
        private System.Windows.Forms.RadioButton radioNome;
        private System.Windows.Forms.TextBox txtBuscar;
        private System.Windows.Forms.Button btnSelecionar;
        private System.Windows.Forms.DataGridView grid;
    }
}