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
            if(this.ValidationUser(PhoneNumber))
            {
                UserDB.Delete(PhoneNumber);
                return true;
            }
            return false;
           // Models.UserTable user = UserDB.Select(PhoneNumber);
            //throw new NotImplementedException();
        }

        public string Login(UserTable user)
        {
            if(this.ValidationUser(user))
            {
                Models.UserTable UserInfo = UserDB.Select(user.PhoneNumber)[0];
                if (UserInfo.Password.Trim() == user.Password)
                    return UserDB.Select(user.PhoneNumber)[0].UserName;
                else
                    return null;
            }
            else
            {
                return "该用户不存在";
            }
            //throw new NotImplementedException();
        }

          
        public bool RegistUser(UserTable user)
        {
            if(!this.ValidationUser(user))
            {
                UserDB.Insert(user);
                return true;
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
            //SqlParameter[] parameters = new SqlParameter[1];
            //parameters[0] = new SqlParameter("@phoneNumber", user.PhoneNumber);
            // if (UserDB.Select(user.PhoneNumber)!=null)
            // {
            //     return true;
            // }
            // return false;
            //throw new NotImplementedException();
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
            //throw new NotImplementedException();
        }
    }
}
