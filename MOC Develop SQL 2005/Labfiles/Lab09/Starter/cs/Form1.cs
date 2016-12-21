#region namespaces

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

#endregion

namespace SMOApplication
{
	partial class Form1: Form
	{
		public Form1()
		{
			InitializeComponent();
        }
        #region Declarations
        //Declare variables here


        #endregion

        #region Connect to Server

        private void connectButton_Click(object sender, EventArgs e)
        {
            //Add code to connect here


            DisplayServerInfo();
        }

        #endregion

        #region Display Sever Information

        private void DisplayServerInfo()
        {
            //Add code to display server version here
            


            databasesCombo.Items.Clear();
            //Add code to list server databases here
           


            databasesCombo.SelectedIndex = 0;

        }

        private void databasesCombo_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Add code to display tables in selected database here
           


        }

        #endregion

        #region Create Table

        private void addTableButton_Click(object sender, EventArgs e)
        {
            String tableName;
            String schemaName;
            String[] tableDetails;
            if (columnsGrid.Rows.Count < 2)
            {
                MessageBox.Show("Please specify column details");
            }
            else
            {
                if (tableNameText.Text.Contains("."))
                {
                    tableDetails = tableNameText.Text.Split(Char.Parse("."));
                }
                else
                {
                    tableDetails = new string[] { "dbo", tableNameText.Text };
                }
                schemaName = tableDetails[0];
                tableName = tableDetails[1];

                Boolean tableExists = true; ;
                //Check to see if table exists
                

                if (tableExists)
                {
                    MessageBox.Show("Table Already Exists");
                }
                else
                {
                    //Declare table and column variables here
                    


                    for (int i = 0; i <= columnsGrid.Rows.Count - 2; i++)
                    {
                        String colName = columnsGrid.Rows[i].Cells[0].Value.ToString();
                        String colType = columnsGrid.Rows[i].Cells[1].Value.ToString();
                        //Create column and add it to the table here
                        


                    }
                    //Create the table here
                    

                    MessageBox.Show("Table Created");
                    tablesList.Items.Clear();
                    foreach (Table t in db.Tables)
                    {
                        tablesList.Items.Add(t.Schema + "." + t.Name);
                    }

                }
            }

        }

        #endregion

    #region Modify database objects

        private void alterTableButton_Click(object sender, EventArgs e)
        {
            String tableName;
            String schemaName;
            String[] tableDetails;
            tableDetails = tablesList.SelectedItem.ToString().Split(Char.Parse("."));
            schemaName = tableDetails[0];
            tableName = tableDetails[1];
            Boolean tableExists = false;
            Boolean columnExists = false;

            //Declare table and column variables here
            


            //Verify the table exists here
            

            if (tableExists)
            {
                //Get the table here
                


                for (int i = 0; i <= columnsGrid.Rows.Count - 2; i++)
                {
                    String colName = columnsGrid.Rows[i].Cells[0].Value.ToString();
                    String colType = columnsGrid.Rows[i].Cells[1].Value.ToString();

                    //Get specified data type here
                    

                    //Check column exists here
                    

                    if (columnExists)
                    {
                        //Update data type here
                        
                    }
                    else
                    {
                        //Add the column to the table here
                        

                    }

                }
                //Alter the table here
                

                MessageBox.Show("The table has been altered");
            }

            else
            {
                MessageBox.Show("Table does not exist");
            }

        }

        private void dropTableButton_Click(object sender, EventArgs e)
        {
            String tableName;
            String schemaName;
            String[] tableDetails;
            tableDetails = tablesList.SelectedItem.ToString().Split(Char.Parse("."));
            schemaName = tableDetails[0];
            tableName = tableDetails[1];
            Boolean tableExists = false;
            //Verify the table exists here
            

            if (tableExists)
            {
                DialogResult result;
                result = MessageBox.Show("Are you sure you want to drop "
                    + tablesList.SelectedItem.ToString() + "?",
                    "Drop Table", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {

                    //Add code to drop the selected table here
                    


                    MessageBox.Show("Table dropped successfully");
                    tablesList.Items.Clear();
                    foreach (Table t in db.Tables)
                    {
                        tablesList.Items.Add(t.Schema + "." + t.Name);
                    }

                }
            }
            else
            {
                MessageBox.Show("Table does not exist");
            }

        }

    #endregion








    }
}