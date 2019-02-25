using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace OnlineRecuitmentSystemIDAL
{
    struct DataBaseConnectStr
    {
        string type;
        string ConnectStr;
    }
    public interface IDataBase
    {
        string ConnectStr { get; set; }
        int Insert(Models.UserTable user);
        int Delete(Models.UserTable user);
        int Delete(string PhoneNumber);
        int Alter(Models.UserTable user);
        //Models.UserTable Select(string phone);
        List<Models.UserTable> Select(string phone);

        int ExecuteNonQuery(string commandText, params DbParameter[] parameters);

        int ExecuteNonQuery(out DbCommand cmd, string commandText, params DbParameter[] parameters);

        object ExecuteScalar(string commandText, params DbParameter[] parameters);

        object ExecuteScalar(out DbCommand cmd, string commandText, params DbParameter[] parameters);

        DbDataReader ExecuteReader(string commandText, params DbParameter[] parameters);

        DataTable ExecuteDataTable(string commandText, params DbParameter[] parameters);

        DataTable ExecuteDataTable(out DbCommand cmd, string commandText, params DbParameter[] parameters);

        DataSet ExecuteDataSet(string commandText, params DbParameter[] parameters);

        DataSet ExecuteDataSet(out DbCommand cmd, string commandText, params DbParameter[] parameters);

        XmlReader ExecuteXmlReader(string commandText, params DbParameter[] parameters);

        XmlReader ExecuteXmlReader(out DbCommand cmd, string commandText, params DbParameter[] parameters);
    }
}
