using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace BitMusic
{
    class Program
    {
        static private Action<int,int> beep = Console.Beep;

        static void Main(string[] args)
        {
            Mario();
            StarWars();
            MI();
            Console.Read();

        }   

        static private void Mario()
        {
            Console.WriteLine("Mario");
           Thread.Sleep(1000);

           beep(659,250); //E
           beep(659,300); //E
           beep(523,250); //C
           beep(659,250); //E
           beep(784,300); //G
           beep(392,300); //g
           beep(523,275); // C
           beep(392,275); //g
           beep(330,275); //e
           beep(440,250); //a
           beep(494,250); //b
           beep(466,275); //a#
           beep(440,275); //a
           beep(392,275); //g
           beep(659,250); //E
           beep(784,250); // G
           beep(880,275); // A
           beep(698,275); // F
           beep(784,225); // G
           beep(659,250); // E
           beep(523,250); // C
           beep(587,225); // D
           beep(494,225); // B    
    }

        static private void StarWars()
        {
            Console.WriteLine("StarWars");
            Thread.Sleep(1000);

            beep(440,500);       
            beep(440,500); 
            beep(440,500);        
            beep(349,350);        
            beep(523,150);        
            beep(440,500);        
            beep(349,350);        
            beep(523,150);        
            beep(440,1000); 
            beep(659,500);        
            beep(659,500);        
            beep(659,500);        
            beep(698,350);        
            beep(523,150);        
            beep(415,500);        
            beep(349,350);        
            beep(523,150);        
            beep(440,1000);
        }

        static private void MI() {
            Console.WriteLine("MI");
            Thread.Sleep(1000);

            beep(784,150); 
            Thread.Sleep( 300 );
            beep(784,150); 
            Thread.Sleep( 300 );
            beep(932,150); 
            Thread.Sleep( 150 );
            beep(1047,150); 
            Thread.Sleep( 150 ); 
            beep(784,150); 
            Thread.Sleep( 300 );
            beep(784,150); 
            Thread.Sleep( 300 );
            beep(699,150); 
            Thread.Sleep( 150 );
            beep(740,150); 
            Thread.Sleep( 150 );
            beep(784,150); 
            Thread.Sleep( 300 );
            beep(784,150); 
            Thread.Sleep( 300 );
            beep(932,150); 
            Thread.Sleep( 150 );
            beep(1047,150); 
            Thread.Sleep( 150 );
            beep(784,150); 
            Thread.Sleep( 300 );
            beep(784,150); 
            Thread.Sleep( 300 );
            beep(699,150); 
            Thread.Sleep( 150 );
            beep(740,150); 
            Thread.Sleep( 150 );
            beep(932,150); 
            beep(784,150); 
            beep(587,1200); 
            Thread.Sleep( 75 );
            beep(932,150); 
            beep(784,150); 
            beep(554,1200); 
            Thread.Sleep( 75 );
            beep(932,150); 
            beep(784,150); 
            beep(523,1200);
            Thread.Sleep(150);
            beep(466,150); 
            beep(523,150);
        }

    }
}
