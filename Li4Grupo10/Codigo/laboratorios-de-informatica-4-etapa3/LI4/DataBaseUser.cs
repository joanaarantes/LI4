using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;
using System.Windows.Forms;

namespace Business
{
    [Serializable()]
    public class DataBaseUser : ISerializable
    {
        private Astronauta _user;
        private Dictionary<int, Missao> _software_list;
        private Dictionary<int, CadernoDeNotas> _charac;

        /**
         * Constructor default
         * */
        public DataBaseUser()
        {
            _user = new Astronauta();
            _software_list = new Dictionary<int, Missao>();
            _charac = new Dictionary<int, CadernoDeNotas>();
        }

        /**
         * Constructor with parameters
         * */
        public DataBaseUser(Astronauta user, Dictionary<int, Missao> software_list, Dictionary<int, CadernoDeNotas> charac)
        {
            _user = user;
            _software_list = software_list;
            _charac = charac;
        }

        /**
         * Constructor with Value
         * */
        public DataBaseUser(DataBaseUser db)
        {
            _user = db.User;
            _software_list = db.Software_list;
            _charac = db.Charac;
        }

        /**
         * Deserialization Constructor 
         * */
        public DataBaseUser(SerializationInfo info, StreamingContext ctxt)
        {
            _user = (Astronauta)info.GetValue("Astronauta", typeof(Astronauta));
            _software_list = (Dictionary<int, Missao>)info.GetValue("Missao_list", typeof(Dictionary<int, Missao>));
            _charac = (Dictionary<int, CadernoDeNotas>)info.GetValue("CadernoDeNotas", typeof(Dictionary<int, CadernoDeNotas>));
        }

        public Astronauta User
        {
            get {
                return _user;
            }
            set {
                _user = value;
            }
        }

        public Dictionary<int, Missao> Software_list
        {
            get { return _software_list; }
            set { _software_list = value; }
        }

        public Dictionary<int, CadernoDeNotas> Charac
        {
            get { return _charac; }
            set { _charac = value; }
        }

        public void AddSoftware(Missao s)
        {
            _software_list.Add(1, s);
        }

        public void RemoveSoftware(int id)
        {
            _software_list.Remove(id);
        }

        public Missao ViewSoftware(Missao s)
        {
            return s;
            //ESTE MÉTODO AINDA NÃO ESTÁ IMPLEMENTADO
        }

        public void RemoveChar(int id)
        {
            _charac.Remove(id);
        }

        public void filterDB()
        {
            //ESTE MÉTODO AINDA NÃO ESTÁ IMPLEMENTADO
        }

        public void saveInObject(String filename)
        {
            Stream stream = File.Open(filename, FileMode.Create);
            BinaryFormatter bformatter = new BinaryFormatter();

            bformatter.Serialize(stream, this);
            stream.Close();
        }




        public void GetObjectData(SerializationInfo info, StreamingContext ctxt)
        {
            info.AddValue("Astronauta", _user);
            info.AddValue("Charac", _charac);
            info.AddValue("Software_List", _software_list);
        }


        public string toString()
        {
            StringBuilder s = new StringBuilder("DATA BASE\n");
            s.Append(User.toString());
            s.Append("\n\nSOFTWARES:\n");
            foreach (Missao soft in _software_list.Values)
            {
                s.Append(soft.toString());
            }
            s.Append("\n\nCHARACTERISTICS:\n");
            foreach (CadernoDeNotas c in _charac.Values)
            {
                s.Append(c.toString());
            }
            return s.ToString();
        }

    }

}
