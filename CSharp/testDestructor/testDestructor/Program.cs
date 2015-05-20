using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace testDestructor
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var t = new TestDispose()) { };

        }
    }


    class First
    {
        ~First()
        {
            System.Diagnostics.Trace.WriteLine("First's destructor is called.");
        }
    }
    class Second : First
    {
        ~Second()
        {
            System.Diagnostics.Trace.WriteLine("Second's destructor is called.");
        }
    }
    class Third : Second
    {
        ~Third()
        {
            System.Diagnostics.Trace.WriteLine("Third's destructor is called.");
        }
    }


    class TestDispose : IDisposable
    {
        bool isDisposed = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!isDisposed) // eliminar apenas uma vez!
            {
                if (disposing)
                {
                    System.Diagnostics.Trace.WriteLine("No momento não é o destructor, seguro para referência de objetos");
                }
                // Limpeza
                System.Diagnostics.Trace.WriteLine("Eliminando agora...");
            }
            this.isDisposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            // Diz par ao Garbage Collector não finalizar
            GC.SuppressFinalize(this);
        }

        ~TestDispose()
        {
            Dispose(false);
            System.Diagnostics.Trace.WriteLine("No Destructor.");
        }
    }
  
}
