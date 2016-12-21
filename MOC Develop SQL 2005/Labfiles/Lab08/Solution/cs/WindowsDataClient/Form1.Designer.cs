namespace WindowsDataClient
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.productsDS = new WindowsDataClient.ProductsDS();
            this.getProductsDataConnector = new System.Windows.Forms.DataConnector(this.components);
            this.getProductsTableAdapter = new WindowsDataClient.GetProductsTableAdapter();
            this.getProductsDataNavigator = new System.Windows.Forms.DataNavigator(this.components);
            this.dataNavigatorAddNewItem = new System.Windows.Forms.ToolStripButton();
            this.dataNavigatorCountItem = new System.Windows.Forms.ToolStripLabel();
            this.dataNavigatorDeleteItem = new System.Windows.Forms.ToolStripButton();
            this.dataNavigatorMoveFirstItem = new System.Windows.Forms.ToolStripButton();
            this.dataNavigatorMovePreviousItem = new System.Windows.Forms.ToolStripButton();
            this.dataNavigatorSeparator = new System.Windows.Forms.ToolStripSeparator();
            this.dataNavigatorPositionItem = new System.Windows.Forms.ToolStripTextBox();
            this.dataNavigatorSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.dataNavigatorMoveNextItem = new System.Windows.Forms.ToolStripButton();
            this.dataNavigatorMoveLastItem = new System.Windows.Forms.ToolStripButton();
            this.dataNavigatorSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.dataNavigatorSaveItem = new System.Windows.Forms.ToolStripButton();
            this.leftRaftingContainer = new System.Windows.Forms.RaftingContainer();
            this.rightRaftingContainer = new System.Windows.Forms.RaftingContainer();
            this.topRaftingContainer = new System.Windows.Forms.RaftingContainer();
            this.bottomRaftingContainer = new System.Windows.Forms.RaftingContainer();
            this.getProductsDataGridView = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.productsDS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.getProductsDataConnector)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.getProductsDataNavigator)).BeginInit();
            this.getProductsDataNavigator.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.leftRaftingContainer)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.rightRaftingContainer)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.topRaftingContainer)).BeginInit();
            this.topRaftingContainer.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bottomRaftingContainer)).BeginInit();
            this.SuspendLayout();
// 
// productsDS
// 
            this.productsDS.DataSetName = "ProductsDS";
            this.productsDS.Locale = new System.Globalization.CultureInfo("en-US");
            this.productsDS.RemotingFormat = System.Data.SerializationFormat.Xml;
// 
// getProductsDataConnector
// 
            this.getProductsDataConnector.DataMember = "GetProducts";
            this.getProductsDataConnector.DataSource = this.productsDS;
// 
// getProductsTableAdapter
// 
            this.getProductsTableAdapter.ClearBeforeFill = true;
// 
// getProductsDataNavigator
// 
            this.getProductsDataNavigator.AddNewItem = this.dataNavigatorAddNewItem;
            this.getProductsDataNavigator.CountItem = this.dataNavigatorCountItem;
            this.getProductsDataNavigator.CountItemFormat = "of {0}";
            this.getProductsDataNavigator.DataConnector = this.getProductsDataConnector;
            this.getProductsDataNavigator.DeleteItem = this.dataNavigatorDeleteItem;
            this.getProductsDataNavigator.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.dataNavigatorMoveFirstItem,
            this.dataNavigatorMovePreviousItem,
            this.dataNavigatorSeparator,
            this.dataNavigatorPositionItem,
            this.dataNavigatorCountItem,
            this.dataNavigatorSeparator1,
            this.dataNavigatorMoveNextItem,
            this.dataNavigatorMoveLastItem,
            this.dataNavigatorSeparator2,
            this.dataNavigatorAddNewItem,
            this.dataNavigatorDeleteItem,
            this.dataNavigatorSaveItem});
            this.getProductsDataNavigator.Location = new System.Drawing.Point(0, 0);
            this.getProductsDataNavigator.MoveFirstItem = this.dataNavigatorMoveFirstItem;
            this.getProductsDataNavigator.MoveLastItem = this.dataNavigatorMoveLastItem;
            this.getProductsDataNavigator.MoveNextItem = this.dataNavigatorMoveNextItem;
            this.getProductsDataNavigator.MovePreviousItem = this.dataNavigatorMovePreviousItem;
            this.getProductsDataNavigator.Name = "getProductsDataNavigator";
            this.getProductsDataNavigator.PositionItem = this.dataNavigatorPositionItem;
            this.getProductsDataNavigator.Raft = System.Windows.Forms.RaftingSides.Top;
            this.getProductsDataNavigator.ShowItemToolTips = true;
            this.getProductsDataNavigator.TabIndex = 0;
            this.getProductsDataNavigator.Text = "dataNavigator1";
