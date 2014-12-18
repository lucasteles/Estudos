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
            this.lblMagMouseX = new System.Windows.Forms.Label();
            this.lblMagMouseY = new System.Windows.Forms.Label();
            this.lblMouseY = new System.Windows.Forms.Label();
            this.lblMouseX = new System.Windows.Forms.Label();
            this.lblCood = new System.Windows.Forms.Label();
            this.txtX = new System.Windows.Forms.TextBox();
            this.txtY = new System.Windows.Forms.TextBox();
            this.txtZ = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.cmdDraw = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.Box3D)).BeginInit();
            this.SuspendLayout();
            // 
            // Box3D
            // 
            this.Box3D.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.Box3D.BackColor = System.Drawing.Color.White;
            this.Box3D.Location = new System.Drawing.Point(12, 12);
            this.Box3D.Name = "Box3D";
            this.Box3D.Size = new System.Drawing.Size(605, 403);
            this.Box3D.TabIndex = 0;
            this.Box3D.TabStop = false;
            this.Box3D.MouseDown += new System.Windows.Forms.MouseEventHandler(this.Box3D_MouseClick);
            this.Box3D.MouseMove += new System.Windows.Forms.MouseEventHandler(this.Box3D_MouseMove);
            // 
            // lblMagMouseX
            // 
            this.lblMagMouseX.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblMagMouseX.AutoSize = true;
            this.lblMagMouseX.Location = new System.Drawing.Point(13, 422);
            this.lblMagMouseX.Name = "lblMagMouseX";
            this.lblMagMouseX.Size = new System.Drawing.Size(35, 13);
            this.lblMagMouseX.TabIndex = 1;
            this.lblMagMouseX.Text = "label1";
            // 
            // lblMagMouseY
            // 
            this.lblMagMouseY.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblMagMouseY.AutoSize = true;
            this.lblMagMouseY.Location = new System.Drawing.Point(13, 447);
            this.lblMagMouseY.Name = "lblMagMouseY";
            this.lblMagMouseY.Size = new System.Drawing.Size(35, 13);
            this.lblMagMouseY.TabIndex = 2;
            this.lblMagMouseY.Text = "label2";
            // 
            // lblMouseY
            // 
            this.lblMouseY.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.lblMouseY.AutoSize = true;
            this.lblMouseY.Location = new System.Drawing.Point(582, 447);
            this.lblMouseY.Name = "lblMouseY";
            this.lblMouseY.Size = new System.Drawing.Size(35, 13);
            this.lblMouseY.TabIndex = 4;
            this.lblMouseY.Text = "label2";
            // 
            // lblMouseX
            // 
            this.lblMouseX.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.lblMouseX.AutoSize = true;
            this.lblMouseX.Location = new System.Drawing.Point(582, 422);
            this.lblMouseX.Name = "lblMouseX";
            this.lblMouseX.Size = new System.Drawing.Size(35, 13);
            this.lblMouseX.TabIndex = 3;
            this.lblMouseX.Text = "label1";
            // 
            // lblCood
            // 
            this.lblCood.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblCood.AutoSize = true;
            this.lblCood.Location = new System.Drawing.Point(13, 492);
            this.lblCood.Name = "lblCood";
            this.lblCood.Size = new System.Drawing.Size(35, 13);
            this.lblCood.TabIndex = 5;
            this.lblCood.Text = "label2";
            // 
            // txtX
            // 
            this.txtX.Location = new System.Drawing.Point(194, 421);
            this.txtX.Name = "txtX";
            this.txtX.Size = new System.Drawing.Size(50, 20);
            this.txtX.TabIndex = 6;
            this.txtX.Text = "0";
            // 
            // txtY
            // 
            this.txtY.Location = new System.Drawing.Point(194, 447);
            this.txtY.Name = "txtY";
            this.txtY.Size = new System.Drawing.Size(50, 20);
            this.txtY.TabIndex = 7;
            this.txtY.Text = "0";
            // 
            // txtZ
            // 
            this.txtZ.Location = new System.Drawing.Point(194, 473);
            this.txtZ.Name = "txtZ";
            this.txtZ.Size = new System.Drawing.Size(50, 20);
            this.txtZ.TabIndex = 8;
            this.txtZ.Text = "0";
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(174, 422);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(14, 13);
            this.label1.TabIndex = 9;
            this.label1.Text = "X";
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(174, 447);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(14, 13);
            this.label2.TabIndex = 10;
            this.label2.Text = "Y";
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(174, 476);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(14, 13);
            this.label3.TabIndex = 11;
            this.label3.Text = "Z";
            // 
            // cmdDraw
            // 
            this.cmdDraw.Location = new System.Drawing.Point(268, 422);
            this.cmdDraw.Name = "cmdDraw";
            this.cmdDraw.Size = new System.Drawing.Size(75, 23);
            this.cmdDraw.TabIndex = 12;
            this.cmdDraw.Text = "Draw";
            this.cmdDraw.UseVisualStyleBackColor = true;
            this.cmdDraw.Click += new System.EventHandler(this.cmdDraw_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(629, 514);
            this.Controls.Add(this.cmdDraw);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtZ);
            this.Controls.Add(this.txtY);
            this.Controls.Add(this.txtX);
            this.Controls.Add(this.lblCood);
            this.Controls.Add(this.lblMouseY);
            this.Controls.Add(this.lblMouseX);
            this.Controls.Add(this.lblMagMouseY);
            this.Controls.Add(this.lblMagMouseX);
            this.Controls.Add(this.Box3D);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.Box3D)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox Box3D;
        private System.Windows.Forms.Label lblMagMouseX;
        private System.Windows.Forms.Label lblMagMouseY;
        private System.Windows.Forms.Label lblMouseY;
        private System.Windows.Forms.Label lblMouseX;
        private System.Windows.Forms.Label lblCood;
        private System.Windows.Forms.TextBox txtX;
        private System.Windows.Forms.TextBox txtY;
        private System.Windows.Forms.TextBox txtZ;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button cmdDraw;
    }
}

