using System;
using System.Runtime.InteropServices;

namespace UnsafeArray
{
    class Program
    {
        static unsafe void Main()
        {
            int w = 2, h = 2;

            // Should pass a callback, because stack is clear after method returns
            Console.WriteLine("Test Stack");
            MakeBidimensionalArrayStack(h, w, arrayStack => TestArray((int**)arrayStack));

            // the method returns a function to free the allocated memory
            Console.WriteLine("Test Heap");
            var arrayHeap = MakeBidimensionalArrayHeap(h, w, out Action free);
            TestArray(arrayHeap);
            free();

            Console.ReadKey();
        }


        static unsafe void MakeBidimensionalArrayStack(int height, int width, Action<IntPtr> callback)
        {

            // calocando na stack
            int* a1 = stackalloc int[width * height];
            int** array = stackalloc int*[width];

            for (var row = 0; row < height; row++)
            {
                int* pointer = a1 + (row * width);
                array[row] = pointer;
            }

            callback((IntPtr)array);
        }

        static unsafe int** MakeBidimensionalArrayHeap(int height, int width, out Action free)
        {
            // calocando no heap
            int* a1 = (int*)Marshal.AllocHGlobal(width * height * sizeof(int));
            int** array = (int**)Marshal.AllocHGlobal(width * sizeof(int*));

            for (var row = 0; row < height; row++)
            {
                int* pointer = a1 + (row * width);
                array[row] = pointer;
            }

            free = () =>
            {
                Marshal.FreeHGlobal((IntPtr)a1);
                Marshal.FreeHGlobal((IntPtr)array);
            };

            return array;
        }

        static unsafe void TestArray(int** array)
        {

            array[0][0] = 10;
            array[0][1] = 11;
            array[1][0] = 20;
            array[1][1] = 21;

            var value1 = array[0][0];
            var value2 = array[0][1];
            var value3 = array[1][0];
            var value4 = array[1][1];

            Console.WriteLine(value1);
            Console.WriteLine(value2);
            Console.WriteLine(value3);
            Console.WriteLine(value4);
        }

    }
}
