using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Interface
{
    public partial class Register : Form
    {
        public DataBase.QueryUser _queryUser;

        public Register(DataBase.QueryUser queryUser)
        {
            InitializeComponent();
            textBoxPassword.PasswordChar = '*';
            textBoxPassword.MaxLength = 10;
            textBoxPasswordConfirmation.PasswordChar = '*';
            //textBoxPasswordConfirmation.MaxLength = 10;

            _queryUser = queryUser;
        }



        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void buttonOk_Click(object sender, EventArgs e)
        {

            string name = textBoxUserName.Text;
            string ID = textBoxEmail.Text;
            string password = textBoxPassword.Text;
            string passwordConfirmation = textBoxPasswordConfirmation.Text;

            MessageBox.Show("Credenciais a enviar para a Base de Dados\n"+name+"\n"+ID+"\n"+password+"\n"+passwordConfirmation);

            bool r = _queryUser.queryUserLoginUsername(ID);
            if (r)
            {
                MessageBox.Show("Este Astronauta já se encontra registado.");
            }
            else
            {
                if (!name.Equals("") && !ID.Equals("") && password.Equals(passwordConfirmation))
                {
                    _queryUser.insertUser(name, ID, password);
                    MessageBox.Show("Astronauta registado com sucesso.");
                }
                else
                {
                    MessageBox.Show("Informação incorreta.");
                }
            }
            

        }




        private void Register_Load(object sender, EventArgs e)
        {

        }


    }
}
