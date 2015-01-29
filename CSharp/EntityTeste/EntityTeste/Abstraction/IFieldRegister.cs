using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using System.Windows.Forms;

namespace EntityTeste
{

    public interface IFieldRegister<T> where T : IModel
    {
        IFieldRegister<T> Register(Expression<Func<T, object>> expression, Control control);
        T getModel();
    }
}
