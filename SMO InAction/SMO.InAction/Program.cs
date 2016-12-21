using System;
using Microsoft.SqlServer.Management.Smo;

namespace SMO.InAction
{
    class Program
    {
        static void Main(string[] args)
        {
            // First of all connect to the server
            Server srv = new Server(@"(local)\SQL2005");

            // Get general details of the server
            foreach (Database db in srv.Databases)
            {
                Console.WriteLine("Database: {0}", db.Name);
                Console.WriteLine("-) {0}", db.Owner);
                foreach (Table tbl in db.Tables)
                {
                    Console.WriteLine("-) Table {0}", tbl.Name);
                }
            }

            // Create a system object
            Console.WriteLine("");
            Console.WriteLine("Enter a name for a new database: ");
            string NewDatabaseName = Console.ReadLine();
            if (NewDatabaseName.Length > 0)
            {
                try
                {
                    Database db = new Database(srv, NewDatabaseName);
                    db.Create();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.ToString());
                }
            }

            Console.WriteLine("Finished!!");
            Console.ReadLine();
        }
    }
}
