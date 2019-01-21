using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineRecuitmentSystemIBLL;
using OnlineRecuitmentSystemDAL;
using OnlineRecuitmentSystemIDAL;
using Models;
using System.Data.SqlClient;

namespace OnlineRecuitmentSystemBLL
{
    public class UserManager : IUserManager
    {
        IDataBase UserDB = new SqlServer();
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
                return user.UserName;
            }
            else
            {
                return null;
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
            //string sql = "select * from UserTable where phoneNumber = @phoneNumber;";
            //SqlParameter[] parameters = new SqlParameter[1];
            //parameters[0] = new SqlParameter("@phoneNumber", user.PhoneNumber);
            if (UserDB.Select(user.PhoneNumber)!=null)
            {
                return true;
            }
            return false;
            //throw new NotImplementedException();
        }

        public bool ValidationUser(string phoneNumber)
        {
            if (UserDB.Select(phoneNumber) != null)
            {
                return true;
            }
            return false;
            //throw new NotImplementedException();
        }
    }
}
