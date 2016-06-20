using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DataBase;


namespace Interface
{

    public partial class Init : Form
    {
        private Business.DataBaseUser _dataBase;
        private DataBase.Connect _conn;
        private DataBase.QueryUser _queryUser;

        public Init(Business.DataBaseUser dataBase, DataBase.Connect conn, DataBase.QueryUser queryUser)
        {
            InitializeComponent();
            textBoxPassword.PasswordChar = '*';

            // copia o apontador da data base recebida como parametro
            _dataBase = dataBase;
            _conn = conn;
            _queryUser = queryUser;

        }



        private void buttonLogin_Click(object sender, EventArgs e) {
            string name = textBoxUsername.Text;
            string pass = textBoxPassword.Text;
            String ID = textBox1.Text;

            bool login = false;
            login = _queryUser.queryAstronautaLogin(ID, pass);

            if (login) {
                Business.Astronauta u = _queryUser.login(ID,name,pass);
                _dataBase.User = u;
                MessageBox.Show("Login efetuado com sucesso");
                this.Dispose();
            }
            else {
                if (_queryUser.queryNASAadminLogin(ID, pass))
                {
                    Register r = new Register(_queryUser);
                    r.Show();
                }
                else MessageBox.Show("Login incorrecto");
            }
            
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }
    }
}

