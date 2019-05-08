using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineRecuitmentSystemIBLL;
using OnlineRecuitmentSystemDAL;
using OnlineRecuitmentSystemIDAL;
using Models;

namespace OnlineRecuitmentSystemBLL
{
    public class UserManager : IUserManager
    { 
         
        IDataBase UserDB = new SqlServer();
        ParameterFactory parameterFactory = new OnlineRecuitmentSystemDAL.ParameterFactory();
        public bool DeleteUser(string PhoneNumber)
        { 
            string sql = "Delete from UserTable where PhoneNumber=@PhoneNumber;";
            if(this.ValidationUser(PhoneNumber))
            {
                if(UserDB.ExecuteNonQuery(sql,parameterFactory.Create("@PhoneNumber",DbType.String,PhoneNumber))>0)
                {
                    return true;
                }
            }
            return false;
        }

        public Models.UserTable GetInfo(string key)
        {
            Models.UserTable user = null;
            DataRow row = this.GetUserRow(key);
            if(row!=null)
            {
                user = new UserTable();
                user.PhoneNumber = (string)row["PhoneNumber"];
                user.Password = (string)row["Password"];
                user.RegistrationTime = (DateTime)row["RegistrationTime"];
                user.Type = (string)row["Type"];
                user.UserName = (string)row["UserName"];
                return user;
            }
            else
            {
                return null;
            }
        }

        public string Login(UserTable user)
        {
            if(this.ValidationUser(user))
            {
                Models.UserTable UserInfo = UserDB.Select(user.PhoneNumber)[0];
                string sql = "select * from UserTable where PhoneNumber = @PhoneNumber;";
                
                DataTable table = UserDB.ExecuteDataTable(sql,parameterFactory.Create("@PhoneNumber",DbType.String,user.PhoneNumber));
                DataRow row = table.Select("PhoneNumber = "+user.PhoneNumber)[0];
                //if (UserInfo.Password.Trim() == user.Password)
                //    return UserDB.Select(user.PhoneNumber)[0].UserName;
                //else
                //    return null;
                if(row["Password"].ToString().Trim()==user.Password)
                {
                    return (string)row["UserName"];
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return "该用户不存在";
            }
        }

        public string Login(string userName, string password)
        {
            throw new NotImplementedException();
        }

        public bool RegistUser(UserTable user)
        {
            string sql = "insert into UserTable values(@PhoneNumber,@UserName,@Password,@Type,@RegistrationTime);";
            DbParameter[] sqlParameters = new DbParameter[]
                {
                    parameterFactory.Create("@PhoneNumber",DbType.String,user.PhoneNumber),
                    parameterFactory.Create("@UserName",DbType.String,user.UserName),
                    parameterFactory.Create("@Password",DbType.String,user.Password),
                    parameterFactory.Create("@RegistrationTime",DbType.DateTime,user.RegistrationTime),
                    parameterFactory.Create("@Type",DbType.String,user.Type)
                };
            if(!this.ValidationUser(user))
            {
                if(UserDB.ExecuteNonQuery(sql,sqlParameters)>0)
                {
                    return true;
                }
            }
            return false;
            //throw new NotImplementedException();
        }
        /// <summary>
        /// 验证用户是否存在
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public bool ValidationUser(UserTable user)
        {
            string sql = "select count(*) from UserTable where PhoneNumber = @phoneNumber;";
            if((int)UserDB.ExecuteScalar(sql, parameterFactory.Create("@phoneNumber", DbType.String, user.PhoneNumber)) > 0)
            {
                return true;
            }
            return false;
        }

        public bool ValidationUser(string phoneNumber)
        {
            string sql = "select count(*) from UserTable where PhoneNumber = @phoneNumber;";
            if ((int)UserDB.ExecuteScalar(sql,parameterFactory.Create("@phoneNumber",DbType.String,phoneNumber))>0)
            {
                return true;
            }
            return false;
        }
        private DataRow GetUserRow(string key)
        {
            string sql = "select * from UserTable where PhoneNumber = @PhoneNumber;";
            DataTable table = new DataTable();
            table = UserDB.ExecuteDataTable(sql, parameterFactory.Create("@PhoneNumber", DbType.String, key));
            if (table.Rows.Count == 1)
                return table.Rows[0];
            return null;
        }
    }
}
