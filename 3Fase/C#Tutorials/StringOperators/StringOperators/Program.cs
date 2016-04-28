using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StringOperators
{
    class Program
    {
        static void Main(string[] args)
        {
            string sampString = "A bunch of random words";
            Console.WriteLine("Is empty: " + String.IsNullOrEmpty(sampString));
            Console.WriteLine("Is empty: " + String.IsNullOrWhiteSpace(sampString));
            Console.WriteLine("String Length: " + sampString.Length);

            Console.WriteLine("Index of bunch " + sampString.IndexOf("bunch"));
            Console.WriteLine("2nd Word " + sampString.Substring(2, 6));

            string sampString2 = "More random words";
            Console.WriteLine("Strings Equal :" + sampString.Equals(sampString2));
            Console.WriteLine("Starts with \"A bunch\"" + sampString.StartsWith("A bunch"));
            Console.WriteLine("Ends with words  " + sampString.EndsWith("words"));


            sampString = sampString.Trim(); //TrimEnd TrimStart
            Console.WriteLine(sampString);

            sampString = sampString.Replace("words", "characters");
            Console.WriteLine(sampString);

            sampString = sampString.Remove(0, 2);
            Console.WriteLine(sampString);

            string[] names = new string[3] { "Matt", "Joe", "Paul" };

            Console.WriteLine("Name List " + String.Join(",", names));
            string fmrStr = String.Format("{0:c} {1:00.00} {2:%.00} {3:0,0}", 1.56, 15.567, .56, 1000);
            Console.WriteLine(fmrStr);

            /* String Builder */

            StringBuilder sb = new StringBuilder();
            sb.Append("This is the first sentence");
            sb.AppendFormat("My name is {0} and I live in {1} ", "Derek", "Pennsylvania");
            //sb.Clear();
            sb.Replace("a", "e");

            sb.Remove(5, 7); //from 5 til not included 7 

            Console.WriteLine(sb.ToString());



            /* Arrays */

            int[] randNumArray;

            int[] randArray = new int[10];
            int[] randArray2 = { 1, 2, 3, 4, 5 };

            Console.WriteLine("Array Length " + randArray2.Length);
            Console.WriteLine("Item 0" + randArray2[0] );

            for(int i = 0; i < randArray2.Length; i++)
            {
                Console.WriteLine("{0} : {1}", i, randArray2[i]);
            }

            foreach(int num in randArray2)
            {
                Console.Write(num + " ");
            }

            Console.WriteLine("Where is 1 " + Array.IndexOf(randArray2, 1));
            string[] namess = { "Tom", "Ron", "Jessica" };
            string nameStr = string.Join(",", namess);
            string[] nameArray = nameStr.Split(',');


            int[,] multArray = new int[5, 3];
            int[,] multArray2 = { { 0, 1 }, { 2, 3 }, { 4, 5 } };

            foreach(int num in multArray2)
            {
                Console.WriteLine(num);
            }

            for(int x=0; x<multArray2.GetLength(0); x++)
            {
                for(int y=0; y< multArray2.GetLength(1); y++)
                {
                    Console.WriteLine("{0} | {1} : {2}", x, y, multArray2[x,y]);
                }
            }
        }
    }
}
