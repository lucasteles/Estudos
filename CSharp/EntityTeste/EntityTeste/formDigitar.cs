using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace EntityTeste
{
    public partial class formDigitar : baseForm
    {
        // este sera usado para fazer todas as operções do form digitar
        protected IBaseDigitarController Controller;


        protected void setModel<T>() // busca imlentação da controleer com tipo passado
        {
            Controller = Program.container.GetInstance<IBaseDigitarController<T>>();
        }

        public formDigitar()
        {
            
            InitializeComponent();
        }


        public void salvar() // criar m,etodos que irao fazer as coisas do digitar usando a controller
        {
            int id = Controller.getID();

            // alterando a model de forma generica
            IModel model = Controller.get();
            model.Created = DateTime.Now;

            if (id==0)
                Controller.Insert();
            else
                Controller.Update();

        }



    }
}
