using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Data.Sql;
using MySql.Data.MySqlClient;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace Automated_Voting_System
{
    public partial class Scanning : Form
    {
        string image_location;
        public Scanning()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog open = new OpenFileDialog();
                open.Filter = "Image Files(*.jpg; *.png; *.gif; *.bmp)|*.jpg; *.png; *.gif; *.bmp";
                if (open.ShowDialog() == DialogResult.OK)
                {
                    //finger_print = new Bitmap(open.FileName);
                    image_location = open.FileName.ToString();
                    pictureBox1.ImageLocation = image_location;
                }
            }
            catch (Exception)
            {
                throw new ApplicationException("Failed loading image");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            int voterid = Convert.ToInt32(random.Next(1000, 9999));
            MessageBox.Show("Voter ID : " + voterid, "Automated Voting System", MessageBoxButtons.OK, MessageBoxIcon.Information);
            if (pictureBox1.Image != null)
            {
                MySqlConnection con = new MySqlConnection("Uid=root;Pwd=chaitu;server=localhost;database=voting");
                byte[] image = Registration.image;
                MySqlCommand cmd = new MySqlCommand("insert into voterinfo values('" + voterid + "','" + Registration.name + "','" + Registration.father_name + "','" + Registration.mobile_no + "','" + Registration.gender + "','" + Registration.email + "','" + Registration.date_of_birth + "','" + Registration.age + "','" + Registration.address + "','@image','@img')", con);
                con.Open();
                try
                {
                    byte[] img = null;
                    FileStream fs = new FileStream(image_location, FileMode.Open, FileAccess.Read);
                    BinaryReader br = new BinaryReader(fs);
                    img = br.ReadBytes((Int32)fs.Length);
                    cmd.Parameters.Add("@img", SqlDbType.Image).Value = img;
                    cmd.Parameters.Add("@image", SqlDbType.Image).Value = image;
                    int res = cmd.ExecuteNonQuery();
                    MessageBox.Show("Voter Data Stored Successfully","Automated Voting System",MessageBoxButtons.OK,MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Voter Data Failed to Store", "Automated Voting System", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Select Finger Print Image","Automated Voting System",MessageBoxButtons.OK,MessageBoxIcon.Error);
            }
        }

        private void Scanning_FormClosing(object sender, FormClosingEventArgs e)
        {
           
        }
    }
}
