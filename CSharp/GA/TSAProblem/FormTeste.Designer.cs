namespace TSAProblem
{
    partial class FormTeste
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
            this.cmdStart = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.txtCities = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtMutation = new System.Windows.Forms.TextBox();
            this.txtCrossover = new System.Windows.Forms.TextBox();
            this.txtPopulation = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.txtGeneration = new System.Windows.Forms.TextBox();
            this.txtFitness = new System.Windows.Forms.TextBox();
            this.label19 = new System.Windows.Forms.Label();
            this.UpdateTime = new System.Windows.Forms.Timer(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // cmdStart
            // 
            this.cmdStart.Location = new System.Drawing.Point(13, 13);
            this.cmdStart.Name = "cmdStart";
            this.cmdStart.Size = new System.Drawing.Size(75, 23);
            this.cmdStart.TabIndex = 0;
            this.cmdStart.Text = "Start";
            this.cmdStart.UseVisualStyleBackColor = true;
            this.cmdStart.Click += new System.EventHandler(this.button1_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Location = new System.Drawing.Point(13, 43);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(250, 250);
            this.pictureBox1.TabIndex = 1;
            this.pictureBox1.TabStop = false;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.txtCities);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.txtMutation);
            this.groupBox2.Controls.Add(this.txtCrossover);
            this.groupBox2.Controls.Add(this.txtPopulation);
            this.groupBox2.Controls.Add(this.label12);
            this.groupBox2.Controls.Add(this.label13);
            this.groupBox2.Controls.Add(this.label14);
            this.groupBox2.Location = new System.Drawing.Point(283, 43);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(203, 138);
            this.groupBox2.TabIndex = 5;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Params";
            // 
            // txtCities
            // 
            this.txtCities.Location = new System.Drawing.Point(130, 103);
            this.txtCities.Name = "txtCities";
            this.txtCities.Size = new System.Drawing.Size(46, 20);
            this.txtCities.TabIndex = 18;
            this.txtCities.Text = "20";
            this.txtCities.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(34, 106);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(87, 13);
            this.label5.TabIndex = 17;
            this.label5.Text = "Number of Cities:";
            // 
            // txtMutation
            // 
            this.txtMutation.Location = new System.Drawing.Point(130, 77);
            this.txtMutation.Name = "txtMutation";
            this.txtMutation.Size = new System.Drawing.Size(46, 20);
            this.txtMutation.TabIndex = 14;
            this.txtMutation.Text = "0,30";
            this.txtMutation.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtCrossover
            // 
            this.txtCrossover.Location = new System.Drawing.Point(130, 51);
            this.txtCrossover.Name = "txtCrossover";
            this.txtCrossover.Size = new System.Drawing.Size(46, 20);
            this.txtCrossover.TabIndex = 13;
            this.txtCrossover.Text = "0,60";
            this.txtCrossover.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtPopulation
            // 
            this.txtPopulation.Location = new System.Drawing.Point(130, 24);
            this.txtPopulation.Name = "txtPopulation";
            this.txtPopulation.Size = new System.Drawing.Size(46, 20);
            this.txtPopulation.TabIndex = 12;
            this.txtPopulation.Text = "50";
            this.txtPopulation.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(73, 80);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(51, 13);
            this.label12.TabIndex = 9;
            this.label12.Text = "Mutation:";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(67, 54);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(57, 13);
            this.label13.TabIndex = 8;
            this.label13.Text = "Crossover:";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(64, 31);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(60, 13);
            this.label14.TabIndex = 7;
            this.label14.Text = "Population:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(257, 18);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(60, 13);
            this.label6.TabIndex = 6;
            this.label6.Text = "Generaton:";
            // 
            // txtGeneration
            // 
            this.txtGeneration.Location = new System.Drawing.Point(323, 15);
            this.txtGeneration.Name = "txtGeneration";
            this.txtGeneration.Size = new System.Drawing.Size(46, 20);
            this.txtGeneration.TabIndex = 13;
            this.txtGeneration.Text = "1";
            this.txtGeneration.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtFitness
            // 
            this.txtFitness.Location = new System.Drawing.Point(158, 15);
            this.txtFitness.Name = "txtFitness";
            this.txtFitness.Size = new System.Drawing.Size(87, 20);
            this.txtFitness.TabIndex = 17;
            this.txtFitness.Text = "0";
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Location = new System.Drawing.Point(109, 18);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(43, 13);
            this.label19.TabIndex = 16;
            this.label19.Text = "Fitness:";
            // 
            // UpdateTime
            // 
            this.UpdateTime.Tick += new System.EventHandler(this.UpdateTime_Tick);
            // 
            // FormTeste
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(492, 329);
            this.Controls.Add(this.txtFitness);
            this.Controls.Add(this.label19);
            this.Controls.Add(this.txtGeneration);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.cmdStart);
            this.Name = "FormTeste";
            this.Text = "Travelling salesman problem";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button cmdStart;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox txtMutation;
        private System.Windows.Forms.TextBox txtCrossover;
        private System.Windows.Forms.TextBox txtPopulation;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.TextBox txtCities;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtGeneration;
        private System.Windows.Forms.TextBox txtFitness;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.Timer UpdateTime;
    }
}

