using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace OnlineRecuitmentSystemIBLL
{
    public interface IUserManager
    {
        bool RegistUser(Models.UserTable user);
        bool DeleteUser(string PhoneNumber);
        string Login(Models.UserTable user);
        bool ValidationUser(Models.UserTable user);
        bool ValidationUser(string phoneNumber);
    }
}
