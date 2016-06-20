using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;

namespace Business
{
    [Serializable()]
    public class DataBaseManagement : ISerializable
    {
        private DataBaseUser _db;
        private Dictionary<string, Dictionary<string, int>> _tableSW;



        /**
         * Constructor default
         * */
        public DataBaseManagement() {
            _db = new DataBaseUser();
            _tableSW = new Dictionary<string,Dictionary<string,int>>();
            /*
            HardCodedAstronautas.Add("1", new Astronauta("Bobby Fischer",  "1", "1", "Gestor de Inventário"));
            HardCodedAstronautas.Add("2", new Astronauta("Anatoly Karpov", "2", "2", "Cartógrafo"));
            HardCodedAstronautas.Add("3", new Astronauta("Gary Kasparov",  "3", "3", "Geólogo"));
            HardCodedAstronautas.Add("4", new Astronauta("Judit Polgar",   "4", "4", "Médico"));
            */
            //HardCodedNASAFunc.Add("1", new NASAfunc("Magnus Carlsen", "1", "1"));
        }

        /**
         * Constructor with parameters
         * */
        public DataBaseManagement(DataBaseUser db, Dictionary<string, Dictionary<string, int>> tableSW)
        {
            _db = db;
            _tableSW = tableSW;
        }

        /**
         * Constructor with Value
         * */
        public DataBaseManagement(DataBaseManagement dbm)
        {
            _db = dbm.DB;
            _tableSW = dbm.TableSW;
        }

        /**
         * Deserialization Constructor 
         * */
        public DataBaseManagement(SerializationInfo info, StreamingContext ctxt)
        {
            _db = (DataBaseUser)info.GetValue("DB", typeof(DataBaseUser));
            _tableSW = (Dictionary<string, Dictionary<string, int>>)info.GetValue("TableSW", typeof(Dictionary<string, Dictionary<string, int>>));
        }


        public DataBaseUser DB
        {
            get { return _db; }
            set { _db = value; }
        }

        public Dictionary<string, Dictionary<string, int>> TableSW
        {
            get { return _tableSW; }
            set { _tableSW = value; }
        }

        public DataBaseUser GetChangableDB()
        {
            return _db;
            //ESTE MÉTODO AINDA NÃO ESTÁ IMPLEMENTADO
        }

        public void showChangableDB()
        {
            //ESTE MÉTODO AINDA NÃO ESTÁ IMPLEMENTADO
        }

        public void ValidateChanges()
        {
            //ESTE MÉTODO AINDA NÃO ESTÁ IMPLEMENTADO
        }

        public void ReadChar()
        {
            //ESTE MÉTODO AINDA NÃO ESTÁ IMPLEMENTADO
        }

        public void SaveDB()
        {
            //ESTE MÉTODO AINDA NÃO ESTÁ IMPLEMENTADO
        }

        public DataBaseUser NewDataBase(DataBaseUser db)
        {
            //?????
            return new DataBaseUser(db);
        }


        public void GetObjectData(SerializationInfo info, StreamingContext ctxt)
        {
            info.AddValue("DB", _db);
            info.AddValue("TableSW", _tableSW);
        }
        
    }
}
