using OnlineRecuitmentSystemDAL;
using OnlineRecuitmentSystemIBLL;
using OnlineRecuitmentSystemIDAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineRecuitmentSystemBLL
{
    public class College
    {
        ICollegesManager collegesManager = new CollegesManager();
        IDataBase dataBase = new SqlServer();
        IParameterCreate parameterCreate = new ParameterFactory();
        public Models.College CollegeInfo { get; set; }
        public College()
        {
            CollegeInfo = new Models.College();
        }
        /// <summary>
        /// 登陆
        /// </summary>
        /// <param name="collegeId"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public bool Login(string collegeId,string password)
        {
            if(collegesManager.ValidationUser(collegeId))
            {
                string sql = "select * from Colleges where CollegesId = @CollegesId;";
                DataTable data = new DataTable();
                data = dataBase.ExecuteDataTable(sql, parameterCreate.Create("@CollegesId", DbType.String, collegeId));
                if(data.Rows[0]["Password"].ToString().Trim()==password)
                {
                    DataRow row = data.Rows[0];
                    CollegeInfo.CollegesId = (string)row["CollegesId"];
                    CollegeInfo.CollegesName = (string)row["CollegesName"];
                    CollegeInfo.Contact = (string)row["Contact"];
                    CollegeInfo.Introduction = (string)row["Introduction"];
                    CollegeInfo.CityId = (Int32)row["CityId"];
                    return true;
                }
                return false;
            }
            return false;
        }/// <summary>
        /// 发布岗位
        /// </summary>
        /// <param name="job"></param>
        /// <returns></returns>
        public bool ReleasePost(Models.Jobs job)
        {
            string sql = "insert into Jobs values(@JobsName,@CollegesId,@ReleaseTime,@EndTime,@Comtact,@PayRangeLow,@PayRangeHigh,@TrialLectureTime,@Trialinfo);";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterCreate.Create("@JobsName",DbType.String,job.JobsName),
                parameterCreate.Create("@CollegesId",DbType.String,job.CollegesId),
                parameterCreate.Create("@ReleaseTime",DbType.DateTime,job.ReleaseTime),
                parameterCreate.Create("@EndTime",DbType.DateTime,job.EndTime),
                parameterCreate.Create("@Comtact",DbType.String,job.Contact),
                parameterCreate.Create("@PayRangeLow",DbType.Double,job.PayRangeLow),
                parameterCreate.Create("@PayRangeHigh",DbType.Double,job.PayRangeHigh),
                parameterCreate.Create("@TrialInfo",DbType.String,job.TrialInfo),
                parameterCreate.Create("@TrialLecture",DbType.DateTime,job.TrialLectureTime)
            };
            return dataBase.ExecuteNonQuery(sql, parameters) == 1;
        }
        /// <summary>
        /// 查看报名人员
        /// </summary>
        /// <param name="jobName"></param>
        /// <param name="collegeId"></param>
        /// <returns></returns>
        public List<Models.UserTable> GetUsers(string jobName,string collegeId)
        {
            string sql = "select * from UserTable where UserId in (select UserId from DeliveryTable where JobsName = @JobName and CollegesId = @CollegeId);";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterCreate.Create("@JobName",DbType.String,jobName),
                parameterCreate.Create("@CollegeId",DbType.String,collegeId)
            };
            DataTable data = new DataTable();
            List<Models.UserTable> users = null;
            data = dataBase.ExecuteDataTable(sql, parameters);
            foreach (DataRow item in data.Rows)
            {
                Models.UserTable user = new Models.UserTable();
                user.UserName = (string)item["UserName"];
                user.Password = null;
                user.PhoneNumber = (string)item["PhoneNumber"];
                user.RegistrationTime = (DateTime)item["RegisterTime"];
                users.Add(user);
            }
            return users;
        }
        /// <summary>
        /// 安排试讲
        /// </summary>
        /// <param name="time">试讲时间</param>
        /// <param name="info">试讲信息</param>
        /// <returns></returns>
        public bool ArrangeTrial(string jobName,DateTime time,string info)
        {
            string sql = "update Jobs set TrialLecture = @time,TrialInfo = @TrialInfo where JobsName = @JobName and CollegesId = @CollegeId;";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterCreate.Create("@JobName",DbType.String,jobName),
                parameterCreate.Create("@CollegeId",DbType.String,this.CollegeInfo.CollegesId),
                parameterCreate.Create("@TrialInfo",DbType.String,info),
                parameterCreate.Create("@TrialLecture",DbType.DateTime,time)
            };
            return dataBase.ExecuteNonQuery(sql, parameters)==1;
        }
        public bool GradeForUser(string jobName,string userId,double score)
        {
            string sql = "update DeliveryTable set TrialScore=@TrialScore where UserId = @UserId,CollegesId = @CollegesId,JobsName = @JobsName;";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterCreate.Create("@JobName",DbType.String,jobName),
                parameterCreate.Create("@CollegeId",DbType.String,this.CollegeInfo.CollegesId),
                parameterCreate.Create("@TrialScore",DbType.Double,score),
                parameterCreate.Create("@UserId",DbType.String,userId)
            };
            return dataBase.ExecuteNonQuery(sql, parameters) == 1;
        }

        public List<Models.Jobs> GetJobs()
        {
            string sql = "select * from Jobs where CollegesId = @CollegesId Desc ReleaseTime;";
            DataTable data = new DataTable();
            List<Models.Jobs> jobs = null;
            data = dataBase.ExecuteDataTable(sql, parameterCreate.Create("@CollegesId",DbType.String,this.CollegeInfo.CollegesId));
            foreach (DataRow item in data.Rows)
            {
                Models.Jobs job = new Models.Jobs();
                job.JobsName = (string)item["JobsName"];
                job.PayRangeHigh = (Double)item["PayRangeHigh"];
                job.PayRangeLow = (Double)item["PayRangeLow"];
                job.ReleaseTime = (DateTime)item["ReleaseTime"];
                job.Contact = (string)item["Contact"];
                job.TrialLectureTime = (DateTime)item["TrialLectureTime"];
                job.EndTime = (DateTime)item["EndTime"];
                job.TrialInfo = (string)item["TrialInfo"];
                job.Introduction = (string)item["Introduction"];
                jobs.Add(job);
            }
            return jobs;
        }
    }
}
