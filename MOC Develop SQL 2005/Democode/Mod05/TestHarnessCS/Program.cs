#region Using directives

using System;
using System.Collections.Generic;
using System.Text;

#endregion

namespace TestHarnessCS
{
	class Program
	{
		static void Main(string[] args)
		{
			AWWebService.AWProduction proxy =
				new AWWebService.AWProduction();

			proxy.Credentials =
				System.Net.CredentialCache.DefaultCredentials;

			System.Data.DataSet ds = proxy.GetProducts();

			foreach (System.Data.DataRow r in ds.Tables[0].Rows)
			{
				Console.WriteLine(r["Name"].ToString());
			}
		}
	}
}
