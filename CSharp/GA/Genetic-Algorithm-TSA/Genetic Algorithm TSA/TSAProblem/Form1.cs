using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using TSAProblem.GeneticAlgorithm;

namespace TSAProblem
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            GaTSP objGA = new GaTSP(0.2, 0.6, 50, 20);
            objGA.DrawMap += objGA_DrawMap;
            int generation = 1;
            while (true)
            {
                objGA.Epoch();
                label1.Text = objGA.BestSolution.ToString();
                label1.Update();
                txtFitness.Text = objGA.BestSolution.ToString();
                txtFitness.Update();
                txtGeneration.Text = generation.ToString();
                txtGeneration.Update();
                generation++;
                Thread.Sleep(100);
            }
        }

        void objGA_DrawMap(object sender, EventArgs e)
        {
            GAEventArgs temp = e as GAEventArgs;
            pictureBox1.Image = temp.MapImage;
            pictureBox1.Update();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            GaTSP objGA = new GaTSP(0.9, 0.2, 2, 2);
            int[] vector = new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
            List<int> lstInput = new List<int>();
            lstInput.AddRange(vector);

            //List<int> lstResult = objGA.MutateSM(lstInput);
            //List<int> lstResult = objGA.MutateDM(lstInput);
            //List<int> lstResult = objGA.MutateIM(lstInput);
            //List<int> lstResult = objGA.MutateIVM(lstInput);
            List<int> lstResult = objGA.MutateDIVM(lstInput);
        }
    }
}
