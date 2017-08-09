using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Automated_Voting_System
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Visible=false;
            Registration register = new Registration();
            register.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            Voter_Details vote = new Voter_Details();
            vote.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            Update update = new Update();
            update.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            Count search = new Count();
            search.Show();
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        } 
    }
}
