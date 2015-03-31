using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;

namespace PGM_EDITOR
{
    public partial class Histograma : Form
    {
        public Histograma(PgmImg img)
        {
            InitializeComponent();

            chart1.Legends[0].Alignment = System.Drawing.StringAlignment.Near;
            chart1.Series["Series1"].ChartType = SeriesChartType.Column;
            chart1.Series["Series1"].Color = System.Drawing.Color.Goldenrod;
            chart1.Series["Series1"].YValueType = ChartValueType.Int32;
            chart1.Series["Series1"].Color = Color.Blue;
            chart1.Titles.Add("Qtd. Colors");
            var chartArea3DStyle = new ChartArea3DStyle();
            chartArea3DStyle.Enable3D = true;
            chartArea3DStyle.LightStyle = LightStyle.Realistic;
            chartArea3DStyle.Rotation = 5;
            chartArea3DStyle.Inclination = 40;
            chartArea3DStyle.PointDepth = 50;
            chart1.ChartAreas[0].Area3DStyle = chartArea3DStyle;
            chart1.Series[0].Points.Clear();
            for (int i = 0; i < 256; i++)
                chart1.Series[0].Points.Add(img.Pallete[i]);

            chart2.Legends[0].Alignment = System.Drawing.StringAlignment.Near;
            chart2.Series["Series1"].ChartType = SeriesChartType.Column;
            chart2.Series["Series1"].Color = System.Drawing.Color.Goldenrod;
            chart2.Series["Series1"].YValueType = ChartValueType.Int32;
            chart2.Series["Series1"].Color = Color.Red;
            chart2.Titles.Add("Qtd. Colors");
            var chartArea3DStyle2 = new ChartArea3DStyle();
            chartArea3DStyle2.Enable3D = true;
            chartArea3DStyle2.LightStyle = LightStyle.Realistic;
            chartArea3DStyle2.Rotation = 5;
            chartArea3DStyle2.Inclination = 40;
            chartArea3DStyle2.PointDepth = 50;
            chart2.ChartAreas[0].Area3DStyle = chartArea3DStyle2;
            chart2.Series[0].Points.Clear();
            var cumulate = img.CumulativePallete();
            for (int i = 0; i < 256; i++)
                chart2.Series[0].Points.Add(cumulate[i]);

        }
    }   
}
