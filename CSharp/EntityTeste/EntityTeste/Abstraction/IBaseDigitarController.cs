using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using System.Windows.Forms;

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


    public interface IBaseDigitarController<T> : IBaseDigitarController where T : IModel
    {
        IFieldRegister<T> Register(Expression<Func<T, object>> expression, Control control);
        IFieldRegister<T> setEE(T model);
        T getEE();

    }
}
