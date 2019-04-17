using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineRecuitmentSystemIDAL;

namespace OnlineRecuitmentSystemIBLL
{
    public enum LoginInfo
    {
        UN_LOGIN,
        LOGIN,
        LOOUT,
        LOGIN_ERROR,
        NO_USER
    }
    public abstract class AUser
    {
        public ICollegesManager collegesManager { get; set; }
        public IParameterCreate parameterFactory { get; set; }
        public IDataBase dataBase { get; set; }
        public LoginInfo LoginStatus { get; set; }
        public Models.UserTable UserInfo { get; set; }
        public IUserManager UserManager { get; set; }
        public abstract List<Models.Job> SelectJobsInfoByCity(string cityName);
        public abstract List<Models.Job> SelectJobsInfoByCollege(string collegeId);
        public abstract List<Models.Job> SelectJobsInfoByJobName(string jobName);
        /// <summary>
        /// 随机返回count个值
        /// </summary>
        /// <returns></returns>
        public abstract List<Models.Job> BrowseJobsInfo(int count);
    }
}
