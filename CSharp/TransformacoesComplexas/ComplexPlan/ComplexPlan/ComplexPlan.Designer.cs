namespace ComplexPlan
{
    partial class ComplexPlan
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ComplexPlan));
            this.txtY = new System.Windows.Forms.TextBox();
            this.txtX = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.Imagem1 = new System.Windows.Forms.PictureBox();
            this.Imagem2 = new System.Windows.Forms.PictureBox();
            this.ContextMenu = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.cboREGRAS = new System.Windows.Forms.ComboBox();
            this.cmdLIMPAR = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtX2 = new System.Windows.Forms.TextBox();
            this.txtY2 = new System.Windows.Forms.TextBox();
            this.cmdBROWSERIMG = new System.Windows.Forms.Button();
            this.txtIMAGEM = new System.Windows.Forms.TextBox();
            this.OpenFile = new System.Windows.Forms.OpenFileDialog();
            this.lstCALC = new System.Windows.Forms.ListBox();
            this.cmdADD = new System.Windows.Forms.Button();
            this.cmdREMOVER = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.btnOther = new System.Windows.Forms.Button();
            this.optZ1 = new System.Windows.Forms.RadioButton();
            this.label6 = new System.Windows.Forms.Label();
            this.optZ2 = new System.Windows.Forms.RadioButton();
            this.optZ3 = new System.Windows.Forms.RadioButton();
            this.panel1 = new System.Windows.Forms.Panel();
            this.cmdSALVAR = new System.Windows.Forms.Button();
            this.SaveFile = new System.Windows.Forms.SaveFileDialog();
            this.cboFORMAS = new System.Windows.Forms.ComboBox();
            this.sbarLINHA = new System.Windows.Forms.VScrollBar();
            this.txtLINHA = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.Imagem1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Imagem2)).BeginInit();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtY
            // 
            this.txtY.Enabled = false;
            this.txtY.Location = new System.Drawing.Point(321, 4);
            this.txtY.Name = "txtY";
            this.txtY.Size = new System.Drawing.Size(69, 20);
            this.txtY.TabIndex = 0;
            // 
            // txtX
            // 
            this.txtX.Enabled = false;
            this.txtX.Location = new System.Drawing.Point(226, 4);
            this.txtX.Name = "txtX";
            this.txtX.Size = new System.Drawing.Size(69, 20);
            this.txtX.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Location = new System.Drawing.Point(206, 4);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(14, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "X";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(301, 4);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(14, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Y";
            // 
            // Imagem1
            // 
            this.Imagem1.BackColor = System.Drawing.Color.White;
            this.Imagem1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.Imagem1.ErrorImage = null;
            this.Imagem1.InitialImage = null;
            this.Imagem1.Location = new System.Drawing.Point(30, 30);
            this.Imagem1.Name = "Imagem1";
            this.Imagem1.Size = new System.Drawing.Size(360, 360);
            this.Imagem1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.Imagem1.TabIndex = 4;
            this.Imagem1.TabStop = false;
            this.Imagem1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.Imagem1_MouseDown);
            this.Imagem1.MouseMove += new System.Windows.Forms.MouseEventHandler(this.painel1_MouseMove);
            this.Imagem1.MouseUp += new System.Windows.Forms.MouseEventHandler(this.Imagem1_MouseUp);
            // 
            // Imagem2
            // 
            this.Imagem2.BackColor = System.Drawing.Color.White;
            this.Imagem2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.Imagem2.ContextMenuStrip = this.ContextMenu;
            this.Imagem2.ErrorImage = null;
            this.Imagem2.InitialImage = null;
            this.Imagem2.Location = new System.Drawing.Point(428, 29);
            this.Imagem2.Name = "Imagem2";
            this.Imagem2.Size = new System.Drawing.Size(360, 360);
            this.Imagem2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.Imagem2.TabIndex = 5;
            this.Imagem2.TabStop = false;
            // 
            // ContextMenu
            // 
            this.ContextMenu.Name = "ContextMenu";
            this.ContextMenu.Size = new System.Drawing.Size(61, 4);
            // 
            // cboREGRAS
            // 
            this.cboREGRAS.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboREGRAS.FormattingEnabled = true;
            this.cboREGRAS.Location = new System.Drawing.Point(845, 6);
            this.cboREGRAS.Name = "cboREGRAS";
            this.cboREGRAS.Size = new System.Drawing.Size(146, 21);
            this.cboREGRAS.TabIndex = 6;
            // 
            // cmdLIMPAR
            // 
            this.cmdLIMPAR.BackColor = System.Drawing.Color.LightGray;
            this.cmdLIMPAR.Location = new System.Drawing.Point(30, 2);
            this.cmdLIMPAR.Name = "cmdLIMPAR";
            this.cmdLIMPAR.Size = new System.Drawing.Size(75, 23);
            this.cmdLIMPAR.TabIndex = 7;
            this.cmdLIMPAR.Text = "Clear";
            this.cmdLIMPAR.UseVisualStyleBackColor = false;
            this.cmdLIMPAR.Click += new System.EventHandler(this.cmdLIMPAR_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(692, 4);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(14, 13);
            this.label3.TabIndex = 11;
            this.label3.Text = "Y";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Location = new System.Drawing.Point(597, 4);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(14, 13);
            this.label4.TabIndex = 10;
            this.label4.Text = "X";
            // 
            // txtX2
            // 
            this.txtX2.Enabled = false;
            this.txtX2.Location = new System.Drawing.Point(617, 4);
            this.txtX2.Name = "txtX2";
            this.txtX2.Size = new System.Drawing.Size(69, 20);
            this.txtX2.TabIndex = 9;
            // 
            // txtY2
            // 
            this.txtY2.Enabled = false;
            this.txtY2.Location = new System.Drawing.Point(712, 4);
            this.txtY2.Name = "txtY2";
            this.txtY2.Size = new System.Drawing.Size(69, 20);
            this.txtY2.TabIndex = 8;
            // 
            // cmdBROWSERIMG
            // 
            this.cmdBROWSERIMG.Location = new System.Drawing.Point(367, 392);
            this.cmdBROWSERIMG.Name = "cmdBROWSERIMG";
            this.cmdBROWSERIMG.Size = new System.Drawing.Size(23, 23);
            this.cmdBROWSERIMG.TabIndex = 12;
            this.cmdBROWSERIMG.Text = "...";
            this.cmdBROWSERIMG.UseVisualStyleBackColor = true;
            this.cmdBROWSERIMG.Click += new System.EventHandler(this.cmdBROWSERIMG_Click);
            // 
            // txtIMAGEM
            // 
            this.txtIMAGEM.Enabled = false;
            this.txtIMAGEM.Location = new System.Drawing.Point(30, 396);
            this.txtIMAGEM.Name = "txtIMAGEM";
            this.txtIMAGEM.Size = new System.Drawing.Size(331, 20);
            this.txtIMAGEM.TabIndex = 13;
            // 
            // lstCALC
            // 
            this.lstCALC.FormattingEnabled = true;
            this.lstCALC.Location = new System.Drawing.Point(794, 61);
            this.lstCALC.Name = "lstCALC";
            this.lstCALC.Size = new System.Drawing.Size(197, 329);
            this.lstCALC.TabIndex = 14;
            // 
            // cmdADD
            // 
            this.cmdADD.Location = new System.Drawing.Point(794, 30);
            this.cmdADD.Name = "cmdADD";
            this.cmdADD.Size = new System.Drawing.Size(62, 21);
            this.cmdADD.TabIndex = 15;
            this.cmdADD.Text = "Add";
            this.cmdADD.UseVisualStyleBackColor = true;
            this.cmdADD.Click += new System.EventHandler(this.cmdADD_Click);
            // 
            // cmdREMOVER
            // 
            this.cmdREMOVER.Location = new System.Drawing.Point(860, 30);
            this.cmdREMOVER.Name = "cmdREMOVER";
            this.cmdREMOVER.Size = new System.Drawing.Size(61, 21);
            this.cmdREMOVER.TabIndex = 16;
            this.cmdREMOVER.Text = "Remove";
            this.cmdREMOVER.UseVisualStyleBackColor = true;
            this.cmdREMOVER.Click += new System.EventHandler(this.cmdREMOVER_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(798, 5);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(43, 20);
            this.label5.TabIndex = 17;
            this.label5.Text = "f(Z)=";
            // 
            // btnOther
            // 
            this.btnOther.Location = new System.Drawing.Point(926, 30);
            this.btnOther.Name = "btnOther";
            this.btnOther.Size = new System.Drawing.Size(61, 21);
            this.btnOther.TabIndex = 18;
            this.btnOther.Text = "Other";
            this.btnOther.UseVisualStyleBackColor = true;
            this.btnOther.Click += new System.EventHandler(this.btnOther_Click);
            // 
            // optZ1
            // 
            this.optZ1.AutoSize = true;
            this.optZ1.Checked = true;
            this.optZ1.Location = new System.Drawing.Point(57, 3);
            this.optZ1.Name = "optZ1";
            this.optZ1.Size = new System.Drawing.Size(39, 17);
            this.optZ1.TabIndex = 19;
            this.optZ1.TabStop = true;
            this.optZ1.Text = " x1";
            this.optZ1.UseVisualStyleBackColor = true;
            this.optZ1.CheckedChanged += new System.EventHandler(this.optZ1_CheckedChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.BackColor = System.Drawing.Color.Transparent;
            this.label6.Location = new System.Drawing.Point(15, 5);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(34, 13);
            this.label6.TabIndex = 20;
            this.label6.Text = "Zoom";
            // 
            // optZ2
            // 
            this.optZ2.AutoSize = true;
            this.optZ2.Location = new System.Drawing.Point(119, 3);
            this.optZ2.Name = "optZ2";
            this.optZ2.Size = new System.Drawing.Size(39, 17);
            this.optZ2.TabIndex = 21;
            this.optZ2.TabStop = true;
            this.optZ2.Text = " x2";
            this.optZ2.UseVisualStyleBackColor = true;
            this.optZ2.CheckedChanged += new System.EventHandler(this.optZ2_CheckedChanged);
            // 
            // optZ3
            // 
            this.optZ3.AutoSize = true;
            this.optZ3.Location = new System.Drawing.Point(178, 3);
            this.optZ3.Name = "optZ3";
            this.optZ3.Size = new System.Drawing.Size(39, 17);
            this.optZ3.TabIndex = 22;
            this.optZ3.Text = " x4";
            this.optZ3.UseVisualStyleBackColor = true;
            this.optZ3.CheckedChanged += new System.EventHandler(this.optZ3_CheckedChanged);
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.optZ3);
            this.panel1.Controls.Add(this.optZ1);
            this.panel1.Controls.Add(this.optZ2);
            this.panel1.Controls.Add(this.label6);
            this.panel1.Location = new System.Drawing.Point(482, 395);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(224, 26);
            this.panel1.TabIndex = 23;
            // 
            // cmdSALVAR
            // 
            this.cmdSALVAR.BackColor = System.Drawing.Color.LightGray;
            this.cmdSALVAR.Location = new System.Drawing.Point(428, 4);
            this.cmdSALVAR.Name = "cmdSALVAR";
            this.cmdSALVAR.Size = new System.Drawing.Size(75, 23);
            this.cmdSALVAR.TabIndex = 24;
            this.cmdSALVAR.Text = "Save";
            this.cmdSALVAR.UseVisualStyleBackColor = false;
            this.cmdSALVAR.Click += new System.EventHandler(this.salvar);
            // 
            // cboFORMAS
            // 
            this.cboFORMAS.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboFORMAS.FormattingEnabled = true;
            this.cboFORMAS.Location = new System.Drawing.Point(112, 5);
            this.cboFORMAS.Name = "cboFORMAS";
            this.cboFORMAS.Size = new System.Drawing.Size(88, 21);
            this.cboFORMAS.TabIndex = 25;
            this.cboFORMAS.SelectedIndexChanged += new System.EventHandler(this.cboFORMAS_SelectedIndexChanged);
            // 
            // sbarLINHA
            // 
            this.sbarLINHA.Location = new System.Drawing.Point(2, 52);
            this.sbarLINHA.Name = "sbarLINHA";
            this.sbarLINHA.Size = new System.Drawing.Size(25, 100);
            this.sbarLINHA.SmallChange = 10;
            this.sbarLINHA.TabIndex = 26;
            this.sbarLINHA.Scroll += new System.Windows.Forms.ScrollEventHandler(this.sbarLINHA_Scroll);
            // 
            // txtLINHA
            // 
            this.txtLINHA.Enabled = false;
            this.txtLINHA.Location = new System.Drawing.Point(2, 29);
            this.txtLINHA.Name = "txtLINHA";
            this.txtLINHA.Size = new System.Drawing.Size(25, 20);
            this.txtLINHA.TabIndex = 27;
            // 
            // ComplexPlan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.ClientSize = new System.Drawing.Size(1003, 424);
            this.Controls.Add(this.txtLINHA);
            this.Controls.Add(this.sbarLINHA);
            this.Controls.Add(this.cboFORMAS);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.cmdSALVAR);
            this.Controls.Add(this.btnOther);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.cmdREMOVER);
            this.Controls.Add(this.cmdADD);
            this.Controls.Add(this.lstCALC);
            this.Controls.Add(this.txtIMAGEM);
            this.Controls.Add(this.cmdBROWSERIMG);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtX2);
            this.Controls.Add(this.txtY2);
            this.Controls.Add(this.cmdLIMPAR);
            this.Controls.Add(this.cboREGRAS);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.Imagem2);
            this.Controls.Add(this.Imagem1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtX);
            this.Controls.Add(this.txtY);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "ComplexPlan";
            this.Text = "ComplexPlan";
            this.Load += new System.EventHandler(this.ComplexPlan_Load);
            ((System.ComponentModel.ISupportInitialize)(this.Imagem1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Imagem2)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtY;
        private System.Windows.Forms.TextBox txtX;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.PictureBox Imagem1;
        private System.Windows.Forms.PictureBox Imagem2;
        private System.Windows.Forms.ComboBox cboREGRAS;
        private System.Windows.Forms.Button cmdLIMPAR;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtX2;
        private System.Windows.Forms.TextBox txtY2;
        private System.Windows.Forms.Button cmdBROWSERIMG;
        private System.Windows.Forms.TextBox txtIMAGEM;
        private System.Windows.Forms.OpenFileDialog OpenFile;
        private System.Windows.Forms.ListBox lstCALC;
        private System.Windows.Forms.Button cmdADD;
        private System.Windows.Forms.Button cmdREMOVER;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnOther;
        private System.Windows.Forms.RadioButton optZ1;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.RadioButton optZ2;
        private System.Windows.Forms.RadioButton optZ3;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.ContextMenuStrip ContextMenu;
        private System.Windows.Forms.Button cmdSALVAR;
        private System.Windows.Forms.SaveFileDialog SaveFile;
        private System.Windows.Forms.ComboBox cboFORMAS;
        private System.Windows.Forms.VScrollBar sbarLINHA;
        private System.Windows.Forms.TextBox txtLINHA;
    }
}

