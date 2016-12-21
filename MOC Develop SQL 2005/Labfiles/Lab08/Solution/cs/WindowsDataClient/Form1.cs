#region Using directives

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

#endregion

namespace WindowsDataClient
{
	partial class Form1: Form
	{
		public Form1()
		{
			InitializeComponent();
		}

        private void Form1_Load(object sender, EventArgs e)
        {
            getProductsTableAdapter.Fill(productsDS);
        }

        private void dataNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            getProductsTableAdapter.Update(productsDS);
        }    
	}
}