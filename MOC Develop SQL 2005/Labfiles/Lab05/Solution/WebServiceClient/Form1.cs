#region Using directives

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

#endregion

namespace WebServiceClient
{
	partial class Form1: Form
	{
		private DataSet productsDS;

		//Declare and initialize proxy object variable
		private sql_endpoint.AWProduction prxy = new sql_endpoint.AWProduction();

		public Form1()
		{
			InitializeComponent();

			// specify Web service security credentials
			prxy.Credentials = System.Net.CredentialCache.DefaultCredentials;
		}

		private void getProductsButton_Click(object sender, EventArgs e)
		{
				DisplayProducts();
		}
		private void DisplayProducts()
		{
			try
			{
				// call GetProducts Web method
				productsDS = prxy.GetProducts();

				productsGrid.DataSource = productsDS;
				productsGrid.DataMember = productsDS.Tables[0].TableName;
				productsGrid.Columns[0].ReadOnly = true;
				productsGrid.Columns[1].ReadOnly = true;
				productsGrid.Columns[1].Width = 200;
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.Message);
			}
		}

		private void productsGrid_Click(object sender, EventArgs e)
		{
		
		}

		private void productGrid_DellEndEdit(object sender, DataGridViewCellEventArgs e)
		{
			int productID = int.Parse(productsGrid.Rows[productsGrid.CurrentCell.RowIndex].Cells[0].Value.ToString());
			decimal newPrice = decimal.Parse(productsGrid.CurrentCell.Value.ToString());
			try
			{
				// Call UpdateProductPrice Web method
				prxy.UpdateProductPrice(productID, newPrice);

				MessageBox.Show("Price Updated");
			}
			catch (Exception ex)
			{
				MessageBox.Show("The price could not be changed", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
			}
			finally
			{
				DisplayProducts();
			}
		}    
	}
}