namespace WebServiceClient
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
			this.getProductsButton = new System.Windows.Forms.Button();
			this.productsGrid = new System.Windows.Forms.DataGridView();
			this.SuspendLayout();
// 
// getProductsButton
// 
			this.getProductsButton.Location = new System.Drawing.Point(13, 13);
			this.getProductsButton.Name = "getProductsButton";
			this.getProductsButton.TabIndex = 0;
			this.getProductsButton.Text = "Get Products";
			this.getProductsButton.Click += new System.EventHandler(this.getProductsButton_Click);
// 
// productsGrid
// 
			this.productsGrid.AllowUserToAddRows = false;
			this.productsGrid.AllowUserToDeleteRows = false;
			this.productsGrid.AutoSize = true;
			this.productsGrid.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnKeystroke;
			this.productsGrid.Location = new System.Drawing.Point(13, 43);
			this.productsGrid.MultiSelect = false;
			this.productsGrid.Name = "productsGrid";
			this.productsGrid.Size = new System.Drawing.Size(438, 216);
			this.productsGrid.TabIndex = 2;
			this.productsGrid.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.productGrid_DellEndEdit);
			this.productsGrid.Click += new System.EventHandler(this.productsGrid_Click);
// 
// Form1
// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(464, 273);
			this.Controls.Add(this.productsGrid);
			this.Controls.Add(this.getProductsButton);
			this.Name = "Form1";
			this.Text = "Products Client";
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Button getProductsButton;
		private System.Windows.Forms.DataGridView productsGrid;
	}
}

