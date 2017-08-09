using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;
using Check;

namespace WindowsFormsApplication1
{
    public partial class EnterPassword : Form
    {
        public EnterPassword()
        {
            InitializeComponent();
        }

        SqlConnection con = new SqlConnection(@"Data Source=ADMIN-PC\SQLEXPRESS;Initial Catalog=ThreeLevelDB;Integrated Security=True");

        private void button1_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("select * from Img where userid =@userid", con);
            cmd.Parameters.AddWithValue("@userid", txtu.Text);
            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                this.Hide();
                Test r = new Test(txtu.Text);
                r.Show();
            }
            else
            {
                MessageBox.Show("Invalid ID", "ERROR !!!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void EnterPassword_Load(object sender, EventArgs e)
        {
            #region System Generated
            Class1 c = new Class1();
            bool c1 = c.check("W24", con);
            if (!c1)
            {
                Application.Exit();
            }
            #endregion
        }

    }
}
