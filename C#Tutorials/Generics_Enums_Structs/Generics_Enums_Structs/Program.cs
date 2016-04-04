using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


delegate double GetSum(double num1, double num2);


namespace Generics_Enums_Structs
{
    
    //Generic Classes
    class KeyValue<TKey, TValue>
    {
        public TKey key { get; set; }
        public TValue value { get; set; }

        public KeyValue(TKey k, TValue v)
        {
            key = k;
            value = v;
        }

        public void showData()
        {
        Console.WriteLine("{0} is {1} " , this.key, this.value);
        }

    }

    //Enum
    public enum Temperature
    {
        Freeze,
        Low,
        Warm,
        Boil
    }

    //Struct
    struct Costumers
    {
        private string name;
        private double balance;
        private int id;

        public void createCust(string n, double b, int i)
        {
            this.name = n;
            this.balance = b;
            id = i;
        }

        public void showCust()
        {
            Console.WriteLine("Name " + name);

            Console.WriteLine("Balance " + balance);

            Console.WriteLine("Id " + id);
        }
    }



   

    class Program
    {
        static void Main(string[] args)
        {
            KeyValue<string, string> superman = new KeyValue<string, string>("", "");

            superman.key = "Superman";
            superman.value = "Clark Kent";

            KeyValue<int, string> samsungTV = new KeyValue<int, string>(0, "");

            samsungTV.key = 12345;
            samsungTV.value = "a 50 in Samsung TV";

            superman.showData();
            samsungTV.showData();

            //Enum playing

            Temperature micTemp = Temperature.Warm;
            switch(micTemp)
            {
                case Temperature.Freeze:
                    Console.WriteLine("Temp on freezing");
                    break;
                case Temperature.Low:

                    Console.WriteLine("Temp on Low");
                    break;
                case Temperature.Warm:

                    Console.WriteLine("Temp on Warm");
                    break;
                case Temperature.Boil:

                    Console.WriteLine("Temp on Boil");
                    break;
                default:
                    Console.WriteLine("Temp on 0");
                    break;
            }

            //Struct playing
            Costumers bob = new Costumers();
            bob.createCust("Bob", 15.50, 12345);
            bob.showCust();

            //Anonymous delegate showing
            GetSum sum = delegate (double num1, double num2)
            {
                return num1 + num2;
            };

            Console.WriteLine("5 + 10 =" + sum(5, 10));

            //Lambda function Lambda Expressions
            Func<int, int, int> getSum = (x, y) => x + y;
            Console.WriteLine(" 5+3 = "+ getSum.Invoke(5, 3));

            List<int> numList = new List<int> { 5, 10, 15, 20, 25 };
            List<int> oddNums = numList.Where(n=> n % 2 == 1).ToList();

            foreach(int num in oddNums)
            {
                Console.WriteLine(num);
            }
        }

        
    }
}
