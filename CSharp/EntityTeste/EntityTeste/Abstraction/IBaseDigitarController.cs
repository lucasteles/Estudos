using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntityTeste
{
    public interface IBaseDigitarController
    {
        int getID();
        void Insert();
        void Update();
        void Etc();
        IModel get();
    }


    public interface IBaseDigitarController<T> : IBaseDigitarController
    {
      
    }
}
