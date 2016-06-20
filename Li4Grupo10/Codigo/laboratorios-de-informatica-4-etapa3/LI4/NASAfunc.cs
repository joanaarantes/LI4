using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;

namespace Business{

    [Serializable()]
    public class NASAfunc : ISerializable{
        private string username;
        private string ID;
        private string password;

        /**
         * Constructor default
         * */
        public NASAfunc(){
            username = "";
            ID       = "";
            password = "";
        }

        /**
         * Constructor with parameters
         * */
        public NASAfunc(string name, string id, string pass){
            username = name;
            ID       = id;
            password = pass;
        }

        /**
         * Constructor with Astronauta
         * */
        public NASAfunc(NASAfunc u){
            username = u.Username;
            ID       = u.Id;
            password = u.Password;
        }

        /**
         * Deserialization Constructor 
         * */
        public NASAfunc(SerializationInfo info, StreamingContext ctxt){
            username = (string)info.GetValue("Username", typeof(string));
            ID       = (string)info.GetValue("ID",       typeof(string));
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
        public NASAfunc clone(){
            return new NASAfunc(this);
        }

        public bool equals(Object o){
            if (this == o) return true;
            if (o == null || o.GetType()!= this.GetType()) return false;

            NASAfunc u = (NASAfunc) o;
            return (username.Equals(u.Username) && ID.Equals(u.Id) && password.Equals(u.Password));
        }

        public string toString()
        {
            StringBuilder s = new StringBuilder("Funcionário NASA\n");
            s.Append(username);
            s.Append("\n");
            s.Append(ID);
            return s.ToString();
        }

    }
}
