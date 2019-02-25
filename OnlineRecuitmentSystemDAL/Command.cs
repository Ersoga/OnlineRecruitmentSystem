using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using OnlineRecuitmentSystemIDAL;

namespace OnlineRecuitmentSystemDAL
{
    public class Command : ICommand
    {
        private readonly SqlTransaction currentTransaction;
        private readonly IConnection currentConnection;
        private readonly int commandTimeOut;
        //private readonly SqlCommandType commandTypeToUse;


        private SqlCommand BuildCommand(string commandText, params DbParameter[] parameters)
        {
            SqlCommand newCommand = new SqlCommand(commandText, (SqlConnection)currentConnection.DatabaseConnection)
            {
                Transaction = currentTransaction,
                //CommandType = commandTypeToUse.Get(commandText)
            };

            if (commandTimeOut > 0)
            {
                newCommand.CommandTimeout = commandTimeOut;
            }

            if (parameters != null)
                newCommand.Parameters.AddRange(parameters);

            return newCommand;
        }

        private T Execute<T>(Func<SqlCommand, T> commandToExecute, string commandText, params DbParameter[] parameters)
        {
            DbCommand cmd = null;
            T result;
            try
            {
                result = Execute(commandToExecute, out cmd, commandText, parameters);
            }
            finally
            {
                cmd.Parameters.Clear();
                cmd.Dispose();
            }

            return result;
        }

        private T Execute<T>(Func<SqlCommand, T> commandToExecute, out DbCommand cmd, string commandText, params DbParameter[] parameters)
        {
            SqlCommand toExecute;
            object result;

            try
            {
                currentConnection.Open();//打开数据库
                toExecute = BuildCommand(commandText, parameters);//建立命令
                result = commandToExecute(toExecute);//执行命令

                cmd = toExecute;
            }
            finally
            {
                currentConnection.Close();//关闭数据库
            }

            return (T)result;
        }

        public Command(IConnection currentConnection, IDbTransaction currentTransaction, int commandTimeOut)
        {
            if (currentConnection == null) throw new ArgumentNullException("currentConnection");

            this.currentTransaction = currentTransaction as SqlTransaction;
            this.currentConnection = currentConnection;
            this.commandTimeOut = commandTimeOut;
            //commandTypeToUse = new SqlCommandType(this.currentConnection.ConnectionString);
        }
        public DataSet ExecuteDataSet(string commandText, params DbParameter[] parameters)
        {
            DataSet data = new DataSet();
            throw new NotImplementedException();
        }

        public DataSet ExecuteDataSet(out DbCommand cmd, string commandText, params DbParameter[] parameters)
        {
            SqlCommand cmdDataSet;

            DataSet result = new DataSet();

            try
            {
                currentConnection.Open();
                cmdDataSet = BuildCommand(commandText, parameters);

                using (SqlDataAdapter adapter = new SqlDataAdapter(cmdDataSet))
                {
                    adapter.Fill(result);
                }
            }
            finally
            {
                currentConnection.Close();
            }

            cmd = cmdDataSet;
            return result;
            //throw new NotImplementedException();
        }

        public DataTable ExecuteDataTable(string commandText, params DbParameter[] parameters)
        {
            throw new NotImplementedException();
        }

        public DataTable ExecuteDataTable(out DbCommand cmd, string commandText, params DbParameter[] parameters)
        {
            throw new NotImplementedException();
        }

        public int ExecuteNonQuery(string commandText, params DbParameter[] parameters)
        {
            return Execute(x => x.ExecuteNonQuery(), commandText, parameters);
        }

        public int ExecuteNonQuery(out DbCommand cmd, string commandText, params DbParameter[] parameters)
        {
            return Execute(x => x.ExecuteNonQuery(),out cmd, commandText, parameters);
            //throw new NotImplementedException();
        }

        public DbDataReader ExecuteReader(string commandText, params DbParameter[] parameters)
        {
            throw new NotImplementedException();
        }

        public object ExecuteScalar(string commandText, params DbParameter[] parameters)
        {
            throw new NotImplementedException();
        }

        public object ExecuteScalar(out DbCommand cmd, string commandText, params DbParameter[] parameters)
        {
            throw new NotImplementedException();
        }

        public XmlReader ExecuteXmlReader(string commandText, params DbParameter[] parameters)
        {
            throw new NotImplementedException();
        }

        public XmlReader ExecuteXmlReader(out DbCommand cmd, string commandText, params DbParameter[] parameters)
        {
            throw new NotImplementedException();
        }
        
    }
}
