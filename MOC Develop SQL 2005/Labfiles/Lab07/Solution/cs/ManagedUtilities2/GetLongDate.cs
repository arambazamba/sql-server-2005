using System;
using System.Data.Sql;
using System.Data.SqlTypes;

namespace DateUtilities
{
	public partial class UserDefinedFunctions
	{
		[SqlFunction(Name = "GetLongDate",
					 DataAccess = DataAccessKind.None)]
		public static SqlString GetLongDate(SqlDateTime DateVal)
		{
			return DateVal.Value.ToLongDateString();
		}
	};
}