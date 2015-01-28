using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntityTeste.Models;

namespace EntityTeste
{
    public class BaseDigitarController<T> : IBaseDigitarController, IBaseDigitarController<T>
    {
        IBaseDAO<T> _dao {get; set;}

        public BaseDigitarController()
        {

           var dao = Program.container.GetInstance<IBaseDAO<T>>();
            _dao = dao;
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
