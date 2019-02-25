using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Xml;
using System.Threading.Tasks;
using Models;
using OnlineRecuitmentSystemIDAL;
using System.Configuration;
namespace OnlineRecuitmentSystemDAL
{
    public class SqlServer : IDataBase
    {

        private SqlConnection con {get;set;}
        public string ConnectStr { get; set; }

        public SqlServer()
        {
            this.ConnectStr = ConfigurationManager.ConnectionStrings["sqlConnectionDAL"].ToString();
            
        }
        public SqlServer(string connectStr)
        {
            this.ConnectStr = connectStr;
        }

        // private SqlConnection Connect()
        // {
        //     SqlConnection con = new SqlConnection(ConnectStr);
        //     con.Open();
        //     return con;
        // }

        private void ConnectionOpen()
        {
            this.con = new SqlConnection(ConnectStr);
            if (con.State!=ConnectionState.Open)
                con.Open();
        }
        private void ConnectionClose()
        {
            con.Close();
            con.Dispose();
        }
        private SqlCommand Command(string sql, params SqlParameter[] parameter)
        {
            //SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand com = new SqlCommand(sql, (SqlConnection)con);
            com.Parameters.AddRange(parameter);
            return com;
        }

        private SqlCommand BuildCommand(string commandText, params DbParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(commandText, (SqlConnection)con);
            // {
            //     Transaction = currentTransaction,
            //     //CommandType = commandTypeToUse.Get(commandText)
            // };

            // if (commandTimeOut > 0)
            // {
            //     newCommand.CommandTimeout = commandTimeOut;
            // }

            if (parameters != null)
                command.Parameters.AddRange(parameters);

            return command;
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
                this.ConnectionOpen();//打开数据库
                toExecute = BuildCommand(commandText, parameters);//建立命令
                result = commandToExecute(toExecute);//执行命令

                cmd = toExecute;
            }
            finally
            {
                this.ConnectionClose();//关闭数据库
            }

            return (T)result;
        }

        public int Alter(UserTable user)
        {
            throw new NotImplementedException();
        }

