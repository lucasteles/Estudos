using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntityTeste.Models;
using System.Linq.Expressions;
using System.Windows.Forms;

namespace EntityTeste
{
    public class BaseDigitarController<T> : IBaseDigitarController, IBaseDigitarController<T> where T : IModel
    {
        IBaseDAO<T> _dao {get; set;}
        IFieldRegister<T> fieldRegister { get; set; }

        public BaseDigitarController()
        {

           var dao = Program.container.GetInstance<IBaseDAO<T>>();
            _dao = dao;

            fieldRegister = Program.container.GetInstance<IFieldRegister<T>>();
        }

        public IFieldRegister<T> Register(Expression<Func<T, object>> expression, Control control)
        {
            fieldRegister.Register(expression, control);
            return fieldRegister;
        }

        public T getEE()
        {
            return fieldRegister.getModel();
        }

        public int getID()
        {
          
            return 0;
        }

        public void Insert()
        {
          
        }

        public void Update()
        {
          
        }

        public void Etc()
        {
          
        }


        public IModel get()
        {
            return new Cliente();
        }


      
    }
}
