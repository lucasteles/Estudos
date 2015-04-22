using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;

namespace UnsafeArray
{
    class Program
    {
        static unsafe void Main(string[] args)
        {
            var ee = MakeArray(5,2);

            ee[0][0] = 10;
            ee[1][0] = 20;

            Console.WriteLine(ee[0][0]);
            Console.WriteLine(ee[1][0]);

            Console.Read();
        }


        static unsafe int** MakeArray(int w, int h)
        {
          int *a1;
          int** array;
          int row;

          a1 =(int*) Marshal.AllocHGlobal(w * h * sizeof(int));
          array = (int**)Marshal.AllocHGlobal((w * sizeof(int*)));

          for (row = 0; row < w; row++)
              array[row] = a1 + row * h;

          return array;
            
        }
    }
}
