using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineRecuitmentSystemIDAL
{
    public interface IDataBase
    {
        string ConnectStr { get; set; }
        void Insert(Models.UserTable user);
        void Delete(Models.UserTable user);
        int Delete(string PhoneNumber);
        void Alter(Models.UserTable user);
        Models.UserTable Select(string phone);
        int Execute();
        //ArraySegment<Models.UserTable> Select(string userName);
    }
}
