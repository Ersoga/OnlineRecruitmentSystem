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
            parameterFactory = new ParameterFactory();
            collegesManager = new CollagesManager();
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
            string sql = "select top " + count.ToString() + " * from Jobs order by newid();";
            DataTable table = dataBase.ExecuteDataTable(sql);
            List<Job> jobList = new List<Job>();
            foreach (DataRow row in table.Rows)
            {
                Job job = new Job();
                job.CollegesId = (string)row["CollegesId"];
                job.Contact = (string)row["Contact"];
                job.JobsName = (string)row["JobsName"];
                job.ReleaseTime = (DateTime)row["ReleaseTime"];
                job.EndTime = (DateTime)row["EndTime"];
                job.College = collegesManager.GetCollegeInfo((string)row["CollegesId"]);
                job.DeliveryTables = null;
                jobList.Add(job);
            }
            return jobList;
        }
        /// <summary>
        /// 根据城市查询岗位
        /// </summary>
        /// <param name="cityId"></param>
        /// <returns></returns>
        public override List<Job> SelectJobsInfoByCity(string cityName)
        {
            string sql = "select * from Jobs where CollegesId in (select CollegesId from Colleges where CityId in (select CityId from City where CityName = @CityName));";
            DataTable table = new DataTable();
            table = dataBase.ExecuteDataTable(sql, parameterFactory.Create("CityName", DbType.String, cityName));
            List<Job> jobList = new List<Job>();
            foreach (DataRow row in table.Rows)
            {
                Job job = new Job();
                job.CollegesId = (string)row["CollegesId"];
                job.Contact = (string)row["Contact"];
                job.JobsName = (string)row["JobsName"];
                job.ReleaseTime = (DateTime)row["ReleaseTime"];
                job.EndTime = (DateTime)row["EndTime"];
                job.College = collegesManager.GetCollegeInfo((string)row["collegesId"]);
                job.DeliveryTables = null;
                jobList.Add(job);
            }
            return jobList;
        }
        /// <summary>
        /// 根据学校查询岗位
        /// </summary>
        /// <param name="collegeId"></param>
        /// <returns></returns>
        public override List<Job> SelectJobsInfoByCollege(string collegeId)
        {
            string sql = "select * from Jobs where CollegesId = @CollegesId;";
            DataTable table = dataBase.ExecuteDataTable(sql, parameterFactory.Create("CollegeId", DbType.String, collegeId));
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

        public override List<Job> SelectJobsInfoByJobName(string jobName)
        {
            string sql = "select * from Jobs where JobsName like %@CollegesId%;";
            DataTable table = dataBase.ExecuteDataTable(sql, parameterFactory.Create("CollegeId", DbType.String, jobName));
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
    }
}
