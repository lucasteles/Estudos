using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Raxator.DAL.Abstraction
{
    public interface IModelCreating
    {
        void OnCreating(DbModelBuilder modelBuilder);
    }
}
