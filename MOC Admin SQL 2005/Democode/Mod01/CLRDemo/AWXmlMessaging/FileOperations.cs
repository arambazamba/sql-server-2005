using System;
using System.Data;
using System.Data.Sql;
using System.Data.SqlServer;
using System.Data.SqlTypes;
using System.Xml;


public partial class FileOperations
{
	[SqlProcedure]
	public static void SaveOrder(SqlXml OrderData, SqlString FileName)
	{

			XmlDocument orderDoc = new XmlDocument();
			orderDoc.LoadXml(OrderData.Value);
			orderDoc.Save(FileName.Value);

	}
};