        public int Delete(UserTable user)
        {
            string sql = "delete from UserTable where PhoneNumber = @PhoneNumber";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@PhoneNumber",user.PhoneNumber)
            };
            this.ConnectionOpen();
            int row = this.Execute(sql, parameters);
            this.ConnectionClose();
            return row;
            //throw new NotImplementedException();
        }

        public int Insert(UserTable user)
        {
            string sql = "insert into UserTable values(@PhoneNumber,@UserName,@Password,@Type,@RegistrationTime);";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@PhoneNumber",user.PhoneNumber),
                new SqlParameter("@UserName",user.UserName),
                new SqlParameter("@Password",user.Password),
                new SqlParameter("@Type",user.Type),
                new SqlParameter("@RegistrationTime",user.RegistrationTime)
            };
            this.ConnectionOpen();
            int row = this.Execute(sql, parameters);
            this.ConnectionClose();
            return row;
            //throw new NotImplementedException();
        }

        public UserTable Select(string sql, params SqlParameter[] parameter)
        {
            UserTable table = new UserTable();
            //string sql = "select * from UserTable where phoneNumber = @phoneNumber;";
            this.ConnectionOpen();
            SqlDataReader sqlData = this.Read(sql, parameter);
            if(this.Execute(sql, parameter)==1)
            {
                table.UserName = (string)sqlData["UserName"];
                table.Password = (string)sqlData["Password"];
                table.RegistrationTime = (DateTime)sqlData["RegistrationTime"];
                table.Type = (string)sqlData["Type"];
            }
            else
            {
                throw new ArgumentException("参数无效");//参数无效
            }
            this.ConnectionClose();
            return table;
            //throw new NotImplementedException();
        }

        
        /// <summary>
        /// 查看修改行数
        /// </summary>
        /// <param name="sql">sql</param>
        /// <returns></returns>
        public virtual int Execute(string sql, params SqlParameter[] parameter)
        {
            return this.Command(sql, parameter).ExecuteNonQuery();
        }
        /// <summary>
        /// 获取数据集
        /// </summary>
        /// <param name="sql">sql</param>
        /// <returns></returns>
        public virtual SqlDataReader Read(string sql, params SqlParameter[] parameter)
        {
            //this.ConnectionOpen();
            return this.Command(sql, parameter).ExecuteReader();
        }

        public List<UserTable> Select(string phone)
        {
            List<UserTable> tableList = new List<UserTable>();
            this.ConnectionOpen();
            string sql = "select * from UserTable where PhoneNumber = @PhoneNumber;";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@PhoneNumber",phone)
            };
            SqlDataReader sqlData = this.Read(sql, parameters);
            if (sqlData.HasRows)
            {
                while(sqlData.Read())
                {
                    UserTable table = new UserTable();
                    table.UserName = (string)sqlData["UserName"];
                    table.Password = (string)sqlData["Password"];
                    table.RegistrationTime = (DateTime)sqlData["RegistrationTime"];
                    table.Type = (string)sqlData["Type"];
                    tableList.Add(table);
                }  
            }
            else
            {
                //throw new ArgumentException("参数无效");//参数无效
                return null;
            }
            this.ConnectionClose();
            return tableList;
            //throw new NotImplementedException();
        }
        public int Delete(string PhoneNumber)
        {
            string sql = "delete from UserTable where PhoneNumber = @PhoneNumber";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@PhoneNumber",PhoneNumber)
            };
            this.ConnectionOpen();
            int row = this.Execute(sql, parameters);
            this.ConnectionClose();
            return row;
            //throw new NotImplementedException();
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
                this.ConnectionOpen();
                cmdDataSet = BuildCommand(commandText, parameters);

                using (SqlDataAdapter adapter = new SqlDataAdapter(cmdDataSet))
                {
                    adapter.Fill(result);
                }
            }
            finally
            {
                this.ConnectionClose();
            }

            cmd = cmdDataSet;
            return result;
            //throw new NotImplementedException();
        }

        public DataTable ExecuteDataTable(string commandText, params DbParameter[] parameters)
        {
            DataTable table;
            DbCommand command = null;
            try
            {
                table = this.ExecuteDataTable(out command,commandText,parameters);
            }
            finally
            {
                command.Parameters.Clear();
                command.Dispose();
            }
            
            return table;
        }

        public DataTable ExecuteDataTable(out DbCommand cmd, string commandText, params DbParameter[] parameters)
        {
            DataTable table = new DataTable();
            SqlCommand command;
            try
            {
                this.ConnectionOpen();
                command = this.BuildCommand(commandText,parameters);
                using(SqlDataAdapter da = new SqlDataAdapter(command))
                {
                    da.Fill(table);
                }
            }
            finally
            {
                this.ConnectionClose();
            }
            cmd = command;
            return table;
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
            return this.Execute(x=>x.ExecuteReader(),commandText,parameters);
        }

        public object ExecuteScalar(string commandText, params DbParameter[] parameters)
        {
        return Execute(x => x.ExecuteScalar(), commandText, parameters);
        }

        public object ExecuteScalar(out DbCommand cmd, string commandText, params DbParameter[] parameters)
        {
            return Execute(x => x.ExecuteScalar(), out cmd, commandText, parameters);
        }

        public XmlReader ExecuteXmlReader(string commandText, params DbParameter[] parameters)
        {
            DbCommand command;
            XmlReader reader = this.ExecuteXmlReader(out command,commandText,parameters);
            command.Parameters.Clear();
            command.Dispose();
            return reader;
        }

        public XmlReader ExecuteXmlReader(out DbCommand cmd, string commandText, params DbParameter[] parameters)
        {
            this.ConnectionOpen();
            SqlCommand command = this.BuildCommand(commandText,parameters);
            XmlReader reader = command.ExecuteXmlReader();
            cmd = command;
            return reader;
        }
    }
}
