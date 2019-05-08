using OnlineRecuitmentSystemDAL;
using OnlineRecuitmentSystemIDAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    static public class Tool
    {
        static private IDataBase DB = new SqlServer();
        static private ParameterFactory parameterFactory = new OnlineRecuitmentSystemDAL.ParameterFactory();
        static public DataTable GetCity(int pid)
        {
            string sql = "select * from City where Pid = @Pid;";
            return DB.ExecuteDataTable(sql, parameterFactory.Create("@Pid", DbType.Int32, pid));
        }
        static public DataTable GetCityById(int id)
        {
            string sql = "select * from City where Id = @Id;";
            return DB.ExecuteDataTable(sql, parameterFactory.Create("@Id", DbType.Int32, id));
        }
    }
}
