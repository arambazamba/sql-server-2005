using System;
using System.Configuration;
using System.Web;
using System.Web.Caching;
using System.Web.SessionState;
using System.Web.Security;
using System.Web.Profile;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Smo;

    public partial class Default_aspx
    {
        void btnListDatabases_Click(object sender, EventArgs e)
        {
            Server myServer = new Server();
            ServerConnection conn = myServer.ConnectionContext;
            conn.ServerInstance = txtServerName.Text;
            conn.Connect();

            lstDatabases.Items.Clear();
            for (int i=0;i<myServer.Databases.Count;i++)
            {
                lstDatabases.Items.Add(myServer.Databases[i].Name);
            }
        }
        void btnCreateDatabase_Click(object sender, EventArgs e)
        {
            Server myServer = new Server();
            ServerConnection conn = myServer.ConnectionContext;
            conn.ServerInstance = txtServerName.Text;
            conn.Connect();

            Database newDb = new Database(myServer, "NewDatabase");
            newDb.Create();
        }

    }