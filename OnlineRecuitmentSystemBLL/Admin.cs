using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineRecuitmentSystemIBLL;
using OnlineRecuitmentSystemIDAL;
using OnlineRecuitmentSystemDAL;
using System.Data;

namespace OnlineRecuitmentSystemBLL
{
    public class Admin
    {
        IDataBase dataBase = new SqlServer();
        private IUserManager userManager = new UserManager();
        private ICollegesManager collegesManager = new CollagesManager();
        ParameterFactory parameterFactory = new ParameterFactory();
        /// <summary>
        /// 获取用户信息
        /// </summary>
        /// <param name="phoneNumber"></param>
        /// <returns></returns>
        public Models.UserTable GetUserInfo(string phoneNumber)
        {
            return userManager.GetInfo(phoneNumber);
        }
        /// <summary>
        /// 获取高校信息
        /// </summary>
        /// <param name="collegeId"></param>
        /// <returns></returns>
        public Models.College GetCollegeInfo(string collegeId)
        {
            return collegesManager.GetCollegeInfo(collegeId);
        }
        /// <summary>
        /// 删除高校
        /// </summary>
        /// <param name="collegeId"></param>
        public void DeleteCollege(string collegeId)
        {
            collegesManager.DeleteCollege(collegeId);
        }
        /// <summary>
        /// 通过高校信息审核
        /// </summary>
        /// <param name="collegeId"></param>
        /// <returns></returns>
        public bool ValidationCollege(string collegeId)
        {
            string sql = "alter table Colleges set IsVerification = 1 where CollegesId = @CollegesId;";
            if(collegesManager.ValidationUser(collegeId))
            {
                return dataBase.ExecuteNonQuery(sql, parameterFactory.Create("@CollegesId", System.Data.DbType.String, collegeId)) != 0;
            }
            return false;
        }
        /// <summary>
        /// 将用户拉入黑名单
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public bool SetUserToBlackList(string userId)
        {
            string sql = "alter table UserTable set Type = 'Black' where PhoneNumber = @PhoneNumber;";
            if(userManager.ValidationUser(userId))
            {
                return dataBase.ExecuteNonQuery(sql, parameterFactory.Create("@PhoneNumber", System.Data.DbType.String, userId)) != 0;
            }
            return false;
        }
    }
}
