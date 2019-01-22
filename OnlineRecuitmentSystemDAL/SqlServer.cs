using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using OnlineRecuitmentSystemIDAL;
using System.Configuration;
namespace OnlineRecuitmentSystemDAL
{
    public class SqlServer : IDataBase
    {
        public string ConnectStr { get; set; }

        public SqlServer()
        {
            this.ConnectStr = ConfigurationManager.ConnectionStrings["sqlConnectionDAL"].ToString();
        }
        public SqlServer(string str)
        {
            this.ConnectStr = str;
        }

        public void Alter(UserTable user)
        {
            throw new NotImplementedException();
        }

        public void Delete(UserTable user)
        {
            throw new NotImplementedException();
        }

        public void Insert(UserTable user)
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
            this.Execute(ref sql, parameters);
            //throw new NotImplementedException();
        }

        public UserTable Select(string sql, params SqlParameter[] parameter)
        {
            UserTable table = new UserTable();
            //string sql = "select * from UserTable where phoneNumber = @phoneNumber;";
            SqlDataReader sqlData = this.Read(ref sql, parameter);
            if(this.Execute(ref sql, parameter)==1)
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
            return table;
            //throw new NotImplementedException();
        }

        private SqlConnection Connect()
        {
            SqlConnection con = new SqlConnection(ConnectStr);
            con.Open();
            return con;
        }
        private SqlCommand Command(ref string sql, params SqlParameter[] parameter)
        {
            //SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand com = new SqlCommand(sql, this.Connect());
            com.Parameters.AddRange(parameter);
            return com;
        }
        /// <summary>
        /// 查看修改行数
        /// </summary>
        /// <param name="sql">sql</param>
        /// <returns></returns>
        public virtual int Execute(ref string sql, params SqlParameter[] parameter)
        {
            return this.Command(ref sql, parameter).ExecuteNonQuery();
        }
        /// <summary>
        /// 获取数据集
        /// </summary>
        /// <param name="sql">sql</param>
        /// <returns></returns>


        public virtual SqlDataReader Read(ref string sql, params SqlParameter[] parameter)
        {
            return this.Command(ref sql, parameter).ExecuteReader();
        }

        public UserTable Select(string phone)
        {
            UserTable table = new UserTable();
            string sql = "select * from UserTable where PhoneNumber = @PhoneNumber;";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@PhoneNumber",phone)
            };
            SqlDataReader sqlData = this.Read(ref sql, parameters);
            if (sqlData.HasRows)
            {
                sqlData.Read();
                table.UserName = (string)sqlData["UserName"];
                table.Password = (string)sqlData["Password"];
                table.RegistrationTime = (DateTime)sqlData["RegistrationTime"];
                table.Type = (string)sqlData["Type"];
            }
            else
            {
                //throw new ArgumentException("参数无效");//参数无效
                return null;
            }
            return table;
            //throw new NotImplementedException();
        }

        public int Execute()
        {
            throw new NotImplementedException();
        }

        public int Delete(string PhoneNumber)
        {
            throw new NotImplementedException();
        }
    }
}
