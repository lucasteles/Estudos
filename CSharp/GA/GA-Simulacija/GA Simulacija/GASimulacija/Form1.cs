using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GASimulacija
{
    public partial class Form1 : Form
    {
        private Game.Game objGame;
        public Form1()
        {
            InitializeComponent();
            objGame = new Game.Game();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            timer1.Enabled = true;
            timer1.Start();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            objGame.Update(new TimeSpan(timer1.Interval * 10000));
            pictureBox1.Image= objGame.Draw();
        }
    }
}
