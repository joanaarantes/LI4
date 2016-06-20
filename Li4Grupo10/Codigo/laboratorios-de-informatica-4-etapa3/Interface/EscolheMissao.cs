using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.IO;
using System.Windows.Forms;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using DataGridViewNumericUpDownElements;


namespace Interface
{

    public partial class EscolheMissao : Form
    {
        private Business.DataBaseUser _dataBase;
        public List<int> ids_dos_softwaresSeleccionados;
        public Dictionary<int, string> caracteristicas_escolhidas;
        public Dictionary<string, float> tabelaSmartNorm;
        public Dictionary<string, float> pesosFinaisClassAHP;
        public string metodo_fase_1 = "smart";
        public DataBase.QueryUser _queryUser;

        public Dictionary<int, Dictionary<string, float>> resultFinal;

        public EscolheMissao(Business.DataBaseUser dataBase, DataBase.QueryUser queryUser)
        {
            InitializeComponent();
            _dataBase = dataBase;
            _queryUser = queryUser;

            // estruturas auxiliares para calculo da decisão
            tabelaSmartNorm = new Dictionary<string, float>();

            Business.Astronauta user = _dataBase.User;
        }



        private void label3_Click(object sender, EventArgs e)
        {

        }


    }
}
