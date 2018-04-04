using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;

namespace PartyHard
{
    class Program
    {
        static Semaphore semaphore = new Semaphore(3, 3);
        static Thread[] threads = new Thread[10];


        static int[] numeros = Enumerable.Range(1, 10).ToArray();

        static void PartyHard()
        {


            Console.WriteLine(
                $"{Thread.CurrentThread.Name} is waiting in line...");

            semaphore.WaitOne();
            Console.WriteLine(
                $"{Thread.CurrentThread.Name} enters the party!");

            Thread.Sleep(300);
            Console.WriteLine(
                $"{Thread.CurrentThread.Name} is leaving the party");
            semaphore.Release();
        }

        static void Main()
        {
            //for (int i = 0; i < 10; i++)
            //{
            //    threads[i] = new Thread(PartyHard);
            //    threads[i].Name = "thread_" + i;
            //    threads[i].Start();
            //}

            Console.Error.WriteLine("deu ruim");
            Console.WriteLine("so que nao");

            var lst = new[] { 1, 2, 3, 5, 6, 7 };
            var l1 = lst.Shuffle().ToArray();
            var l2 = lst.Shuffle().ToArray();
            var l3 = lst.Shuffle().ToArray();


            var z = new StringBuilder();
            var teste = new TESTE(z);
            var x = Marshal.SizeOf(teste);


            numeros.ToList().ForEach(Console.WriteLine);
            ref readonly var numero = ref GetRefValur(numeros, 5);
            ref readonly var numero2 = ref GetRefValur(numeros, 1);

            numeros[1] = -999;
            numeros[5] = -666;


            Console.WriteLine($"{numero} e {numero2}");

            //IntPtr ptr;
            //int a = 1;
            //string b = "fdsasd";


            //unsafe
            //{
            //    double[] arr = { 0, 1.5, 2.3, 3.4, 4.0, 5.9 };
            //    int* dado = stackalloc int[10];
            //    int* dadoHealp = (int*)Marshal.AllocHGlobal(10 * sizeof(int));
            //    ptr = (IntPtr)dadoHealp;

            //    fixed (double* p = &arr[0])
            //    {
            //        *p = 1;
            //    }
            //    Marshal.FreeHGlobal(ptr);

            //}


            if (
                MetodoComNomeMuitoGrandeParaEscreverVaiFilhao(2) is var n &&
                n > 0 && n < 10
               )
            {
                Console.WriteLine(n);
            }



            Console.Read();

            //numero = 10;
        }


        static ref readonly int GetRefValur(int[] numeros, int index)
        {
            return ref numeros[index];
        }

        static int MetodoComNomeMuitoGrandeParaEscreverVaiFilhao(int n) => n * 2;

        readonly struct TESTE
        {
            readonly StringBuilder Nome;
            // readonly int Idade;
            public TESTE(StringBuilder nome)
            {
                Nome = nome;
                //Idade = idade;
            }
        }

    }

    public static class ext
    {
        public static IEnumerable<T> Shuffle<T>(this IEnumerable<T> list) => list.Shuffle(new Random());
        public static IEnumerable<T> Shuffle<T>(this IEnumerable<T> list, Random r) =>
                list
                   .Select(x => new { Number = r.Next(), Item = x })
                   .Do(e => Console.WriteLine(e.Item))
                   .OrderBy(x => x.Number)
                   .Select(x => x.Item);
    }
}
