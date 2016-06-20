using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;

namespace Business{

    /**
    * Um Astronauta deve conter um ID e a sua password. Estes são os dados com que deve realizar o seu login.
    * Username diz respeito ao nome ou nickname/ alcunha que pode ser introduzida por este mais tarde. 
    * O tipo diz respeito ao cargo que ocupa ou ao tipo de astronauta que o caracteriza.
    */
    [Serializable()]
    public class Astronauta : ISerializable{
        private string username;
        private string ID;
        private string password;
        private string tipo;

        /**
         * Constructor default
         * */
        public Astronauta(){
            username = "";
            ID       = "";
            tipo     = "";
            password = "";
        }

        /**
         * Constructor with parameters
         * */
        public Astronauta(string name, string id, string pass, string t){
            username = name;
            ID       = id;
            tipo     = t;
            password = pass;
        }

        /**
         * Constructor with Astronauta
         * */
        public Astronauta(Astronauta u){
            username = u.Username;
            ID       = u.Id;
            tipo     = u.Tipo;
            password = u.Password;
        }

        //TODO falta completar com os novos parametros tambem
        /**
         * Deserialization Constructor 
         * */
        public Astronauta(SerializationInfo info, StreamingContext ctxt){
            username = (string)info.GetValue("Username", typeof(string));
            ID       = (string)info.GetValue("ID",       typeof(string));
            tipo     = (string)info.GetValue("tipo",     typeof(string));
            password = (string)info.GetValue("Password", typeof(string));
        }

        /**
         * Methods get and set
         * */
        public string Username
        {
            get {
                return username;
            }
            set {
                username = value;
            }
        }

        public string Id
        {
            get {
                return ID;
            }
            set {
                ID = value;
            }
        }

        public string Tipo
        {
            get
            {
                return tipo;
            }
            set
            {
                tipo = value;
            }
        }

        public string Password
        {
            get {
                return password;
            }
            set {
                password = value;
            }
        }




        public void GetObjectData(SerializationInfo info, StreamingContext ctxt){
            info.AddValue("Username", username);
            info.AddValue("ID",       ID);
            info.AddValue("Password", password);
        }
        



            /**
             * Method clone
             * */
        public Astronauta clone(){
            return new Astronauta(this);
        }

        //TODO
        public bool equals(Object o){
            if (this == o) return true;
            if (o == null || o.GetType()!= this.GetType()) return false;

            Astronauta u = (Astronauta) o;
            return (username.Equals(u.Username) && ID.Equals(u.Id) && password.Equals(u.Password));
        }

        public string toString()
        {
            StringBuilder s = new StringBuilder("Astronauta\n");
            s.Append(username);
            s.Append("\n");
            s.Append(ID);
            return s.ToString();
        }

    }
}
