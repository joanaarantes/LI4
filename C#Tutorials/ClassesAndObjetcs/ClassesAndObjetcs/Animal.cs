using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesAndObjetcs
{
    class Animal
    {
        public double height { get; set; }
        public double weight { get; set; }
        public string sound { get; set; }

        public string name;
        public string Name
        {
            get { return name; }
            set { name = value; }

        }

        //Default constructor
        public Animal()
        {
            this.height = 0;
            this.weight = 0;
            this.name = "No name";
            this.sound = "No sound";
            numOfAnimals++;
        }
        //Parametric constructor
        public Animal(double height, double weight, string name, string sound)
        {
            this.height = height;
            this.weight = weight;
            this.name = name;
            this.sound = sound;
            numOfAnimals++;
        }

        //Static fields shared by every object
        static int numOfAnimals = 0;

        public static int getNumOfAnimals()
        {
            return numOfAnimals;
        }

         
        public string toString()
        {
            return String.Format("{0} is {1} inches tall, weights {2} lbs and likes to say {3}" , name, height, weight, sound );
        }


        //Overloading
        //default values being given inside the parameters
        public int getSum(int num1 = 1, int num2 = 1)
        {
            return num1 + num2;
        }
        //Method overloading , having the same name for the method but diferent return type
        public double getSum(double num1=1, double num2 = 1)
        {
            return num1 + num2;
        }


        static void Main(string[] args)
        {

            Animal spot = new Animal(15, 10, "Spot", "Woof");
            Console.WriteLine("{0} says {1}", spot.name, spot.sound);

            Console.WriteLine("Number os Animals " + Animal.getNumOfAnimals());

            Console.WriteLine(spot.toString());

            Console.WriteLine(spot.getSum(num2: 1.4, num1: 2.7));


            Animal grover = new Animal
            {
                name = "Grover",
                height = 16,
                weight = 18,
                sound = "grr"
            };

            Dog spike = new Dog();
            Console.WriteLine(spike.toString());
            spike = new Dog(20, 15, "Spike", "Grr", "chicken");
            //over ridden the Dog
            Console.WriteLine(spike.toString());

            /* Ploymorphism has been taught */





            //Playing with shapes
            Shape rect = new Rectangle(5, 5);
            Shape tri = new Triangle(5, 5);
            //This is polymorphism

            Console.WriteLine("Rect Area " + rect.area());
            Console.WriteLine("Tri Area " + tri.area());

            Rectangle combRect = new Rectangle(5, 5) + new Rectangle(5, 5);
            Console.WriteLine("CombRect Area " + combRect.area());


        }
    }



    //Subclass of animal
    class Dog : Animal
    {
        public string favFood { get; set; }

        public Dog() : base()
        {
            this.favFood = "No favorite Food";
        }

        public Dog(double height, double weight, string name, string sound, string favFood) : base(height, weight, name, sound)
        {
            this.favFood = favFood;
        }

        //Overriding method
        new public string toString()
        {
            return String.Format("{0} is {1} inches tall, weights {2} lbs and likes to say {3} and eats {4}", name, height, weight, sound, favFood);

        }


    }

    /* Abstract Class */
    abstract class Shape
    {
        public abstract double area();

        public void sayHi()
        {
            Console.WriteLine("Hello");
        }
    }


    /* Interface */

    public interface ShapeItem
    {
        //Abstract methods are everything we put inside an interface

        double area();

    }


    class Rectangle : Shape
    {
        private double length;
        private double width;

        public Rectangle(double num1, double num2)
        {
            length = num1;
            width = num2;
        }
        public override double area()
        {
            return length * width;
        }

        //Operator Overloading
        public static Rectangle operator +(Rectangle rect1, Rectangle rect2)
        {
            double rectLength = rect1.length + rect2.length;
            double rectWidth = rect1.width + rect2.width;

            return new Rectangle(rectLength, rectWidth);
        }

    }


    class Triangle : Shape
    {
        private double theBase;
        private double height;

        public Triangle(double num1, double num2)
        {
            height = num1;
            theBase = num2;
        }
        public override double area()
        {
            return height*theBase;
        }

        

    }



}
