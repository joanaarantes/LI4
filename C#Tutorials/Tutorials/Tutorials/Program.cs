using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
// arguments: A B C D

// Hello1.cs

namespace Tutorials
{
    class Program{
        static void Main(string[] args){

            //args = { "banana"; "ana" };
            //TODO fix this and try to input some arguments 

            System.Console.WriteLine("Hello, World!");
            Console.WriteLine("You entered the following {0} command line arguments:",
         args.Length);
            for (int i = 0; i < args.Length; i++){
                Console.WriteLine("{0}", args[i]);
            }
        }
    }
}

