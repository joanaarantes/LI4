using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DerekBanasisAwesome
{
    class Program
    {
        static void Main(string[] args)
        {
            var anotherName = "Tom";
            Console.WriteLine("amotherName is a {0}", anotherName.GetTypeCode());

            //Casting
            double pi = 3.14;
            int intPi = (int)pi;

            //Math Functions
            //Acos, Asim, Atan, Cos, Cosh, 
            /* 
            Math.Abs Math.Ceiling Math.Floor Math.Max  Math.Pow  Math.Round  Math.Sqrt
            */

            //Random numbers
            Random rand = new Random();
            Console.WriteLine("Random between 1 and 10" + (rand.Next(1, 11)));

            //Relational Operatores : > < >= <= == != 
            //Logical Operators: && || ^ !  

            int age = 17;
            if ((age >= 5) && age <= 7)
            {
                Console.WriteLine("Go to elementary school");
            }
            else if (age > 7 && age < 13)
            {
                Console.WriteLine("Go to middle school");
            }
            else {
                Console.WriteLine("Go to hight school");
            }

            Console.WriteLine("! true = " + !true);

            bool canDrive = (age >= 16) ? true : false;

            switch (age)
            {
                case 0:
                    Console.WriteLine("Infant");
                    break;

                case 1: Console.WriteLine(); break;

                case 2:
                    Console.WriteLine("Toddler");
                    goto Cute;

                default:
                    Console.WriteLine("noting");
                    break;
            }



        Cute:
            Console.WriteLine("Toddlers are Cute");


            //Go to statements can cause nightmares.


            /* Looping  */

            int i = 0;

            while (i < 10)
            {
                if (i == 7)
                {
                    i++; continue; //continue makes the program ignore all the code thats after this piece of code. IT will increment to 8 and  go back to the loop.
                }

                if (i == 9) break;
                //It will get out of the loop

                if ((i % 2) > 0)
                {
                    Console.WriteLine(i);
                } //It will only print odd numbers...
                i++;
            }


                string guess;
                do
                {
                    Console.WriteLine("Guess a Number");
                    guess = Console.ReadLine();
                } while (!guess.Equals("15"));

                //It will do something at least once, before checking the condition inside the while loop.

                for (int iu = 0; iu < 10; iu++)
                {
                    if ((iu % 2) > 0)
                        Console.WriteLine(iu);
                }

                //foreach used in collections
                string randStr = "Here are some random characters";
                foreach (char c in randStr)
                {
                    Console.WriteLine(c);
                }

            }
        }
    }