using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace PGM_EDITOR
{
    /// <summary>
    /// Interaction logic for InputDialog.xaml
    /// </summary>
    public partial class InputDialog : Window
    {
        public InputDialog()
        {
            InitializeComponent();
        }

        private void btnDialogOk_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = true;
        }

        public string Answer
        {
            get { return txtAnswer.Text; }
        }

        public string Extra
        {
            get { return txtExtra.Text; }
        }

        public Options Option
        {
            get
            { return (Options)cmbOption.SelectedIndex; }
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            cmbOption.Items.Add("Color Reduce");
            cmbOption.Items.Add("Floyd Steinberg");
            cmbOption.Items.Add("Histogram equalization");
            cmbOption.Items.Add("Average filter");
            cmbOption.Items.Add("Median filter");
            cmbOption.Items.Add("Gaussian operator");
            cmbOption.Items.Add("Laplace operator");
            cmbOption.Items.Add("Edges Highlight");
            cmbOption.Items.Add("Erosion");
            cmbOption.Items.Add("Expansion");
            cmbOption.SelectedIndex = 0;

        }

        private void cmbOption_DropDownClosed(object sender, EventArgs e)
        {
            if (cmbOption.SelectedIndex == 2)
            {
                txtAnswer.IsEnabled = false;
                txtAnswer.Text = "";
            }
            else
                txtAnswer.IsEnabled = true;

            if (  (new List<int>{3,5,6,7,8,9}).Contains(cmbOption.SelectedIndex))
                lblQuestion.Content = ("Valor impar maior que tres");
            else
                lblQuestion.Content = ("Valor aplicado (2 - 255):");

            if ((new List<int>{5,6,7}).Contains(cmbOption.SelectedIndex))
                txtExtra.Visibility = lblExtra.Visibility = System.Windows.Visibility.Visible;
            else
                txtExtra.Visibility = lblExtra.Visibility = System.Windows.Visibility.Hidden;
        }
    }
}
