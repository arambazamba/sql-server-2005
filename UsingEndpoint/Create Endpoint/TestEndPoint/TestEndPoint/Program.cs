using System;
using System.Collections.Generic;
using System.Data.SqlTypes;

namespace TestEndPoint
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter Category: ");
            string category = Console.ReadLine();

            try
            {
                AdventureWorksTestEndpoint svc = new AdventureWorksTestEndpoint();
                svc.Credentials = System.Net.CredentialCache.DefaultCredentials;
                SqlMoney results = svc.GetHighestPrice(new System.Data.SqlTypes.SqlString(category));
                Console.WriteLine("Results: {0}", results);
            }
            catch (Exception ex)
            {
                Console.WriteLine(">> Error: " + ex.Message);
            }

            Console.WriteLine("Finished!");
            Console.ReadLine();
        }
    }
}