// 
// dataNavigatorAddNewItem
// 
            this.dataNavigatorAddNewItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.dataNavigatorAddNewItem.Image = ((System.Drawing.Image)(resources.GetObject("dataNavigatorAddNewItem.Image")));
            this.dataNavigatorAddNewItem.Name = "dataNavigatorAddNewItem";
            this.dataNavigatorAddNewItem.SettingsKey = "Form1.dataNavigatorAddNewItem";
            this.dataNavigatorAddNewItem.Text = "Add new";
// 
// dataNavigatorCountItem
// 
            this.dataNavigatorCountItem.AutoToolTip = false;
            this.dataNavigatorCountItem.Name = "dataNavigatorCountItem";
            this.dataNavigatorCountItem.SettingsKey = "Form1.dataNavigatorCountItem";
            this.dataNavigatorCountItem.Text = "of 0";
            this.dataNavigatorCountItem.ToolTipText = "Total number of items";
// 
// dataNavigatorDeleteItem
// 
            this.dataNavigatorDeleteItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.dataNavigatorDeleteItem.Image = ((System.Drawing.Image)(resources.GetObject("dataNavigatorDeleteItem.Image")));
            this.dataNavigatorDeleteItem.Name = "dataNavigatorDeleteItem";
            this.dataNavigatorDeleteItem.SettingsKey = "Form1.dataNavigatorDeleteItem";
            this.dataNavigatorDeleteItem.Text = "Delete";
// 
// dataNavigatorMoveFirstItem
// 
            this.dataNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.dataNavigatorMoveFirstItem.Image = ((System.Drawing.Image)(resources.GetObject("dataNavigatorMoveFirstItem.Image")));
            this.dataNavigatorMoveFirstItem.Name = "dataNavigatorMoveFirstItem";
            this.dataNavigatorMoveFirstItem.SettingsKey = "Form1.dataNavigatorMoveFirstItem";
            this.dataNavigatorMoveFirstItem.Text = "Move first";
// 
// dataNavigatorMovePreviousItem
// 
            this.dataNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.dataNavigatorMovePreviousItem.Image = ((System.Drawing.Image)(resources.GetObject("dataNavigatorMovePreviousItem.Image")));
            this.dataNavigatorMovePreviousItem.Name = "dataNavigatorMovePreviousItem";
            this.dataNavigatorMovePreviousItem.SettingsKey = "Form1.dataNavigatorMovePreviousItem";
            this.dataNavigatorMovePreviousItem.Text = "Move previous";
// 
// dataNavigatorSeparator
// 
            this.dataNavigatorSeparator.Name = "dataNavigatorSeparator";
            this.dataNavigatorSeparator.SettingsKey = "Form1.dataNavigatorSeparator";
// 
// dataNavigatorPositionItem
// 
            this.dataNavigatorPositionItem.Font = new System.Drawing.Font("Tahoma", 8.25F);
            this.dataNavigatorPositionItem.Name = "dataNavigatorPositionItem";
            this.dataNavigatorPositionItem.SettingsKey = "Form1.dataNavigatorPositionItem";
            this.dataNavigatorPositionItem.Text = "0";
            this.dataNavigatorPositionItem.ToolTipText = "Current position";
// 
// dataNavigatorSeparator1
// 
            this.dataNavigatorSeparator1.Name = "dataNavigatorSeparator1";
            this.dataNavigatorSeparator1.SettingsKey = "Form1.dataNavigatorSeparator1";
// 
// dataNavigatorMoveNextItem
// 
            this.dataNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.dataNavigatorMoveNextItem.Image = ((System.Drawing.Image)(resources.GetObject("dataNavigatorMoveNextItem.Image")));
            this.dataNavigatorMoveNextItem.Name = "dataNavigatorMoveNextItem";
            this.dataNavigatorMoveNextItem.SettingsKey = "Form1.dataNavigatorMoveNextItem";
            this.dataNavigatorMoveNextItem.Text = "Move next";
// 
// dataNavigatorMoveLastItem
// 
            this.dataNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.dataNavigatorMoveLastItem.Image = ((System.Drawing.Image)(resources.GetObject("dataNavigatorMoveLastItem.Image")));
            this.dataNavigatorMoveLastItem.Name = "dataNavigatorMoveLastItem";
            this.dataNavigatorMoveLastItem.SettingsKey = "Form1.dataNavigatorMoveLastItem";
            this.dataNavigatorMoveLastItem.Text = "Move last";
// 
// dataNavigatorSeparator2
// 
            this.dataNavigatorSeparator2.Name = "dataNavigatorSeparator2";
            this.dataNavigatorSeparator2.SettingsKey = "Form1.dataNavigatorSeparator2";
// 
// dataNavigatorSaveItem
// 
            this.dataNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.dataNavigatorSaveItem.Image = ((System.Drawing.Image)(resources.GetObject("dataNavigatorSaveItem.Image")));
            this.dataNavigatorSaveItem.Name = "dataNavigatorSaveItem";
            this.dataNavigatorSaveItem.SettingsKey = "Form1.dataNavigatorSaveItem";
            this.dataNavigatorSaveItem.Text = "Save Data";
            this.dataNavigatorSaveItem.Click += new System.EventHandler(this.dataNavigatorSaveItem_Click);
