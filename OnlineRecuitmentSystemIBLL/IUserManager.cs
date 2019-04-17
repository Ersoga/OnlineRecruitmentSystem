using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using System.Data;

namespace OnlineRecuitmentSystemIBLL
{
    public interface IUserManager
    {
        bool RegistUser(Models.UserTable user);
        bool DeleteUser(string PhoneNumber);
        string Login(string userName, string password);
        bool ValidationUser(string phoneNumber);
        Models.UserTable GetInfo(string key);
    }
}
