namespace WFormTeste
{
    partial class WTeste
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
            this.Imagem = new System.Windows.Forms.PictureBox();
            this.cmdPLAY = new System.Windows.Forms.Button();
            this.cmdPARAR = new System.Windows.Forms.Button();
            this.txtANGULO = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtVELOC = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtNBol = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.Imagem)).BeginInit();
            this.SuspendLayout();
            // 
            // Imagem
            // 
            this.Imagem.BackColor = System.Drawing.Color.White;
            this.Imagem.Location = new System.Drawing.Point(12, 12);
            this.Imagem.Name = "Imagem";
            this.Imagem.Size = new System.Drawing.Size(600, 600);
            this.Imagem.TabIndex = 0;
            this.Imagem.TabStop = false;
            // 
            // cmdPLAY
            // 
            this.cmdPLAY.Location = new System.Drawing.Point(537, 618);
            this.cmdPLAY.Name = "cmdPLAY";
            this.cmdPLAY.Size = new System.Drawing.Size(75, 23);
            this.cmdPLAY.TabIndex = 1;
            this.cmdPLAY.Text = "Play";
            this.cmdPLAY.UseVisualStyleBackColor = true;
            this.cmdPLAY.Click += new System.EventHandler(this.cmdPLAY_Click);
            // 
            // cmdPARAR
            // 
            this.cmdPARAR.Location = new System.Drawing.Point(456, 618);
            this.cmdPARAR.Name = "cmdPARAR";
            this.cmdPARAR.Size = new System.Drawing.Size(75, 23);
            this.cmdPARAR.TabIndex = 2;
            this.cmdPARAR.Text = "Parar";
            this.cmdPARAR.UseVisualStyleBackColor = true;
            this.cmdPARAR.Click += new System.EventHandler(this.cmdPARAR_Click);
            // 
            // txtANGULO
            // 
            this.txtANGULO.Location = new System.Drawing.Point(273, 615);
            this.txtANGULO.Name = "txtANGULO";
            this.txtANGULO.Size = new System.Drawing.Size(34, 20);
            this.txtANGULO.TabIndex = 3;
            this.txtANGULO.Text = "90";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(227, 618);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(40, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Angulo";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(315, 618);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(60, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Velocidade";
            // 
            // txtVELOC
            // 
            this.txtVELOC.Location = new System.Drawing.Point(381, 617);
            this.txtVELOC.Name = "txtVELOC";
            this.txtVELOC.Size = new System.Drawing.Size(60, 20);
            this.txtVELOC.TabIndex = 5;
            this.txtVELOC.Text = "10";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(122, 621);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(59, 13);
            this.label3.TabIndex = 8;
            this.label3.Text = "NºBolinhas";
            // 
            // txtNBol
            // 
            this.txtNBol.Location = new System.Drawing.Point(187, 618);
            this.txtNBol.Name = "txtNBol";
            this.txtNBol.Size = new System.Drawing.Size(34, 20);
            this.txtNBol.TabIndex = 7;
            this.txtNBol.Text = "1";
            // 
            // WTeste
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(619, 645);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtNBol);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtVELOC);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtANGULO);
            this.Controls.Add(this.cmdPARAR);
            this.Controls.Add(this.cmdPLAY);
            this.Controls.Add(this.Imagem);
            this.Name = "WTeste";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.WTeste_Load);
            this.MouseDown += new System.Windows.Forms.MouseEventHandler(this.WTeste_MouseDown);
            this.MouseUp += new System.Windows.Forms.MouseEventHandler(this.WTeste_MouseUp);
            ((System.ComponentModel.ISupportInitialize)(this.Imagem)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox Imagem;
        private System.Windows.Forms.Button cmdPLAY;
        private System.Windows.Forms.Button cmdPARAR;
        private System.Windows.Forms.TextBox txtANGULO;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtVELOC;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtNBol;
    }
}

