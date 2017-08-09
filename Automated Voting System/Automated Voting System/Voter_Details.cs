using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.Sql;
using MySql.Data.MySqlClient;
using System.IO;

namespace Automated_Voting_System
{
    public partial class Voter_Details : Form
    {
        public Voter_Details()
        {
            InitializeComponent();
        }

        private void Voting_FormClosing(object sender, FormClosingEventArgs e)
        {
            Form1 main = new Form1();
            main.Visible = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection("Uid=root;Pwd=ChinnU;server=localhost;database=registration");
            MySqlCommand cmd = new MySqlCommand("select * from voterinfo where voterid= "+textBox1.Text, con);
            
            try
            {
                con.Open();
                MySqlDataReader sdr = cmd.ExecuteReader();
                

               if (sdr.HasRows) 
               {
                   sdr.Read();
                   label9.Text = sdr[1].ToString();
                   label10.Text = sdr[2].ToString();
                   label11.Text = sdr[3].ToString();
                   label12.Text = sdr[4].ToString();
                   label13.Text = sdr[5].ToString();
                   label14.Text = sdr[6].ToString();
                   label15.Text = sdr[7].ToString();

                   byte[] img = (byte[])(sdr["image"]);
                   MemoryStream ms = new MemoryStream((byte[])sdr["image"]);
                   pictureBox1.Image = Image.FromStream(ms);

               }
                
             
            }    
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
           
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Voting vote = new Voting();
            vote.Show();
        }
    }
}