// 
// leftRaftingContainer
// 
            this.leftRaftingContainer.Dock = System.Windows.Forms.DockStyle.Left;
            this.leftRaftingContainer.Name = "leftRaftingContainer";
// 
// rightRaftingContainer
// 
            this.rightRaftingContainer.Dock = System.Windows.Forms.DockStyle.Right;
            this.rightRaftingContainer.Name = "rightRaftingContainer";
// 
// topRaftingContainer
// 
            this.topRaftingContainer.Controls.Add(this.getProductsDataNavigator);
            this.topRaftingContainer.Dock = System.Windows.Forms.DockStyle.Top;
            this.topRaftingContainer.Name = "topRaftingContainer";
// 
// bottomRaftingContainer
// 
            this.bottomRaftingContainer.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.bottomRaftingContainer.Name = "bottomRaftingContainer";
// 
// getProductsDataGridView
// 
            this.getProductsDataGridView.AutoGenerateColumns = false;
            dataGridViewTextBoxColumn1.DataPropertyName = "ProductID";
            dataGridViewTextBoxColumn1.HeaderText = "ProductID";
            dataGridViewTextBoxColumn1.Name = "ProductID";
            dataGridViewTextBoxColumn1.ReadOnly = true;
            dataGridViewTextBoxColumn1.ValueType = typeof(int);
            dataGridViewTextBoxColumn2.DataPropertyName = "Name";
            dataGridViewTextBoxColumn2.HeaderText = "Name";
            dataGridViewTextBoxColumn2.Name = "Name";
            dataGridViewTextBoxColumn2.ValueType = typeof(string);
            dataGridViewTextBoxColumn3.DataPropertyName = "ListPrice";
            dataGridViewTextBoxColumn3.HeaderText = "ListPrice";
            dataGridViewTextBoxColumn3.Name = "ListPrice";
            dataGridViewTextBoxColumn3.ValueType = typeof(System.Decimal);
            this.getProductsDataGridView.Columns.Add(dataGridViewTextBoxColumn1);
            this.getProductsDataGridView.Columns.Add(dataGridViewTextBoxColumn2);
            this.getProductsDataGridView.Columns.Add(dataGridViewTextBoxColumn3);
            this.getProductsDataGridView.DataSource = this.getProductsDataConnector;
            this.getProductsDataGridView.Location = new System.Drawing.Point(13, 44);
            this.getProductsDataGridView.Name = "getProductsDataGridView";
            this.getProductsDataGridView.Size = new System.Drawing.Size(300, 220);
            this.getProductsDataGridView.TabIndex = 0;
// 
// Form1
// 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(358, 294);
            this.Controls.Add(this.getProductsDataGridView);
            this.Controls.Add(this.leftRaftingContainer);
            this.Controls.Add(this.rightRaftingContainer);
            this.Controls.Add(this.topRaftingContainer);
            this.Controls.Add(this.bottomRaftingContainer);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.productsDS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.getProductsDataConnector)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.getProductsDataNavigator)).EndInit();
            this.getProductsDataNavigator.ResumeLayout(false);
            this.getProductsDataNavigator.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.leftRaftingContainer)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.rightRaftingContainer)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.topRaftingContainer)).EndInit();
            this.topRaftingContainer.ResumeLayout(false);
            this.topRaftingContainer.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bottomRaftingContainer)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

		#endregion

        private ProductsDS productsDS;
        private System.Windows.Forms.DataConnector getProductsDataConnector;
        private GetProductsTableAdapter getProductsTableAdapter;
        private System.Windows.Forms.DataNavigator getProductsDataNavigator;
        private System.Windows.Forms.RaftingContainer leftRaftingContainer;
        private System.Windows.Forms.RaftingContainer rightRaftingContainer;
        private System.Windows.Forms.RaftingContainer topRaftingContainer;
        private System.Windows.Forms.RaftingContainer bottomRaftingContainer;
        private System.Windows.Forms.ToolStripButton dataNavigatorAddNewItem;
        private System.Windows.Forms.ToolStripLabel dataNavigatorCountItem;
        private System.Windows.Forms.ToolStripButton dataNavigatorDeleteItem;
        private System.Windows.Forms.ToolStripButton dataNavigatorMoveFirstItem;
        private System.Windows.Forms.ToolStripButton dataNavigatorMovePreviousItem;
        private System.Windows.Forms.ToolStripSeparator dataNavigatorSeparator;
        private System.Windows.Forms.ToolStripTextBox dataNavigatorPositionItem;
        private System.Windows.Forms.ToolStripSeparator dataNavigatorSeparator1;
        private System.Windows.Forms.ToolStripButton dataNavigatorMoveNextItem;
        private System.Windows.Forms.ToolStripButton dataNavigatorMoveLastItem;
        private System.Windows.Forms.ToolStripSeparator dataNavigatorSeparator2;
        private System.Windows.Forms.ToolStripButton dataNavigatorSaveItem;
        private System.Windows.Forms.DataGridView getProductsDataGridView;
    }
}

