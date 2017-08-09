using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace Automated_Voting_System
{
    public partial class Registration : Form
    {
        public static string name;
        public static string father_name;
        public static string mobile_no;
        public static string gender;
        public static string email=null;
        public static string date_of_birth;
        public static string age;
        public static string address;
        //public static PictureBox image;
        public static byte[] image;
        
        public Registration()
        {
            InitializeComponent();
        }

        private void Registration_Closing(object sender, FormClosingEventArgs e)
        {
            Form1 main = new Form1();
            main.Visible = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                string image_location;
                OpenFileDialog open = new OpenFileDialog();
                open.Filter = "Image Files(*.jpg; *.png; *.gif; *.bmp)|*.jpg; *.png; *.gif; *.bmp";
                if (open.ShowDialog() == DialogResult.OK)
                {
                    image_location = open.FileName.ToString();
                    pictureBox2.ImageLocation = image_location;
                    FileStream fs = new FileStream(image_location, FileMode.Open, FileAccess.Read);
                    BinaryReader br = new BinaryReader(fs);
                    image = br.ReadBytes((Int32)fs.Length);
                }
            }
            catch (Exception)
            {
                throw new ApplicationException("Failed loading image");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            name = textBox1.Text +" "+ textBox2.Text;
            father_name = textBox3.Text;
            mobile_no = textBox4.Text;

            if (radioButton1.Checked)
            {
                gender = "male";
            }
            else
            {
                gender = "female";
            }

            email = textBox5.Text;
            date_of_birth = this.dateTimePicker1.Text;
            age = textBox7.Text;
            address = textBox6.Text;

            if (textBox1.TextLength == 0 || textBox2.TextLength == 0 || textBox3.TextLength == 0 || textBox4.TextLength == 0 || textBox6.TextLength == 0 || textBox7.TextLength == 0 || (radioButton1.Checked == false && radioButton2.Checked==false) || pictureBox2.Image == null)
            {
                MessageBox.Show("All fileds are Mandatory except E-Mail","Automated Voting System", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                Scanning scan = new Scanning();
                scan.Show();
            }
        }
    }
}
