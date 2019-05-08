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
        UN_LOGIN,//未登陆
        LOGIN,//登录
        LOOUT,//登出
        LOGIN_ERROR,//登录错误
        NO_USER//没有此用户
    }
    public abstract class IUser
    {
        public ICollegesManager collegesManager { get; set; }
        public IParameterCreate parameterFactory { get; set; }
        public IDataBase dataBase { get; set; }
        public LoginInfo LoginStatus { get; set; }
        public Models.UserTable UserInfo { get; set; }
        public IUserManager UserManager { get; set; }
        public abstract List<Models.Jobs> SelectJobsInfoByCity(string cityName);
        public abstract List<Models.Jobs> SelectJobsInfoByCollege(string collegeId);
        public abstract List<Models.Jobs> SelectJobsInfoByJobName(string jobName);
        /// <summary>
        /// 随机返回count个值
        /// </summary>
        /// <returns></returns>
        public abstract List<Models.Jobs> BrowseJobsInfo(int count);
    }
}
