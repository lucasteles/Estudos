namespace Teste3D
{
    partial class Form1
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
            this.Box3D = new System.Windows.Forms.PictureBox();
            this.txtX = new System.Windows.Forms.TextBox();
            this.txtY = new System.Windows.Forms.TextBox();
            this.txtZ = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.cmdDraw = new System.Windows.Forms.Button();
            this.cmdRodar = new System.Windows.Forms.Button();
            this.cmdParar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.Box3D)).BeginInit();
            this.SuspendLayout();
            // 
            // Box3D
            // 
            this.Box3D.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.Box3D.BackColor = System.Drawing.Color.White;
            this.Box3D.Location = new System.Drawing.Point(16, 12);
            this.Box3D.Name = "Box3D";
            this.Box3D.Size = new System.Drawing.Size(500, 500);
            this.Box3D.TabIndex = 0;
            this.Box3D.TabStop = false;
            this.Box3D.MouseDown += new System.Windows.Forms.MouseEventHandler(this.Box3D_MouseClick);
            this.Box3D.MouseMove += new System.Windows.Forms.MouseEventHandler(this.Box3D_MouseMove);
            this.Box3D.Resize += new System.EventHandler(this.Box3D_Resize);
            // 
            // txtX
            // 
            this.txtX.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.txtX.Location = new System.Drawing.Point(33, 539);
            this.txtX.Name = "txtX";
            this.txtX.Size = new System.Drawing.Size(50, 20);
            this.txtX.TabIndex = 6;
            this.txtX.Text = "0";
            // 
            // txtY
            // 
            this.txtY.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.txtY.Location = new System.Drawing.Point(33, 565);
            this.txtY.Name = "txtY";
            this.txtY.Size = new System.Drawing.Size(50, 20);
            this.txtY.TabIndex = 7;
            this.txtY.Text = "0";
            // 
            // txtZ
            // 
            this.txtZ.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.txtZ.Location = new System.Drawing.Point(33, 591);
            this.txtZ.Name = "txtZ";
            this.txtZ.Size = new System.Drawing.Size(50, 20);
            this.txtZ.TabIndex = 8;
            this.txtZ.Text = "0";
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 544);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(14, 13);
            this.label1.TabIndex = 9;
            this.label1.Text = "X";
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(13, 569);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(14, 13);
            this.label2.TabIndex = 10;
            this.label2.Text = "Y";
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 598);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(14, 13);
            this.label3.TabIndex = 11;
            this.label3.Text = "Z";
            // 
            // cmdDraw
            // 
            this.cmdDraw.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.cmdDraw.Location = new System.Drawing.Point(107, 540);
            this.cmdDraw.Name = "cmdDraw";
            this.cmdDraw.Size = new System.Drawing.Size(75, 23);
            this.cmdDraw.TabIndex = 12;
            this.cmdDraw.Text = "Desenhar";
            this.cmdDraw.UseVisualStyleBackColor = true;
            this.cmdDraw.Click += new System.EventHandler(this.cmdDraw_Click);
            // 
            // cmdRodar
            // 
            this.cmdRodar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.cmdRodar.Location = new System.Drawing.Point(189, 539);
            this.cmdRodar.Name = "cmdRodar";
            this.cmdRodar.Size = new System.Drawing.Size(75, 23);
            this.cmdRodar.TabIndex = 13;
            this.cmdRodar.Text = "Rodar";
            this.cmdRodar.UseVisualStyleBackColor = true;
            this.cmdRodar.Click += new System.EventHandler(this.cmdRodar_Click);
            // 
            // cmdParar
            // 
            this.cmdParar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.cmdParar.Location = new System.Drawing.Point(270, 540);
            this.cmdParar.Name = "cmdParar";
            this.cmdParar.Size = new System.Drawing.Size(75, 23);
            this.cmdParar.TabIndex = 14;
            this.cmdParar.Text = "Parar";
            this.cmdParar.UseVisualStyleBackColor = true;
            this.cmdParar.Click += new System.EventHandler(this.cmdParar_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(540, 616);
            this.Controls.Add(this.cmdParar);
            this.Controls.Add(this.cmdRodar);
            this.Controls.Add(this.cmdDraw);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtZ);
            this.Controls.Add(this.txtY);
            this.Controls.Add(this.txtX);
            this.Controls.Add(this.Box3D);
            this.Name = "Form1";
            this.Text = "Form1";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.Form1_Load);
            this.Resize += new System.EventHandler(this.Form1_Resize);
            ((System.ComponentModel.ISupportInitialize)(this.Box3D)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox Box3D;
        private System.Windows.Forms.TextBox txtX;
        private System.Windows.Forms.TextBox txtY;
        private System.Windows.Forms.TextBox txtZ;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button cmdDraw;
        private System.Windows.Forms.Button cmdRodar;
        private System.Windows.Forms.Button cmdParar;
    }
}

