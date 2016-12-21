using System;
using System.Data;
using System.Data.Sql;
using System.Data.SqlServer;
using System.Data.SqlTypes;
using System.Xml;

namespace FileUtilities
{
	public partial class StoredProcedures
	{
		[SqlProcedure(Name = "SaveXML")]
		public static void SaveXML(SqlXml XmlData,
							   SqlString FileName)
		{
			XmlDocument xmlDoc = new XmlDocument();
			xmlDoc.LoadXml(XmlData.Value);
			xmlDoc.Save(FileName.Value);
		}
	};
}

