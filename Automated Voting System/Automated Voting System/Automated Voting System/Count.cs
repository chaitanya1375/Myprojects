﻿using System;
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
    public partial class Count : Form
    {
        public Count()
        {
            InitializeComponent();
        }

        private void Search_FormClosing(object sender, FormClosingEventArgs e)
        {
            Form1 main = new Form1();
            main.Visible = true;
        }
    }
}
