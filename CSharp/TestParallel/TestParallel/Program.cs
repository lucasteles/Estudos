using System;
using System.Diagnostics;
using System.Linq;
using System.Reactive.Concurrency;
using System.Reactive.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace TestParallel
{
    class Program
    {
        const int SLEEP = 1000;

        static async Task Main(string[] args)
        {

            if (Teste(5) is var x && Comparar(x.Value, 5))
            {
                Console.WriteLine(x);
            }

            if (Teste(20) is var y && Comparar(y.Value, 20))
            {
                Console.WriteLine(y);
            }


            int a = 2147483647;
            int b = 2147483647;
            int value = a + b;

            long a2 = 2147483647;
            long b2 = 2147483647;
            long v2 = a2 + b2;

            int v3 = (int)v2;
            //        int v4 = checked((int)a2);
            //      int v5 = Convert.ToInt32(v2);

            Enumerable.Range(0, 20)
                .Select(e => new { A = e, B = (char)e })
                .ToLookup(e => new { e.A, e.B })
                .ToList()
                ;




            var numbers = Enumerable.Range(1, 100);

            var r = new Stopwatch();
            //r.Start();
            //foreach (var item in numbers)
            //{
            //    Slow(item);
            //}
            //r.Stop();
            //var seqTime = r.ElapsedMilliseconds;
            var seqTime = SLEEP * numbers.Count();

            r.Restart();
            numbers
              .AsParallel()
              .WithDegreeOfParallelism(Environment.ProcessorCount)
              .WithMergeOptions(ParallelMergeOptions.NotBuffered)
              .ForAll(e => Slow(e));

            r.Stop();
            var t1 = r.ElapsedMilliseconds;
            Console.WriteLine("-----------");
            r.Restart();
            await numbers.ToObservable()
               .SubscribeOn(ThreadPoolScheduler.Instance)
               .Select(e => Observable.Start(() => Slow(e)))
               .Merge(Environment.ProcessorCount);

            r.Stop();

            var t2 = r.ElapsedMilliseconds;



            Console.WriteLine($"Sequencial = {seqTime}");
            Console.WriteLine($"PLINQ = {t1} | diffSeq = {seqTime - t1}");
            Console.WriteLine($"RX = {t2} | diffSeq = {seqTime - t2}");


            Console.WriteLine($"diff PLINQ-RX {t1 - t2}");

            Console.ReadKey();
        }

        public static int? Teste(int x) => x > 10 ? null : (int?)x;
        public static bool Comparar(int a, int b)
        {
            Console.WriteLine($"comparando {a} r {b}");
            return a == b;
        }

        public static int Slow(int n)
        {
            Thread.Sleep(SLEEP);
            Console.WriteLine($"{n} on thread {Thread.CurrentThread.ManagedThreadId}");
            return n;
        }



    }
}
