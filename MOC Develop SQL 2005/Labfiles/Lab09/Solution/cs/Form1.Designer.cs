namespace SMOApplication
{
	partial class Form1
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dropTableButton = new System.Windows.Forms.Button();
            this.alterTableButton = new System.Windows.Forms.Button();
            this.serverVersionLabel = new System.Windows.Forms.Label();
            this.Label4 = new System.Windows.Forms.Label();
            this.tableNameText = new System.Windows.Forms.TextBox();
            this.addTableButton = new System.Windows.Forms.Button();
            this.Label3 = new System.Windows.Forms.Label();
            this.columnsGrid = new System.Windows.Forms.DataGridView();
            this.tablesList = new System.Windows.Forms.ListBox();
            this.databasesCombo = new System.Windows.Forms.ComboBox();
            this.Label2 = new System.Windows.Forms.Label();
            this.connectButton = new System.Windows.Forms.Button();
            this.encryptBox = new System.Windows.Forms.CheckBox();
            this.serverText = new System.Windows.Forms.TextBox();
            this.Label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
// 
// dropTableButton
// 
            this.dropTableButton.Location = new System.Drawing.Point(276, 443);
            this.dropTableButton.Name = "dropTableButton";
            this.dropTableButton.TabIndex = 29;
            this.dropTableButton.Text = "Drop Table";
            this.dropTableButton.Click += new System.EventHandler(this.dropTableButton_Click);
// 
// alterTableButton
// 
            this.alterTableButton.Location = new System.Drawing.Point(168, 443);
            this.alterTableButton.Name = "alterTableButton";
            this.alterTableButton.TabIndex = 28;
            this.alterTableButton.Text = "Alter Table";
            this.alterTableButton.Click += new System.EventHandler(this.alterTableButton_Click);
// 
// serverVersionLabel
// 
            this.serverVersionLabel.AutoSize = true;
            this.serverVersionLabel.Location = new System.Drawing.Point(124, 53);
            this.serverVersionLabel.Name = "serverVersionLabel";
            this.serverVersionLabel.Size = new System.Drawing.Size(77, 14);
            this.serverVersionLabel.TabIndex = 27;
            this.serverVersionLabel.Text = "Server version";
// 
// Label4
// 
            this.Label4.AutoSize = true;
            this.Label4.Location = new System.Drawing.Point(60, 350);
            this.Label4.Name = "Label4";
            this.Label4.Size = new System.Drawing.Size(52, 14);
            this.Label4.TabIndex = 26;
            this.Label4.Text = "Columns:";
// 
// tableNameText
// 
            this.tableNameText.Location = new System.Drawing.Point(206, 323);
            this.tableNameText.Name = "tableNameText";
            this.tableNameText.Size = new System.Drawing.Size(196, 20);
            this.tableNameText.TabIndex = 25;
// 
// addTableButton
// 
            this.addTableButton.Location = new System.Drawing.Point(124, 320);
            this.addTableButton.Name = "addTableButton";
            this.addTableButton.TabIndex = 24;
            this.addTableButton.Text = "Add Table";
            this.addTableButton.Click += new System.EventHandler(this.addTableButton_Click);
// 
// Label3
// 
            this.Label3.AutoSize = true;
            this.Label3.Location = new System.Drawing.Point(60, 123);
            this.Label3.Name = "Label3";
            this.Label3.Size = new System.Drawing.Size(41, 14);
            this.Label3.TabIndex = 23;
            this.Label3.Text = "Tables:";
// 
// columnsGrid
// 
            dataGridViewTextBoxColumn1.DefaultCellStyle = dataGridViewCellStyle1;
            dataGridViewTextBoxColumn1.HeaderText = "Name";
            dataGridViewTextBoxColumn1.Name = "ColumnName";
            dataGridViewTextBoxColumn1.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            dataGridViewTextBoxColumn2.DefaultCellStyle = dataGridViewCellStyle1;
            dataGridViewTextBoxColumn2.HeaderText = "DataType";
            dataGridViewTextBoxColumn2.Name = "DataType";
            dataGridViewTextBoxColumn2.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.columnsGrid.Columns.Add(dataGridViewTextBoxColumn1);
            this.columnsGrid.Columns.Add(dataGridViewTextBoxColumn2);
            this.columnsGrid.Location = new System.Drawing.Point(124, 350);
            this.columnsGrid.Name = "columnsGrid";
            this.columnsGrid.Size = new System.Drawing.Size(279, 86);
            this.columnsGrid.TabIndex = 22;
// 
// tablesList
// 
            this.tablesList.FormattingEnabled = true;
            this.tablesList.Location = new System.Drawing.Point(123, 123);
            this.tablesList.Name = "tablesList";
            this.tablesList.Size = new System.Drawing.Size(281, 160);
            this.tablesList.TabIndex = 21;
// 
// databasesCombo
// 
            this.databasesCombo.FormattingEnabled = true;
            this.databasesCombo.Location = new System.Drawing.Point(123, 83);
            this.databasesCombo.Name = "databasesCombo";
            this.databasesCombo.Size = new System.Drawing.Size(282, 21);
            this.databasesCombo.TabIndex = 20;
            this.databasesCombo.SelectedIndexChanged += new System.EventHandler(this.databasesCombo_SelectedIndexChanged);
// 
// Label2
// 
            this.Label2.AutoSize = true;
            this.Label2.Location = new System.Drawing.Point(60, 86);
            this.Label2.Name = "Label2";
            this.Label2.Size = new System.Drawing.Size(56, 14);
            this.Label2.TabIndex = 19;
            this.Label2.Text = "Database:";
// 
// connectButton
// 
            this.connectButton.Location = new System.Drawing.Point(328, 13);
            this.connectButton.Name = "connectButton";
            this.connectButton.TabIndex = 18;
            this.connectButton.Text = "Connect";
            this.connectButton.Click += new System.EventHandler(this.connectButton_Click);
// 
// encryptBox
// 
            this.encryptBox.AutoSize = true;
            this.encryptBox.Checked = true;
            this.encryptBox.CheckState = System.Windows.Forms.CheckState.Checked;
            this.encryptBox.Location = new System.Drawing.Point(230, 13);
            this.encryptBox.Name = "encryptBox";
            this.encryptBox.TabIndex = 17;
            this.encryptBox.Text = "Encrypt?";
// 
// serverText
// 
            this.serverText.Location = new System.Drawing.Point(124, 13);
            this.serverText.Name = "serverText";
            this.serverText.TabIndex = 16;
            this.serverText.Text = "localhost";
// 
// Label1
// 
            this.Label1.AutoSize = true;
            this.Label1.Location = new System.Drawing.Point(61, 16);
            this.Label1.Name = "Label1";
            this.Label1.Size = new System.Drawing.Size(41, 14);
            this.Label1.TabIndex = 15;
            this.Label1.Text = "Server:";
// 
// Form1
// 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(512, 476);
            this.Controls.Add(this.dropTableButton);
            this.Controls.Add(this.alterTableButton);
            this.Controls.Add(this.serverVersionLabel);
            this.Controls.Add(this.Label4);
            this.Controls.Add(this.tableNameText);
            this.Controls.Add(this.addTableButton);
            this.Controls.Add(this.Label3);
            this.Controls.Add(this.columnsGrid);
            this.Controls.Add(this.tablesList);
            this.Controls.Add(this.databasesCombo);
            this.Controls.Add(this.Label2);
            this.Controls.Add(this.connectButton);
            this.Controls.Add(this.encryptBox);
            this.Controls.Add(this.serverText);
            this.Controls.Add(this.Label1);
            this.Name = "Form1";
            this.Text = "SMO Application";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        internal System.Windows.Forms.Button dropTableButton;
        internal System.Windows.Forms.Button alterTableButton;
        internal System.Windows.Forms.Label serverVersionLabel;
        internal System.Windows.Forms.Label Label4;
        internal System.Windows.Forms.TextBox tableNameText;
        internal System.Windows.Forms.Button addTableButton;
        internal System.Windows.Forms.Label Label3;
        internal System.Windows.Forms.DataGridView columnsGrid;
        internal System.Windows.Forms.ListBox tablesList;
        internal System.Windows.Forms.ComboBox databasesCombo;
        internal System.Windows.Forms.Label Label2;
        internal System.Windows.Forms.Button connectButton;
        internal System.Windows.Forms.CheckBox encryptBox;
        internal System.Windows.Forms.TextBox serverText;
        internal System.Windows.Forms.Label Label1;

    }
}

