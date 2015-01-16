using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;

namespace EntityTeste
{
    public interface IModel
    {
        void OnCreating(DbModelBuilder modelBuilder);
    }
}
