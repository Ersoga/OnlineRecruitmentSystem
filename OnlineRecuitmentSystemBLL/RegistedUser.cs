using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using OnlineRecuitmentSystemDAL;
using OnlineRecuitmentSystemIBLL;

namespace OnlineRecuitmentSystemBLL
{
    public class RegistedUser : AUser
    {
        public RegistedUser()
        {
            this.UserManager = new UserManager();
            this.dataBase = new SqlServer();
        }
        public bool Login(string userId,string password)
        {
            if(UserManager.ValidationUser(userId))
            {
                Models.UserTable userInfo = UserManager.GetInfo(userId);
                if(userInfo.Password.Trim() == password)
                {
                    this.UserInfo = userInfo;
                    this.LoginStatus = LoginInfo.LOGIN;
                    return true;
                }
                this.LoginStatus = LoginInfo.LOGIN_ERROR;
                return false;
            }
            this.LoginStatus = LoginInfo.NO_USER;
            return false;
        }
        public override List<Job> BrowseJobsInfo(int count)
        {
            throw new NotImplementedException();
        }

        public override List<Job> SelectJobsInfoByCity(int cityId)
        {
            string sql = "select * from Jobs where CollegesId in (select CollegesId from Colleges where CityId = @CityId);";
            DataTable table = dataBase.ExecuteDataTable(sql, parameterFactory.Create("CityId", DbType.Int32, cityId));
            List<Job> jobList = new List<Job>();
            foreach (DataRow row in table.Rows)
            {
                Job job = new Job();
                job.CollegesId = (string)row["CollegesId"];
                job.Contact = (string)row["CollegesId"];
                job.JobsName = (string)row["CollegesId"];
                job.ReleaseTime = (DateTime)row["CollegesId"];
                job.EndTime = (DateTime)row["CollegesId"];
                job.College = collegesManager.GetCollegeInfo((string)row["collegesId"]);
                job.DeliveryTables = null;
                jobList.Add(job);
            }
            return jobList;
        }

        public override List<Job> SelectJobsInfoByCollege(string collegeId)
        {
            throw new NotImplementedException();
        }

        public override List<Job> SelectJobsInfoByJobName(string jobName)
        {
            throw new NotImplementedException();
        }
    }
}
