using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;

namespace Business{


    [Serializable()]
    public class Missao : ISerializable{
        //TODO Uma missao tem?  verificar o DateTime
        private string ID;
        private string Nome;
        private string tipoMissao;
        private string idPercurso;

        private DateTime DataInicio;
        private DateTime DataFim;
        
        private List<string> idAstronautas;
        private List<string> materiaisNecessarios;




        /**
         * Constructor default
         * */
        public Missao(){
            ID    = "";
            Nome = "";
            tipoMissao = "";
            idPercurso = "";
            DataInicio = DateTime.Today;
            DataFim = DateTime.Today;
            idAstronautas=  new List<string>();
            materiaisNecessarios = new List<string>();

           
        }

        /**
         * Constructor with parameters
         * */
        public Missao( string id, string nome, string tipo, string idpercurso){
            ID       = id;
            Nome = nome;
            tipoMissao = tipo;
            idPercurso = idpercurso;
            idAstronautas=  new List<string>();
            materiaisNecessarios = new List<string>();
            
        }

        /**
         * Constructor with Missao
         * */
        public Missao(Missao u){
            ID       = u.Id;
            Nome = u.Nome;
            tipoMissao = u.tipoMissao;
            idPercurso = u.idPercurso;
            DataInicio = u.DataInicio;
            DataFim = u.DataFim;
            materiaisNecessarios = u.materiaisNecessarios;
            idAstronautas = u.idAstronautas;
        }

        //TODO falta completar com os novos parametros tambem
        /**
         * Deserialization Constructor 
         * */
        public Missao(SerializationInfo info, StreamingContext ctxt){
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

        public string NOME
        {
            get {
                return Nome;
            }
            set {
                Nome = value;
            }
        }

        public string TIPOMISSAO
        {
            get {
                return tipoMissao;
            }
            set {
                tipoMissao = value;
            }
        }
       
       public string IDPERCURSO
        {
            get {
                return idPercurso;
            }
            set {
                idPercurso = value;
            }
        }

        public void GetObjectData(SerializationInfo info, StreamingContext ctxt){
            info.AddValue("ID",       ID);
        }
        


        /**
        * Método que altera as Datas de inicio de uma missão.
        * Recebe como parametros dia, mes e ano.
        */
        public void AlteraDataInicio(int dia, int mes, int ano){

            DataInicio = new DateTime(ano, mes, dia);
        }

        /**
        * Método que altera as Datas de fim de uma missão.
        * Recebe como parametros dia, mes e ano.
        */
        public void AlteraDataFim(int dia, int mes, int ano){

            DataFim = new DateTime(ano, mes, dia);
        }

        /**
        * Método que adiciona o Id de um astronauta à lista de ID's de Astronauta pertencentes a esta missão.
        * Recebe como parametro o Id do astronauta.
        */
        public void addAstronauta(string idAstronauta){
             idAstronautas.Add(idAstronauta);
        }

        /**
        * Método que adiciona a descrição de um novo material verificado à lista de materiais que vão ser necessários nesta missão.
        * Recebe como parametro a descrição do material.
        */ 
        public void addMaterial(string descricao){
            materiaisNecessarios.Add(descricao);
        }


            /**
             * Method clone
             * */
        public Missao clone(){
            return new Missao(this);
        }

        //TODO
        public bool equals(Object o){
            if (this == o) return true;
            if (o == null || o.GetType()!= this.GetType()) return false;

            Missao u = (Missao) o;
            return ( ID.Equals(u.Id));
        }

        public string toString()
        {
            StringBuilder s = new StringBuilder("Missao\n");
            s.Append(ID);
            s.Append("\n");
            return s.ToString();
        }

    }
}
