using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Diagnostics;

namespace BogoSort
{
    class Program
    {

        // este é com certeza o algotimo de ordenação mais INUTIL da historia
        static void Main(string[] args)
        {
         
            var array = randomIntArray(8, 100);

            Console.WriteLine("Array original:  ");
            for (int i = 0; i < array.Length; i++)
                Console.Write(array[i] + " ");
            Console.WriteLine();

            var watch = new Stopwatch();
            watch.Start();

            bogoSort(array);

            watch.Stop();
            Console.WriteLine("\nTempo: {0}",  watch.Elapsed);

            Console.Read();


        }


        public static void bogoSort(int[] array) {

            var count = 0;

            var loading = new char[] { '|', '/', '-', '\\', '|', '/', '-', '\\' };
            var loadIndex = 0;

            while (!isSorted(array))
            {
                array = randomArray(array);
                count++;

                Console.CursorLeft=0;
                Console.Write(loading[loadIndex] + " " + count);
                if (count % 1000 == 0)
                    loadIndex++;
                if (loadIndex > loading.Length-1)
                    loadIndex=0;

            }

            Console.CursorLeft = 0;         
            Console.WriteLine("Tentativa: " + count);
            for (int i = 0; i < array.Length; i++)
                Console.Write(array[i] + " ");
            
            
        }

        private static bool isSorted(int[] array)
        {
            for (int i = 0; i < (array.Length - 1); ++i)
                if (array[i] > array[i + 1])
                    return false;

            return true;
        }

        private static int[] randomArray(int[] array)
        {

            var size = array.Length;
            var indices = new int[size];
            for (int i = 0; i < size; i++)
                indices[i] = i;

            var random = new Random();

            for (int i = 0; i < size; i++)
            {
                bool unique = false;
                int nRandom = 0;
                while (!unique)
                {
                    unique = true;
                    nRandom = random.Next(size);
                    for (int j = 0; j < i; j++)
                        if (indices[j] == nRandom)
                        {
                            unique = false;
                            break;
                        }
                }

                indices[i] = nRandom;
            }

            var result = new int[size];
            for (int k = 0; k < size; k++)
                result[indices[k]] = array[k];

            return result;
        }

        private static int[] randomIntArray(int length, int n)
        {
            var a = new int[length];
            var generator = new Random();
            for (int i = 0; i < a.Length; i++)
                a[i] = generator.Next(n);

            return a;
        }


       
    }
}
