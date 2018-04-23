using System;
using System.Diagnostics;
using System.Linq;
using System.Reactive.Concurrency;
using System.Reactive.Linq;
using System.Threading;
using System.Threading.Tasks;
using static System.Console;

namespace ParallelExample
{
    class Program
    {
        static int TotalRegisters = 10000;
        static int Chunk = 10;

        static async Task Main()
        {
            var watch = new Stopwatch();
            watch.Start();
            await ProcessTPL();
            watch.Stop();
            var tTPL = watch.ElapsedMilliseconds;
            watch.Reset();

            watch.Start();
            ProcessPLINQ();
            watch.Stop();
            var tPLINQ = watch.ElapsedMilliseconds;
            watch.Reset();

            watch.Start();
            await ProcessRx(NewThreadScheduler.Default);
            watch.Stop();
            var rRxNew = watch.ElapsedMilliseconds;
            watch.Reset();

            watch.Start();
            await ProcessRx(ThreadPoolScheduler.Instance);
            watch.Stop();
            var rRxPool = watch.ElapsedMilliseconds;
            watch.Reset();

            WriteLine($"TPL:{tTPL}");
            WriteLine($"PLINQ:{tPLINQ}");
            WriteLine($"Rx new:{rRxNew}");
            WriteLine($"Rx pool:{rRxPool}");

            ReadLine();
        }

        static void ProcessPLINQ() =>
            Enumerable.Range(0, TotalRegisters)
                .AsParallel()
                .WithDegreeOfParallelism(Chunk)
                .WithExecutionMode(ParallelExecutionMode.ForceParallelism)
                .ForAll(Process)
            ;

        static readonly SemaphoreSlim semaphore = new SemaphoreSlim(Chunk);
        static async Task ProcessTPL() =>

                await Task.WhenAll(
                    Enumerable.Range(0, TotalRegisters)
                        .Do(_ => semaphore.Wait())
                        .Select(e => Task.Run(() => Process(e)))
                        .Select(e => e.ContinueWith(_ => semaphore.Release()))
                        .Finally(() => WriteLine("done!"))
                    );

        static async Task ProcessRx(IScheduler scheduler) =>
                await
                    Enumerable.Range(0, TotalRegisters)
                    //.ToObservable(NewThreadScheduler.Default)
                    //.ToObservable(ThreadPoolScheduler.Instance)
                    .ToObservable(scheduler)
                    .Select(n => Observable.Defer(() => Observable.Start(() => Process(n))))
                    .Merge(Chunk)
                  ;


        static void Process(int p)
        {
            var r = new Random();
            var sleepTime = 100; //r.Next(5000, 5000);
            WriteLine($"{p} - Consuming index - in {sleepTime} ms");
            Thread.Sleep(sleepTime);
        }
    }

}
