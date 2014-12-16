namespace CalculadoraComplexa
{
    partial class frmCALCCOMPLEX
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
            this.cmdCLEAR = new System.Windows.Forms.Button();
            this.txtREAL = new System.Windows.Forms.MaskedTextBox();
            this.txtIMG = new System.Windows.Forms.MaskedTextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.cmd7 = new System.Windows.Forms.Button();
            this.cmd4 = new System.Windows.Forms.Button();
            this.cmd1 = new System.Windows.Forms.Button();
            this.cmd0 = new System.Windows.Forms.Button();
            this.cmd2 = new System.Windows.Forms.Button();
            this.cmd5 = new System.Windows.Forms.Button();
            this.cmd8 = new System.Windows.Forms.Button();
            this.cmdVIRGULA = new System.Windows.Forms.Button();
            this.cmd3 = new System.Windows.Forms.Button();
            this.cmd6 = new System.Windows.Forms.Button();
            this.cmd9 = new System.Windows.Forms.Button();
            this.cmdMULTI = new System.Windows.Forms.Button();
            this.cmdSUB = new System.Windows.Forms.Button();
            this.cmdSOMA = new System.Windows.Forms.Button();
            this.Dividir = new System.Windows.Forms.Button();
            this.cmdIE = new System.Windows.Forms.Button();
            this.cmdRE = new System.Windows.Forms.Button();
            this.cmdSETA = new System.Windows.Forms.Button();
            this.txtRESULT = new System.Windows.Forms.MaskedTextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cmdIGUAL = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // cmdCLEAR
            // 
            this.cmdCLEAR.AccessibleDescription = "SDFSDF";
            this.cmdCLEAR.Location = new System.Drawing.Point(12, 57);
            this.cmdCLEAR.Name = "cmdCLEAR";
            this.cmdCLEAR.Size = new System.Drawing.Size(29, 28);
            this.cmdCLEAR.TabIndex = 0;
            this.cmdCLEAR.Text = "C";
            this.cmdCLEAR.UseVisualStyleBackColor = true;
            this.cmdCLEAR.Click += new System.EventHandler(this.limparT);
            // 
            // txtREAL
            // 
            this.txtREAL.Location = new System.Drawing.Point(12, 22);
            this.txtREAL.Name = "txtREAL";
            this.txtREAL.PromptChar = '-';
            this.txtREAL.Size = new System.Drawing.Size(126, 20);
            this.txtREAL.TabIndex = 16;
            this.txtREAL.Text = "0";
            this.txtREAL.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtREAL.Click += new System.EventHandler(this.txtREAL_Click);
            this.txtREAL.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtREAL_KeyPress);
            this.txtREAL.KeyUp += new System.Windows.Forms.KeyEventHandler(this.txtREAL_KeyUp);
            // 
            // txtIMG
            // 
            this.txtIMG.CutCopyMaskFormat = System.Windows.Forms.MaskFormat.ExcludePromptAndLiterals;
            this.txtIMG.Location = new System.Drawing.Point(154, 22);
            this.txtIMG.Name = "txtIMG";
            this.txtIMG.PromptChar = '-';
            this.txtIMG.Size = new System.Drawing.Size(126, 20);
            this.txtIMG.TabIndex = 17;
            this.txtIMG.Text = "0";
            this.txtIMG.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtIMG.TextMaskFormat = System.Windows.Forms.MaskFormat.ExcludePromptAndLiterals;
            this.txtIMG.Click += new System.EventHandler(this.txtIMG_Click);
            this.txtIMG.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtIMG_KeyPress);
            this.txtIMG.KeyUp += new System.Windows.Forms.KeyEventHandler(this.txtIMG_KeyUp);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(144, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(9, 13);
            this.label1.TabIndex = 18;
            this.label1.Text = "i";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 6);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(29, 13);
            this.label2.TabIndex = 19;
            this.label2.Text = "Real";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(151, 6);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(55, 13);
            this.label3.TabIndex = 20;
            this.label3.Text = "Imaginária";
            // 
            // cmd7
            // 
            this.cmd7.Location = new System.Drawing.Point(12, 91);
            this.cmd7.Name = "cmd7";
            this.cmd7.Size = new System.Drawing.Size(29, 28);
            this.cmd7.TabIndex = 21;
            this.cmd7.Text = "7";
            this.cmd7.UseVisualStyleBackColor = true;
            this.cmd7.Click += new System.EventHandler(this.cmd7_Click);
            // 
            // cmd4
            // 
            this.cmd4.Location = new System.Drawing.Point(12, 125);
            this.cmd4.Name = "cmd4";
            this.cmd4.Size = new System.Drawing.Size(29, 28);
            this.cmd4.TabIndex = 22;
            this.cmd4.Text = "4";
            this.cmd4.UseVisualStyleBackColor = true;
            this.cmd4.Click += new System.EventHandler(this.cmd4_Click);
            // 
            // cmd1
            // 
            this.cmd1.Location = new System.Drawing.Point(12, 159);
            this.cmd1.Name = "cmd1";
            this.cmd1.Size = new System.Drawing.Size(29, 28);
            this.cmd1.TabIndex = 23;
            this.cmd1.Text = "1";
            this.cmd1.UseVisualStyleBackColor = true;
            this.cmd1.Click += new System.EventHandler(this.cmd1_Click);
            // 
            // cmd0
            // 
            this.cmd0.Location = new System.Drawing.Point(12, 193);
            this.cmd0.Name = "cmd0";
            this.cmd0.Size = new System.Drawing.Size(64, 28);
            this.cmd0.TabIndex = 24;
            this.cmd0.Text = "0";
            this.cmd0.UseVisualStyleBackColor = true;
            this.cmd0.Click += new System.EventHandler(this.cmd0_Click);
            // 
            // cmd2
            // 
            this.cmd2.Location = new System.Drawing.Point(47, 159);
            this.cmd2.Name = "cmd2";
            this.cmd2.Size = new System.Drawing.Size(29, 28);
            this.cmd2.TabIndex = 27;
            this.cmd2.Text = "2";
            this.cmd2.UseVisualStyleBackColor = true;
            this.cmd2.Click += new System.EventHandler(this.cmd2_Click);
            // 
            // cmd5
            // 
            this.cmd5.Location = new System.Drawing.Point(47, 125);
            this.cmd5.Name = "cmd5";
            this.cmd5.Size = new System.Drawing.Size(29, 28);
            this.cmd5.TabIndex = 26;
            this.cmd5.Text = "5";
            this.cmd5.UseVisualStyleBackColor = true;
            this.cmd5.Click += new System.EventHandler(this.cmd5_Click);
            // 
            // cmd8
            // 
            this.cmd8.Location = new System.Drawing.Point(47, 91);
            this.cmd8.Name = "cmd8";
            this.cmd8.Size = new System.Drawing.Size(29, 28);
            this.cmd8.TabIndex = 25;
            this.cmd8.Text = "8";
            this.cmd8.UseVisualStyleBackColor = true;
            this.cmd8.Click += new System.EventHandler(this.cmd8_Click);
            // 
            // cmdVIRGULA
            // 
            this.cmdVIRGULA.Location = new System.Drawing.Point(82, 193);
            this.cmdVIRGULA.Name = "cmdVIRGULA";
            this.cmdVIRGULA.Size = new System.Drawing.Size(29, 28);
            this.cmdVIRGULA.TabIndex = 32;
            this.cmdVIRGULA.Text = ",";
            this.cmdVIRGULA.UseVisualStyleBackColor = true;
            // 
            // cmd3
            // 
            this.cmd3.Location = new System.Drawing.Point(82, 159);
            this.cmd3.Name = "cmd3";
            this.cmd3.Size = new System.Drawing.Size(29, 28);
            this.cmd3.TabIndex = 31;
            this.cmd3.Text = "3";
            this.cmd3.UseVisualStyleBackColor = true;
            this.cmd3.Click += new System.EventHandler(this.cmd3_Click);
            // 
            // cmd6
            // 
            this.cmd6.Location = new System.Drawing.Point(82, 125);
            this.cmd6.Name = "cmd6";
            this.cmd6.Size = new System.Drawing.Size(29, 28);
            this.cmd6.TabIndex = 30;
            this.cmd6.Text = "6";
            this.cmd6.UseVisualStyleBackColor = true;
            this.cmd6.Click += new System.EventHandler(this.cmd6_Click);
            // 
            // cmd9
            // 
            this.cmd9.Location = new System.Drawing.Point(82, 91);
            this.cmd9.Name = "cmd9";
            this.cmd9.Size = new System.Drawing.Size(29, 28);
            this.cmd9.TabIndex = 29;
            this.cmd9.Text = "9";
            this.cmd9.UseVisualStyleBackColor = true;
            this.cmd9.Click += new System.EventHandler(this.cmd9_Click);
            // 
            // cmdMULTI
            // 
            this.cmdMULTI.Location = new System.Drawing.Point(124, 159);
            this.cmdMULTI.Name = "cmdMULTI";
            this.cmdMULTI.Size = new System.Drawing.Size(29, 28);
            this.cmdMULTI.TabIndex = 36;
            this.cmdMULTI.Text = "*";
            this.cmdMULTI.UseVisualStyleBackColor = true;
            this.cmdMULTI.Click += new System.EventHandler(this.cmdMULTI_Click);
            // 
            // cmdSUB
            // 
            this.cmdSUB.Location = new System.Drawing.Point(124, 125);
            this.cmdSUB.Name = "cmdSUB";
            this.cmdSUB.Size = new System.Drawing.Size(29, 28);
            this.cmdSUB.TabIndex = 35;
            this.cmdSUB.Text = "-";
            this.cmdSUB.UseVisualStyleBackColor = true;
            this.cmdSUB.Click += new System.EventHandler(this.cmdSUB_Click);
            // 
            // cmdSOMA
            // 
            this.cmdSOMA.Location = new System.Drawing.Point(124, 91);
            this.cmdSOMA.Name = "cmdSOMA";
            this.cmdSOMA.Size = new System.Drawing.Size(29, 28);
            this.cmdSOMA.TabIndex = 34;
            this.cmdSOMA.Text = "+";
            this.cmdSOMA.UseVisualStyleBackColor = true;
            this.cmdSOMA.Click += new System.EventHandler(this.cmdSOMA_Click);
            // 
            // Dividir
            // 
            this.Dividir.Location = new System.Drawing.Point(159, 91);
            this.Dividir.Name = "Dividir";
            this.Dividir.Size = new System.Drawing.Size(29, 28);
            this.Dividir.TabIndex = 37;
            this.Dividir.Text = "/";
            this.Dividir.UseVisualStyleBackColor = true;
            // 
            // cmdIE
            // 
            this.cmdIE.Location = new System.Drawing.Point(159, 125);
            this.cmdIE.Name = "cmdIE";
            this.cmdIE.Size = new System.Drawing.Size(29, 28);
            this.cmdIE.TabIndex = 38;
            this.cmdIE.Text = "i^x";
            this.cmdIE.UseVisualStyleBackColor = true;
            // 
            // cmdRE
            // 
            this.cmdRE.Location = new System.Drawing.Point(159, 159);
            this.cmdRE.Name = "cmdRE";
            this.cmdRE.Size = new System.Drawing.Size(29, 28);
            this.cmdRE.TabIndex = 39;
            this.cmdRE.Text = "r^x";
            this.cmdRE.UseVisualStyleBackColor = true;
            // 
            // cmdSETA
            // 
            this.cmdSETA.Location = new System.Drawing.Point(47, 57);
            this.cmdSETA.Name = "cmdSETA";
            this.cmdSETA.Size = new System.Drawing.Size(29, 28);
            this.cmdSETA.TabIndex = 40;
            this.cmdSETA.Text = "<-";
            this.cmdSETA.UseVisualStyleBackColor = true;
            this.cmdSETA.Click += new System.EventHandler(this.cmdSETA_Click);
            // 
            // txtRESULT
            // 
            this.txtRESULT.Enabled = false;
            this.txtRESULT.Location = new System.Drawing.Point(70, 241);
            this.txtRESULT.Name = "txtRESULT";
            this.txtRESULT.PromptChar = '-';
            this.txtRESULT.Size = new System.Drawing.Size(210, 20);
            this.txtRESULT.TabIndex = 41;
            this.txtRESULT.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(9, 241);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(55, 13);
            this.label4.TabIndex = 42;
            this.label4.Text = "Resultado";
            // 
            // cmdIGUAL
            // 
            this.cmdIGUAL.Location = new System.Drawing.Point(124, 193);
            this.cmdIGUAL.Name = "cmdIGUAL";
            this.cmdIGUAL.Size = new System.Drawing.Size(64, 28);
            this.cmdIGUAL.TabIndex = 43;
            this.cmdIGUAL.Text = "=";
            this.cmdIGUAL.UseVisualStyleBackColor = true;
            this.cmdIGUAL.Click += new System.EventHandler(this.cmdIGUAL_Click);
            // 
            // frmCALCCOMPLEX
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 270);
            this.Controls.Add(this.cmdIGUAL);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtRESULT);
            this.Controls.Add(this.cmdSETA);
            this.Controls.Add(this.cmdRE);
            this.Controls.Add(this.cmdIE);
            this.Controls.Add(this.Dividir);
            this.Controls.Add(this.cmdMULTI);
            this.Controls.Add(this.cmdSUB);
            this.Controls.Add(this.cmdSOMA);
            this.Controls.Add(this.cmdVIRGULA);
            this.Controls.Add(this.cmd3);
            this.Controls.Add(this.cmd6);
            this.Controls.Add(this.cmd9);
            this.Controls.Add(this.cmd2);
            this.Controls.Add(this.cmd5);
            this.Controls.Add(this.cmd8);
            this.Controls.Add(this.cmd0);
            this.Controls.Add(this.cmd1);
            this.Controls.Add(this.cmd4);
            this.Controls.Add(this.cmd7);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtIMG);
            this.Controls.Add(this.txtREAL);
            this.Controls.Add(this.cmdCLEAR);
            this.Name = "frmCALCCOMPLEX";
            this.Text = "Calculadora Complexa";
            this.Load += new System.EventHandler(this.frmCALCCOMPLEX_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button cmdCLEAR;
        private System.Windows.Forms.MaskedTextBox txtREAL;
        private System.Windows.Forms.MaskedTextBox txtIMG;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button cmd7;
        private System.Windows.Forms.Button cmd4;
        private System.Windows.Forms.Button cmd1;
        private System.Windows.Forms.Button cmd0;
        private System.Windows.Forms.Button cmd2;
        private System.Windows.Forms.Button cmd5;
        private System.Windows.Forms.Button cmd8;
        private System.Windows.Forms.Button cmdVIRGULA;
        private System.Windows.Forms.Button cmd3;
        private System.Windows.Forms.Button cmd6;
        private System.Windows.Forms.Button cmd9;
        private System.Windows.Forms.Button cmdMULTI;
        private System.Windows.Forms.Button cmdSUB;
        private System.Windows.Forms.Button cmdSOMA;
        private System.Windows.Forms.Button Dividir;
        private System.Windows.Forms.Button cmdIE;
        private System.Windows.Forms.Button cmdRE;
        private System.Windows.Forms.Button cmdSETA;
        private System.Windows.Forms.MaskedTextBox txtRESULT;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button cmdIGUAL;
    }
}

