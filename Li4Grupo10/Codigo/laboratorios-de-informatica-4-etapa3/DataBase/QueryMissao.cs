using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace DataBase
{
    public class QueryMissao : Connect
    {
        /*Construtor */
        public QueryMissao()
            : base()
        {

        }

        /*Construtor*/
        public QueryMissao(SqlConnection myConnection)
        {
            this.MyConnection = myConnection;
        }

        /*Selecciona as missoes em que um astroMosso participa(ou) */
        public DataTable queryMissoesAstronauta(string ID)
        {
            string select = "SELECT Missao.id_missao AS ID, Missao.descricao AS DESCRICAO " +
                                    "FROM [LI4].[dbo].[Missao]   " +
                                        "WHERE ID = '" + ID + "' ";
            SqlDataReader mySoftware = executeQuery(select);
            DataTable tabelaMissao = new DataTable();
            tabelaMissao.Load(mySoftware);

            foreach (DataRow linha in tabelaMissao.Rows)
            {
                Console.WriteLine("\n\nLinha");
                foreach (var valor in linha.ItemArray)
                {
                    Console.Write(valor + "\t");
                }
            }

            return tabelaMissao;
        }


        public void querymissaousercatalogo(Business.DataBaseUser base_dados)
        {
            // username do utilizador
            string username = base_dados.User.Username;

            // softwares que o utilizador possui
            DataTable softwares = queryMissoesAstronauta(username);

            // ids das caracteristicas que esses softwares tem
            DataTable ids_caracteristicas = queryID_Caracteristicas_Lista_Softwares(softwares);

            // agora é preciso pegar nesses ids e procurar na tabela de caracteristicas
            Dictionary<int, Business.CadernoDeNotas> car = queryCriar_as_caracteristicas(ids_caracteristicas);

            /*
            MessageBox.Show("Aqui_1");
            foreach (Business.Characteristic c in car.Values)
            {
                MessageBox.Show(c.toString());
            }
            */
            base_dados.Charac = car;
        }




        /* cria uma tabela com os ids das caracteristicas que uma lista de softwares possui */
        public DataTable queryID_Caracteristicas_Lista_Softwares(DataTable softwares)
        {
            DataTable result = new DataTable();

            try
            {
                // id do software para procurar as caracteristicas
                DataRow linha = softwares.Rows[0];
                int id_software = (int)linha["ID"];

                string select_caracteristicas_de_um_software = @" SELECT software_list.caracteristics_id 
                                                                FROM [LI4].[dbo].[software_list], [LI4].[dbo].[software] 
                                                                WHERE software_list.id_software =" + id_software +
                                                                    " AND software_list.id_software = software.id_software";
                // tabela com todos os ids_desse software
                result = executeQuery_DataTable(select_caracteristicas_de_um_software);
            }
            catch (Exception e)
            {
                MessageBox.Show("Não contêm caracteristicas associadas ao utilizador!");
                Console.WriteLine(e.Message);
            }
            return result;
        }

        /* pega numa tabela com os ids das caracteristicas e vai criar um Dictionary com as caracteristicas */
        public Dictionary<int, Business.CadernoDeNotas> queryCriar_as_caracteristicas(DataTable ids_caracteristicas)
        {
            Dictionary<int, Business.CadernoDeNotas> caracteristicas = new Dictionary<int, Business.CadernoDeNotas>();

            foreach (DataRow linha in ids_caracteristicas.Rows)
            {
                // através do id vai criar uma caracteristica
                int id = (int)linha[0];
            }

            return caracteristicas;
        }

        /*#############################################################################################*/

        // recebe uma query e executa
        public SqlDataReader executeQuery(string select)
        {
            SqlDataReader mySoftware = null;

            SqlCommand myCommand = new SqlCommand(select, _myConnection);
            mySoftware = myCommand.ExecuteReader();

            return mySoftware;

        }


        // recebe uma query, executa e devolve uma tabela com os resultados
        public DataTable executeQuery_DataTable(string select)
        {
            SqlDataReader mySoftware = null;

            SqlCommand myCommand = new SqlCommand(select, _myConnection);
            mySoftware = myCommand.ExecuteReader();


            DataTable result = new DataTable();
            result.Load(mySoftware);

            return result;
        }

    }
}
