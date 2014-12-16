namespace ComplexCalc
{
    partial class OtherCalc
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
            this.label1 = new System.Windows.Forms.Label();
            this.btnOK = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.optORD2 = new System.Windows.Forms.RadioButton();
            this.optORD1 = new System.Windows.Forms.RadioButton();
            this.panel3 = new System.Windows.Forms.Panel();
            this.optPot = new System.Windows.Forms.RadioButton();
            this.optDivi = new System.Windows.Forms.RadioButton();
            this.optMult = new System.Windows.Forms.RadioButton();
            this.label3 = new System.Windows.Forms.Label();
            this.panel4 = new System.Windows.Forms.Panel();
            this.radioButton3 = new System.Windows.Forms.RadioButton();
            this.radioButton4 = new System.Windows.Forms.RadioButton();
            this.optSUB = new System.Windows.Forms.RadioButton();
            this.optSoma = new System.Windows.Forms.RadioButton();
            this.label4 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.label6 = new System.Windows.Forms.Label();
            this.txtIZ1 = new System.Windows.Forms.TextBox();
            this.txtRZ1 = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.panel5 = new System.Windows.Forms.Panel();
            this.label11 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.txtSin = new System.Windows.Forms.TextBox();
            this.txtExp = new System.Windows.Forms.TextBox();
            this.txtCos = new System.Windows.Forms.TextBox();
            this.txtConj = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel4.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel5.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(37, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(49, 20);
            this.label1.TabIndex = 3;
            this.label1.Text = "Order";
            // 
            // btnOK
            // 
            this.btnOK.Location = new System.Drawing.Point(87, 353);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(86, 29);
            this.btnOK.TabIndex = 4;
            this.btnOK.Text = "OK";
            this.btnOK.UseVisualStyleBackColor = true;
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(199, 353);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(86, 29);
            this.btnCancel.TabIndex = 5;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(39, 95);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(79, 20);
            this.label2.TabIndex = 6;
            this.label2.Text = "Operation";
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.optORD2);
            this.panel1.Controls.Add(this.optORD1);
            this.panel1.Location = new System.Drawing.Point(26, 28);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(336, 52);
            this.panel1.TabIndex = 8;
            // 
            // optORD2
            // 
            this.optORD2.AutoSize = true;
            this.optORD2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.optORD2.Location = new System.Drawing.Point(191, 11);
            this.optORD2.Name = "optORD2";
            this.optORD2.Size = new System.Drawing.Size(111, 24);
            this.optORD2.TabIndex = 3;
            this.optORD2.TabStop = true;
            this.optORD2.Text = "f(Z)= Z1 ? Z";
            this.optORD2.UseVisualStyleBackColor = true;
            // 
            // optORD1
            // 
            this.optORD1.AutoSize = true;
            this.optORD1.Checked = true;
            this.optORD1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.optORD1.Location = new System.Drawing.Point(28, 11);
            this.optORD1.Name = "optORD1";
            this.optORD1.Size = new System.Drawing.Size(115, 24);
            this.optORD1.TabIndex = 2;
            this.optORD1.TabStop = true;
            this.optORD1.Text = "f(Z) = Z ? Z1";
            this.optORD1.UseVisualStyleBackColor = true;
            // 
            // panel3
            // 
            this.panel3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel3.Controls.Add(this.optPot);
            this.panel3.Controls.Add(this.optDivi);
            this.panel3.Controls.Add(this.optMult);
            this.panel3.Controls.Add(this.label3);
            this.panel3.Controls.Add(this.panel4);
            this.panel3.Controls.Add(this.optSUB);
            this.panel3.Controls.Add(this.optSoma);
            this.panel3.Location = new System.Drawing.Point(26, 105);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(336, 49);
            this.panel3.TabIndex = 9;
            // 
            // optPot
            // 
            this.optPot.AutoSize = true;
            this.optPot.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.optPot.Location = new System.Drawing.Point(289, 12);
            this.optPot.Name = "optPot";
            this.optPot.Size = new System.Drawing.Size(34, 24);
            this.optPot.TabIndex = 13;
            this.optPot.TabStop = true;
            this.optPot.Text = "^";
            this.optPot.UseVisualStyleBackColor = true;
            // 
            // optDivi
            // 
            this.optDivi.AutoSize = true;
            this.optDivi.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.optDivi.Location = new System.Drawing.Point(236, 11);
            this.optDivi.Name = "optDivi";
            this.optDivi.Size = new System.Drawing.Size(31, 24);
            this.optDivi.TabIndex = 12;
            this.optDivi.TabStop = true;
            this.optDivi.Text = "/";
            this.optDivi.UseVisualStyleBackColor = true;
            // 
            // optMult
            // 
            this.optMult.AutoSize = true;
            this.optMult.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.optMult.Location = new System.Drawing.Point(182, 11);
            this.optMult.Name = "optMult";
            this.optMult.Size = new System.Drawing.Size(34, 24);
            this.optMult.TabIndex = 11;
            this.optMult.TabStop = true;
            this.optMult.Text = "x";
            this.optMult.UseVisualStyleBackColor = true;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(15, 15);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(31, 20);
            this.label3.TabIndex = 10;
            this.label3.Text = "? =";
            // 
            // panel4
            // 
            this.panel4.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel4.Controls.Add(this.radioButton3);
            this.panel4.Controls.Add(this.radioButton4);
            this.panel4.Location = new System.Drawing.Point(-1, 97);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(336, 49);
            this.panel4.TabIndex = 9;
            // 
            // radioButton3
            // 
            this.radioButton3.AutoSize = true;
            this.radioButton3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radioButton3.Location = new System.Drawing.Point(191, 11);
            this.radioButton3.Name = "radioButton3";
            this.radioButton3.Size = new System.Drawing.Size(111, 24);
            this.radioButton3.TabIndex = 3;
            this.radioButton3.TabStop = true;
            this.radioButton3.Text = "f(Z)= Z1 ? Z";
            this.radioButton3.UseVisualStyleBackColor = true;
            // 
            // radioButton4
            // 
            this.radioButton4.AutoSize = true;
            this.radioButton4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radioButton4.Location = new System.Drawing.Point(28, 11);
            this.radioButton4.Name = "radioButton4";
            this.radioButton4.Size = new System.Drawing.Size(115, 24);
            this.radioButton4.TabIndex = 2;
            this.radioButton4.TabStop = true;
            this.radioButton4.Text = "f(Z) = Z ? Z1";
            this.radioButton4.UseVisualStyleBackColor = true;
            // 
            // optSUB
            // 
            this.optSUB.AutoSize = true;
            this.optSUB.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.optSUB.Location = new System.Drawing.Point(127, 11);
            this.optSUB.Name = "optSUB";
            this.optSUB.Size = new System.Drawing.Size(32, 24);
            this.optSUB.TabIndex = 3;
            this.optSUB.TabStop = true;
            this.optSUB.Text = "-";
            this.optSUB.UseVisualStyleBackColor = true;
            // 
            // optSoma
            // 
            this.optSoma.AutoSize = true;
            this.optSoma.Checked = true;
            this.optSoma.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.optSoma.Location = new System.Drawing.Point(69, 11);
            this.optSoma.Name = "optSoma";
            this.optSoma.Size = new System.Drawing.Size(36, 24);
            this.optSoma.TabIndex = 2;
            this.optSoma.TabStop = true;
            this.optSoma.Text = "+";
            this.optSoma.UseVisualStyleBackColor = true;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(36, 165);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(76, 20);
            this.label4.TabIndex = 10;
            this.label4.Text = "Definition";
            // 
            // panel2
            // 
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel2.Controls.Add(this.label6);
            this.panel2.Controls.Add(this.txtIZ1);
            this.panel2.Controls.Add(this.txtRZ1);
            this.panel2.Controls.Add(this.label5);
            this.panel2.Location = new System.Drawing.Point(25, 176);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(336, 52);
            this.panel2.TabIndex = 11;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(178, 15);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(12, 20);
            this.label6.TabIndex = 16;
            this.label6.Text = "i";
            // 
            // txtIZ1
            // 
            this.txtIZ1.Location = new System.Drawing.Point(128, 15);
            this.txtIZ1.MaxLength = 3;
            this.txtIZ1.Name = "txtIZ1";
            this.txtIZ1.Size = new System.Drawing.Size(46, 20);
            this.txtIZ1.TabIndex = 15;
            this.txtIZ1.TextChanged += new System.EventHandler(this.txtIZ1_TextChanged);
            // 
            // txtRZ1
            // 
            this.txtRZ1.Location = new System.Drawing.Point(70, 16);
            this.txtRZ1.MaxLength = 3;
            this.txtRZ1.Name = "txtRZ1";
            this.txtRZ1.Size = new System.Drawing.Size(42, 20);
            this.txtRZ1.TabIndex = 12;
            this.txtRZ1.TextChanged += new System.EventHandler(this.txtRZ1_TextChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(16, 15);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(41, 20);
            this.label5.TabIndex = 11;
            this.label5.Text = "Z1 =";
            // 
            // panel5
            // 
            this.panel5.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel5.Controls.Add(this.label11);
            this.panel5.Controls.Add(this.label10);
            this.panel5.Controls.Add(this.label9);
            this.panel5.Controls.Add(this.label8);
            this.panel5.Controls.Add(this.txtSin);
            this.panel5.Controls.Add(this.txtExp);
            this.panel5.Controls.Add(this.txtCos);
            this.panel5.Controls.Add(this.txtConj);
            this.panel5.Location = new System.Drawing.Point(24, 250);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(336, 88);
            this.panel5.TabIndex = 13;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(37, 18);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(41, 20);
            this.label11.TabIndex = 24;
            this.label11.Text = "Conj";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(37, 51);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(36, 20);
            this.label10.TabIndex = 23;
            this.label10.Text = "Exp";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(170, 18);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(37, 20);
            this.label9.TabIndex = 22;
            this.label9.Text = "Cos";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(170, 53);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(32, 20);
            this.label8.TabIndex = 21;
            this.label8.Text = "Sin";
            // 
            // txtSin
            // 
            this.txtSin.Location = new System.Drawing.Point(219, 54);
            this.txtSin.MaxLength = 1;
            this.txtSin.Name = "txtSin";
            this.txtSin.Size = new System.Drawing.Size(18, 20);
            this.txtSin.TabIndex = 20;
            this.txtSin.TextChanged += new System.EventHandler(this.txtSin_TextChanged);
            // 
            // txtExp
            // 
            this.txtExp.Location = new System.Drawing.Point(86, 54);
            this.txtExp.MaxLength = 1;
            this.txtExp.Name = "txtExp";
            this.txtExp.Size = new System.Drawing.Size(18, 20);
            this.txtExp.TabIndex = 19;
            this.txtExp.TextChanged += new System.EventHandler(this.txtExp_TextChanged);
            // 
            // txtCos
            // 
            this.txtCos.Location = new System.Drawing.Point(219, 19);
            this.txtCos.MaxLength = 1;
            this.txtCos.Name = "txtCos";
            this.txtCos.Size = new System.Drawing.Size(18, 20);
            this.txtCos.TabIndex = 18;
            this.txtCos.TextChanged += new System.EventHandler(this.txtCos_TextChanged);
            // 
            // txtConj
            // 
            this.txtConj.Location = new System.Drawing.Point(86, 19);
            this.txtConj.MaxLength = 1;
            this.txtConj.Name = "txtConj";
            this.txtConj.Size = new System.Drawing.Size(18, 20);
            this.txtConj.TabIndex = 17;
            this.txtConj.TextChanged += new System.EventHandler(this.txtConj_TextChanged);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(35, 239);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(87, 20);
            this.label7.TabIndex = 12;
            this.label7.Text = "Apply in Z1";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(124, 243);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(99, 13);
            this.label12.TabIndex = 14;
            this.label12.Text = "( choose the order )";
            // 
            // OtherCalc
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(385, 390);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.panel5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnOK);
            this.Name = "OtherCalc";
            this.Text = "OtherCalc";
            this.Load += new System.EventHandler(this.OtherCalc_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel5.ResumeLayout(false);
            this.panel5.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnOK;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.RadioButton optORD2;
        private System.Windows.Forms.RadioButton optORD1;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.RadioButton optDivi;
        private System.Windows.Forms.RadioButton optMult;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.RadioButton radioButton3;
        private System.Windows.Forms.RadioButton radioButton4;
        private System.Windows.Forms.RadioButton optSUB;
        private System.Windows.Forms.RadioButton optSoma;
        private System.Windows.Forms.RadioButton optPot;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtIZ1;
        private System.Windows.Forms.TextBox txtRZ1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txtSin;
        private System.Windows.Forms.TextBox txtExp;
        private System.Windows.Forms.TextBox txtCos;
        private System.Windows.Forms.TextBox txtConj;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label12;
    }
}