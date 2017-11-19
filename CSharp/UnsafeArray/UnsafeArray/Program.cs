using System;

namespace UnsafeArray
{
    class Program
    {
        static unsafe void Main(string[] args)
        {
            var w = 2;
            var h = 2;

            int* a1 = stackalloc int[w * h];
            int** array = stackalloc int*[w];
            int row;

            for (row = 0; row < h; row++)
            {
                int* pointer = a1 + (row * w);
                array[row] = pointer;
            }

            array[0][0] = 10;
            array[1][0] = 20;

            var value1 = array[0][0];
            var value2 = array[1][0];

            Console.WriteLine(value1);
            Console.WriteLine(value2);

            var numero = 42;
            var numeroP = &numero;
            //var numeroPt = new IntPtr(numeroP);

            while (Console.ReadKey().Key != ConsoleKey.Escape)
            {
                Console.WriteLine($"numero: {*numeroP} na posicao {((int)numeroP):X}");
            }

            Console.ReadKey();
        }


        static unsafe int** MakeArray(int h, int w)
        {
            int* a1 = stackalloc int[w * h];
            int** array = stackalloc int*[w];
            int row;

            //a1 =(int*) Marshal.AllocHGlobal(w * h * sizeof(int));
            //array = (int**)Marshal.AllocHGlobal((w * sizeof(int*)));

            for (row = 0; row < h; row++)
            {
                int* pointer = a1 + (row * w);
                array[row] = pointer;
            }

            return array;

        }
    }
}
