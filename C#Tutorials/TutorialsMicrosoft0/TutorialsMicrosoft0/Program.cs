using System;


namespace TutorialsMicrosoft
{
    public class Program
    {

        private string myName = "N/A";
        private int myAge = 0;

        // Declare a Name property of type string:
        public string Name
        {
            get
            {
                return myName;
            }
            set
            {
                myName = value;
            }
        }

        // Declare an Age property of type int:
        public int Age
        {
            get
            {
                return myAge;
            }
            set
            {
                myAge = value;
            }
        }

        public override string ToString()
        {
            return "Name = " + Name + ", Age = " + Age;
        }

        //Main function for the tutorial basics
        public static void Main()
        {
            System.Console.WriteLine("Hello Console!");
            //printing to the console


            int[] table = new int[10];
            for (int i = 0; i < 10; i++)
            {
                table[i] = 15;
            }
            //arrays and acessing to it.


            System.Console.WriteLine("Table array is " + table.Length + " length");

            foreach (int i in table)
             System.Console.WriteLine(i);
            //using foreach

            //
            Console.WriteLine("Simple Properties");

            // Create a new Person object:
            Program person = new Program();

            // Print out the name and the age associated with the person:
            Console.WriteLine("Person details - {0}", person);

            // Set some values on the person object:
            person.Name = "Joe";
            person.Age = 99;
            Console.WriteLine("Person details - {0}", person);

            // Increment the Age property:
            person.Age += 1;
            Console.WriteLine("Person details - {0}", person);
        }



    }

    //TODO https://msdn.microsoft.com/en-us/library/aa288479(v=vs.71).aspx
}

