using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace codek
{
    class Program 

    {
        static void Main(string[] args)
        {
            //System.Console.WriteLine("Hello Codek!");
            //string inp= Console.ReadLine();

            Console.WriteLine("What is your name?");

            var myName = Console.ReadLine();
            Console.WriteLine("Hello, " + myName + " :). ");

            /* Converting Data Types */

            int age = 20;
            string myFirstTry = age.ToString();
            Console.WriteLine(myFirstTry);
            // int mySecondTry = int.Parse(myName);
            string cinco = "5";
            int mySecondTry = int.Parse(cinco);
            Console.WriteLine("My Second Try: " + mySecondTry);

            /* */
        }
    }
}
