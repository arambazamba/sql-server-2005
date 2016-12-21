#region namespaces
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Common;

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
        SqlConnectionInfo connInfo;
        ServerConnection svrConn;
        Server svr;
        Database db;


        #endregion

        #region Connect to Server

        private void connectButton_Click(object sender, EventArgs e)
        {
            //Add code to connect here
            connInfo = new SqlConnectionInfo(serverText.Text);
            connInfo.ApplicationName = "SMO Application";
            connInfo.EncryptConnection = encryptBox.Checked;
            svrConn = new ServerConnection(connInfo);
            svr = new Server(svrConn);


            DisplayServerInfo();

        }

        #endregion

        #region Display Sever Information

        private void DisplayServerInfo()
        {
            //Add code to display server version here
            serverVersionLabel.Text = svr.Information.Product + 
              " " +  svr.Information.VersionString;


            databasesCombo.Items.Clear();
            //Add code to list server databases here
            foreach (Database dbase in svr.Databases)
            {
                databasesCombo.Items.Add(dbase.Name);
            }       


            databasesCombo.SelectedIndex = 0;

        }
        
        private void databasesCombo_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Add code to display tables in selected database here
            db = svr.Databases[databasesCombo.Text];
            tablesList.Items.Clear();
            foreach (Table tbl in db.Tables)
            {
                tablesList.Items.Add(tbl.Schema + "." + tbl.Name);
            }


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

            Boolean tableExists = true; 
            //Check to see if table exists
            tableExists = db.Tables.Contains(tableName, schemaName);

            if (tableExists)
            {
                MessageBox.Show("Table Already Exists");
            }
            else
            {
                //Declare table and column variables here
                Table tbl = new Table(db, tableName, schemaName);
                Column col;


                for (int i = 0; i <=columnsGrid.Rows.Count - 2 ; i++)
                {
                    String colName = columnsGrid.Rows[i].Cells[0].Value.ToString();
                    String colType = columnsGrid.Rows[i].Cells[1].Value.ToString();
                    //Create column and add it to the table here
                    col = new Column(tbl, colName);
                    switch(colType)
                    {
                        case  "integer":
                            col.DataType = DataType.Int;
                            break;
                        case "nvarchar":
                            col.DataType = DataType.NVarChar(50);
                            break;
                        case "money":
                            col.DataType = DataType.Money;
                            break;
                        default:
                            col.DataType = DataType.NVarCharMax;
                            break;
                    }
                    tbl.Columns.Add(col);


                }
                //Create the table here
                tbl.Create();

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
        Boolean tableExists  = false;
        Boolean columnExists  = false;

        //Declare table and column variables here
        Table tbl;
        Column col;


        //Verify the table exists here
        tableExists = db.Tables.Contains(tableName, schemaName);

        if (tableExists)
        {
            //Get the table here
            tbl = db.Tables[tableName, schemaName];


            for (int i = 0; i <= columnsGrid.Rows.Count - 2; i++)
            {
                String colName = columnsGrid.Rows[i].Cells[0].Value.ToString();
                String colType = columnsGrid.Rows[i].Cells[1].Value.ToString();

                //Get specified data type here
                DataType specifiedType;
                switch (colType)
                {
                    case "integer":
                        specifiedType = DataType.Int;
                        break;
                    case "nvarchar":
                        specifiedType = DataType.NVarChar(50);
                        break;
                    case "money":
                        specifiedType = DataType.Money;
                        break;
                    default:
                        specifiedType = DataType.NVarCharMax;
                        break;
                }

                //Check column exists here
                columnExists = tbl.Columns.Contains(colName);

                if (columnExists)
                {
                    //Update data type here
                    tbl.Columns[colName].DataType = specifiedType;
                }
                else
                {
                    //Add the column to the table here
                    col = new Column(tbl, colName, specifiedType);
                    tbl.Columns.Add(col);

                }

            }
            //Alter the table here
            tbl.Alter();

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
            Boolean tableExists  = false;
            //Verify the table exists here
            tableExists = db.Tables.Contains(tableName, schemaName);

            if (tableExists)
            {
                DialogResult result;
                result = MessageBox.Show("Are you sure you want to drop "
                    + tablesList.SelectedItem.ToString() + "?",
                    "Drop Table", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {

                    //Add code to drop the selected table here
                    db.Tables[tableName, schemaName].Drop();

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