using System;
using System.Data.Sql;
using System.Data.SqlTypes;
using System.Text;

namespace NetworkUtilities
{
	[Serializable]
	[SqlUserDefinedType(Format.SerializedDataWithMetadata, MaxByteSize = 512)]
	public struct IPAddress : INullable
	{
		private bool is_Null;
		private double m_a;
		private double m_b;
		private double m_c;
		private double m_d;

		public override string ToString()
		{
			if (this.IsNull)
			{
            return "NULL";
			}
			else
			{
            return m_a + "." + m_b + "." + m_c + "." + m_d;
			}
		}

		public bool IsNull
		{
			get
			{
				return is_Null;
			}
		}

		public static IPAddress Null
		{
			get
			{
				IPAddress ip = new IPAddress();
				ip.is_Null = true;
				return ip;
			}
		}

		public static IPAddress Parse(SqlString s)
		{
			if (s.IsNull)
			{
				return IPAddress.Null;
			}
			else
			{
				IPAddress ip = new IPAddress();
				String str = Convert.ToString(s);
				String[] abcd = str.Split(".".ToCharArray());
				ip.A = double.Parse(abcd[0]);
				ip.B = double.Parse(abcd[1]);
				ip.C = double.Parse(abcd[2]);
				ip.D = double.Parse(abcd[3]);
				return ip;
			}
		}

		public Double A
		{
			get
			{
				return m_a;
			}
			set
			{
				m_a = value;
			}
		}


		public Double B
		{
			get
			{
				return m_b;
			}
			set
			{
				m_b = value;
			}
		}

		public Double C
		{
			get
			{
				return m_c;
			}
			set
			{
				m_c = value;
			}
		}


		public Double D
		{
			get
			{
				return m_d;
			}
			set
			{
				m_d = value;
			}
		}

		public String Ping()
		{
			return "Ping " + this.ToString();
		}


	}

}