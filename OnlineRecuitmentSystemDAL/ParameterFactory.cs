using OnlineRecuitmentSystemIDAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineRecuitmentSystemDAL
{
    public class ParameterFactory : IParameterCreate
    {
        public DbParameter Create(string paramName, DbType paramType, object value, ParameterDirection direction)
        {
            //return new MySql.Data.MySqlClient.MySqlParameter();
            throw new NotImplementedException();
        }
        public DbParameter Create(string paramName, DbType paramType, ParameterDirection direction)
        {
            throw new NotImplementedException();
        }

        public DbParameter Create(string paramName, DbType paramType, object value)
        {
            SqlParameter parameter = new SqlParameter(paramName, this.ConvertDbTypeToSqlDbType(paramType));
            if (value != null)
            {
                parameter.Value = value;
            }
            else
            {
                parameter.Value = DBNull.Value;
            }
            return parameter;
            //throw new NotImplementedException();
        }

        public DbParameter Create(string paramName, DbType paramType, object value, int size)
        {
            throw new NotImplementedException();
        }

        public DbParameter Create(string paramName, DbType paramType, object value, int size, byte precision, ParameterDirection direction)
        {
            throw new NotImplementedException();
        }

        public DbParameter Create(string paramName, DbType paramType, object value, int size, byte precision)
        {
            throw new NotImplementedException();
        }

        public DbParameter Create(string paramName, DbType paramType, object value, int size, ParameterDirection direction)
        {
            throw new NotImplementedException();
        }

        internal SqlDbType ConvertDbTypeToSqlDbType(DbType dbType)
        {
            SqlDbType sqlType;

            switch (dbType)
            {
                case DbType.AnsiString:
                    sqlType = SqlDbType.VarChar;
                    break;
                case DbType.AnsiStringFixedLength:
                    sqlType = SqlDbType.Char;
                    break;
                case DbType.Binary:
                    sqlType = SqlDbType.Binary;
                    break;
                case DbType.Boolean:
                    sqlType = SqlDbType.Bit;
                    break;
                case DbType.Byte:
                    sqlType = SqlDbType.TinyInt;
                    break;
                case DbType.Currency:
                    sqlType = SqlDbType.Money;
                    break;
                case DbType.Date:
                    sqlType = SqlDbType.Date;
                    break;
                case DbType.DateTime:
                    sqlType = SqlDbType.DateTime;
                    break;
                case DbType.DateTime2:
                    sqlType = SqlDbType.DateTime2;
                    break;
                case DbType.DateTimeOffset:
                    sqlType = SqlDbType.DateTimeOffset;
                    break;
                case DbType.Decimal:
                    sqlType = SqlDbType.Decimal;
                    break;
                case DbType.Double:
                    sqlType = SqlDbType.Float;
                    break;
                case DbType.Guid:
                    sqlType = SqlDbType.UniqueIdentifier;
                    break;
                case DbType.Int16:
                    sqlType = SqlDbType.SmallInt;
                    break;
                case DbType.Int32:
                    sqlType = SqlDbType.Int;
                    break;
                case DbType.Int64:
                    sqlType = SqlDbType.BigInt;
                    break;
                case DbType.Object:
                    sqlType = SqlDbType.Variant;
                    break;
                case DbType.SByte:
                    throw new ArgumentException("DbType.SByte has no corresponding SQL Server datatype");
                case DbType.Single:
                    sqlType = SqlDbType.Real;
                    break;
                case DbType.String:
                    sqlType = SqlDbType.NVarChar;
                    break;
                case DbType.StringFixedLength:
                    sqlType = SqlDbType.NChar;
                    break;
                case DbType.Time:
                    sqlType = SqlDbType.Time;
                    break;
                case DbType.UInt16:
                    throw new ArgumentException("DbType.UInt16 has no corresponding SQL Server datatype");
                case DbType.UInt32:
                    throw new ArgumentException("DbType.UInt32 has no corresponding SQL Server datatype");
                case DbType.UInt64:
                    throw new ArgumentException("DbType.UInt64 has no corresponding SQL Server datatype");
                case DbType.VarNumeric:
                    throw new ArgumentException("DbType.VarNumeric has no corresponding SQL Server datatype");
                case DbType.Xml:
                    sqlType = SqlDbType.Xml;
                    break;
                default:
                    throw new ArgumentException(dbType.ToString() + " has no corresponding SQL Server datatype");
            }

            return sqlType;
        }
    }
}
