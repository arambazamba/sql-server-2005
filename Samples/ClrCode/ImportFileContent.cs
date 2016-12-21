using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data.SqlTypes;
using Microsoft.SqlServer;
using Microsoft.SqlServer.Server;

public class Importer
{
    [SqlProcedure()]
    public static void ImportFileContent (SqlString fileName)
    {
		// Get the connection to the current server
        SqlConnection conn = new SqlConnection("context connection=true");
        conn.Open();

		System.IO.StreamReader reader = System.IO.File.OpenText(fileName.ToString());

        try
		{
			SqlCommand insertPersonCmd = conn.CreateCommand();

			insertPersonCmd.CommandText = "INSERT INTO Person VALUES(@PersId, @Firstname, @Lastname, @Age, @JobName, @Salary)";
			insertPersonCmd.Parameters.Add("@PersId", SqlDbType.VarChar, 4);
			insertPersonCmd.Parameters.Add("@Firstname", SqlDbType.VarChar, 40);
			insertPersonCmd.Parameters.Add("@Lastname", SqlDbType.VarChar, 60);
			insertPersonCmd.Parameters.Add("@Age", SqlDbType.Int);
			insertPersonCmd.Parameters.Add("@JobName", SqlDbType.VarChar, 40);
			insertPersonCmd.Parameters.Add("@Salary", SqlDbType.Decimal);

			SqlCommand insertManagerCmd = conn.CreateCommand();

			insertManagerCmd.CommandText = "INSERT INTO Manager VALUES(@PersId, @MngLevel, @MngDep)";
			insertManagerCmd.Parameters.Add("@PersId", SqlDbType.VarChar, 4);
			insertManagerCmd.Parameters.Add("@MngLevel", SqlDbType.Float);
			insertManagerCmd.Parameters.Add("@MngDep", SqlDbType.VarChar, 50);

			// Open the file and go through the lines
			string line;

			// Forget about the first line
			line = reader.ReadLine();
			do
			{
				// Read and parse the next line
				line = reader.ReadLine();
				if (line != null)
				{
					string[] vals = line.Split(new char[] { ';' });

					// The first values are for the person
					for (int i = 0; i <= 5; i++)
					{
						// Insert the new person
						switch (insertPersonCmd.Parameters[i].SqlDbType)
						{
							case SqlDbType.Decimal :
								insertPersonCmd.Parameters[i].Value = Decimal.Parse(vals[i]);
								break;

							case SqlDbType.Int :
								insertPersonCmd.Parameters[i].Value = Int32.Parse(vals[i]);
								break;

							default :
								insertPersonCmd.Parameters[i].Value = vals[i];
								break;
						}
					}

					insertPersonCmd.ExecuteNonQuery();

					// If the person is also a manager, insert into the manager table
					if (string.Compare(vals[6], "true", true) == 0)
					{
						insertManagerCmd.Parameters[0].Value = vals[0];
						insertManagerCmd.Parameters[1].Value = vals[7];
						insertManagerCmd.Parameters[2].Value = vals[8];
						insertManagerCmd.ExecuteNonQuery();
					}
				}
			} while (line != null);
		}
		catch (Exception ex)
		{
			throw ex;
		}
		finally
		{
			reader.Close();
            conn.Close();
		}
    }
};
