using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace DataBase
{

    public class QueryUser : Connect
    {
        public QueryUser()
            : base()
        {

        }


        public QueryUser(SqlConnection myConnection)
        {
            this.MyConnection = myConnection;
        }


        /* Query que pergunta se existe um astromosso com aquele username e password */
        public bool queryAstronautaLogin(string ID, string password)
        {
            // resultado
            bool r = false;
            SqlDataReader myReader = null;
            string select = "SELECT [ID] AS ID " +
                                    "FROM [LI4].[dbo].[Astronauta] " +
                                        "WHERE ID = '" + ID + "' " +
                                        "AND password='" + password + "'";

            SqlCommand myCommand = new SqlCommand(select, _myConnection);
            myReader = myCommand.ExecuteReader();

            // se tiver algo para ler é porque existe o utilizador
            if (myReader.Read()) r = true;

            return r;
        }

        /* Query que pergunta se existe um NASA func com aquele username e password */
        public bool queryNASAadminLogin(string ID, string password)
        {
            // resultado
            bool r = false;
            SqlDataReader myReader = null;
            string select = "SELECT [ID] AS ID " +
                                    "FROM [LI4].[dbo].[NASAadmin] " +
                                        "WHERE ID = '" + ID + "' " +
                                        "AND password='" + password + "'";

            SqlCommand myCommand = new SqlCommand(select, _myConnection);
            myReader = myCommand.ExecuteReader();

            // se tiver algo para ler é porque existe o utilizador
            if (myReader.Read()) r = true;

            return r;
        }

        /* Verifica se já está registado na base de dados */
        public bool queryUserLoginUsername(string ID)
        {
            // resultado
            bool r = false;
            SqlDataReader myReader = null;
            string select = "SELECT [ID] AS ID " +
                                    "FROM [LI4].[dbo].[Astronauta] " +
                                        "WHERE ID = '" + ID + "' ";

            SqlCommand myCommand = new SqlCommand(select, _myConnection);
            myReader = myCommand.ExecuteReader();

            // se tiver algo para ler é porque existe o utilizador
            if (myReader.Read()) r = true;

            return r;
        }

        /*Cria um User com os dados da Base de Dados*/
        public Business.Astronauta login(string ID, string nome, string password)
        {
            Business.Astronauta u = new Business.Astronauta();
            SqlDataReader myReader = null;
            string select = "SELECT [nome] AS NOME, [password] AS PASSWORD, [ID] AS ID" +
                                " FROM [LI4].[dbo].[Astronauta] " +
                                " WHERE nome = '" + nome + "' " +
                                    "AND password = '" + password + "'" +
                                    "AND ID       = '" + ID       + "'";
            SqlCommand myCommand = new SqlCommand(select, _myConnection);
            myReader = myCommand.ExecuteReader();

            while (myReader.Read())
            {
                u.Username = (string)myReader["USERNAME"];
                u.Password = (string)myReader["PASSWORD"];
                u.Id = (string)myReader["ID"];
            }

            return u;
        }

        /*Insere um user*/
        public bool insertUser(string username, string ID, string password)
        {
            
            string insert = @"INSERT INTO [LI4].[dbo].[Astronauta] VALUES ('" + username + "','" + password + "','" + ID + "',CURRENT_TIMESTAMP);";
            MessageBox.Show(insert);

            SqlCommand command = new SqlCommand(insert, _myConnection);

            SqlTransaction tr = _myConnection.BeginTransaction();
            command.Transaction = tr;

            try
            {
                command.ExecuteNonQuery();
                
                tr.Commit();
                MessageBox.Show("Efectuado");
                return true;
            }
            catch (SqlException e)
            {
                tr.Rollback();
                return false;
            }

        }


    }
}
