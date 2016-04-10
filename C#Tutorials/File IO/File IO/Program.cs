using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace File_IO
{
    class Program
    {
        static void Main(string[] args)
        {

            string[] custs = new string[] { "Tom", "Paul", "Greg" };

            using(StreamWriter sw = new StreamWriter("custs.txt"))
            {
                foreach(string cust in custs)
                {
                    sw.WriteLine(cust);
                }
            }

            string custName = "";
            using (StreamReader sr = new StreamReader("custs.txt"))
            {
                while((custName = sr.ReadLine()) != null)
                {
                    Console.WriteLine(custName);
                }
            }
        }
    }
}
