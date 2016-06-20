using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;

namespace Business{


    [Serializable()]
    public class CadernoDeNotas : ISerializable{
        //TODO Registos textuais, fotos e audio, como guardar?
        private string ID;

        /**
         * Constructor default
         * */
        public CadernoDeNotas(){
            ID       = "";
           
        }

        /**
         * Constructor with parameters
         * */
        public CadernoDeNotas( string id){
            ID       = id;
            
        }

        /**
         * Constructor with CadernoDeNotas
         * */
        public CadernoDeNotas(CadernoDeNotas u){
            ID       = u.Id;
        }

        //TODO falta completar com os novos parametros tambem
        /**
         * Deserialization Constructor 
         * */
        public CadernoDeNotas(SerializationInfo info, StreamingContext ctxt){
            ID       = (string)info.GetValue("ID",       typeof(string));
        }

        /**
         * Methods get and set
         * */

        public string Id
        {
            get {
                return ID;
            }
            set {
                ID = value;
            }
        }

       

        public void GetObjectData(SerializationInfo info, StreamingContext ctxt){
            info.AddValue("ID",       ID);
        }
        



            /**
             * Method clone
             * */
        public CadernoDeNotas clone(){
            return new CadernoDeNotas(this);
        }

        //TODO
        public bool equals(Object o){
            if (this == o) return true;
            if (o == null || o.GetType()!= this.GetType()) return false;

            CadernoDeNotas u = (CadernoDeNotas) o;
            return ( ID.Equals(u.Id));
        }

        public string toString()
        {
            StringBuilder s = new StringBuilder("CadernoDeNotas\n");
            s.Append(ID);
            s.Append("\n");
            return s.ToString();
        }

    }
}
