using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineRecuitmentSystemIBLL
{
    public interface ICollegesManager
    {
        bool Register(Models.College college);
        bool DeleteCollege(string key);
        bool ValidationUser(string key);
        Models.College GetCollegeInfo(string key);
    }
}
