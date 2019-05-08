using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using OnlineRecuitmentSystemDAL;
using OnlineRecuitmentSystemIBLL;

namespace OnlineRecuitmentSystemBLL
{
    public class User : IUser
    {
        public User()
        {
            this.UserManager = new UserManager();
            this.dataBase = new SqlServer();
            parameterFactory = new ParameterFactory();
            collegesManager = new CollegesManager();
        }
        public bool Register(Models.UserTable user)
        {
            if (UserManager.RegistUser(user))
                return true;
            return false;
        }
        public bool Login(string userId,string password)
        {
            if(UserManager.ValidationUser(userId))
            {
                Models.UserTable userInfo = UserManager.GetInfo(userId);
                if(userInfo.Password.Trim() == password)
                {
                    this.UserInfo = userInfo;
                    this.UserInfo.Resumes = this.GetResumes(this.UserInfo.PhoneNumber);
                    this.LoginStatus = LoginInfo.LOGIN;
                    return true;
                }
                this.LoginStatus = LoginInfo.LOGIN_ERROR;
                return false;
            }
            this.LoginStatus = LoginInfo.NO_USER;
            return false;
        }
        public override List<Jobs> BrowseJobsInfo(int count)
        {
            string sql = "select top " + count.ToString() + " * from Jobs order by newid();";
            DataTable table = dataBase.ExecuteDataTable(sql);
            List<Jobs> jobList = new List<Jobs>();
            foreach (DataRow row in table.Rows)
            {
                Jobs job = new Jobs();

                job.CollegesId = (string)row["CollegesId"];
                job.Contact = (string)row["Contact"];
                job.JobsName = (string)row["JobsName"];
                job.ReleaseTime = (DateTime)row["ReleaseTime"];
                job.EndTime = (DateTime)row["EndTime"];
                job.PayRangeLow = (double)row["PayRangeLow"];
                job.PayRangeHigh = (double)row["PayRangeHigh"];
                job.Introduction = (string)row["Introduction"];
                job.TrialLectureTime = (DateTime)row["TrialLectureTime"];
                job.TrialInfo = (string)row["TrialInfo"];
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
        public override List<Jobs> SelectJobsInfoByCity(string cityName)
        {
            string sql = "select * from Jobs where CollegesId in (select CollegesId from Colleges where CityId in (select CityId from City where CityName = @CityName));";
            DataTable table = new DataTable();
            table = dataBase.ExecuteDataTable(sql, parameterFactory.Create("CityName", DbType.String, cityName));
            List<Jobs> jobList = new List<Jobs>();
            foreach (DataRow row in table.Rows)
            {
                Jobs job = new Jobs
                {
                    CollegesId = (string)row["CollegesId"],
                    Contact = (string)row["Contact"],
                    JobsName = (string)row["JobsName"],
                    ReleaseTime = (DateTime)row["ReleaseTime"],
                    EndTime = (DateTime)row["EndTime"],
                    PayRangeLow = (double)row["PayRangeLow"],
                    PayRangeHigh = (double)row["PayRangeHigh"],
                    TrialLectureTime = (DateTime)row["TrialLectureTime"],
                    TrialInfo = (string)row["TrialInfo"],
                    Introduction = (string)row["Introduction"],
                    College = collegesManager.GetCollegeInfo((string)row["collegesId"]),
                    DeliveryTables = null
                };
                jobList.Add(job);
            }
            return jobList;
        }
        /// <summary>
        /// 根据学校查询岗位
        /// </summary>
        /// <param name="collegeId"></param>
        /// <returns></returns>
        public override List<Jobs> SelectJobsInfoByCollege(string collegeId)
        {
            string sql = "select * from Jobs where CollegesId = @CollegesId;";
            DataTable table = dataBase.ExecuteDataTable(sql, parameterFactory.Create("CollegeId", DbType.String, collegeId));
            List<Jobs> jobList = new List<Jobs>();
            foreach (DataRow row in table.Rows)
            {
                Jobs job = new Jobs
                {
                    CollegesId = (string)row["CollegesId"],
                    Contact = (string)row["Contact"],
                    JobsName = (string)row["JobsName"],
                    ReleaseTime = (DateTime)row["ReleaseTime"],
                    EndTime = (DateTime)row["EndTime"],
                    PayRangeLow = (double)row["PayRangeLow"],
                    PayRangeHigh = (double)row["PayRangeHigh"],
                    TrialLectureTime = (DateTime)row["TrialLectureTime"],
                    TrialInfo = (string)row["TrialInfo"],
                    Introduction = (string)row["Introduction"],
                    College = collegesManager.GetCollegeInfo((string)row["collegesId"]),
                    DeliveryTables = null
                };
                jobList.Add(job);
            }
            return jobList;
        }

        public override List<Jobs> SelectJobsInfoByJobName(string jobName)
        {
            string sql = "select * from Jobs where JobsName like @JobsName;";
            DataTable table = dataBase.ExecuteDataTable(sql, parameterFactory.Create("JobsName", DbType.String, "%"+jobName+"%"));
            List<Jobs> jobList = new List<Jobs>();
            foreach (DataRow row in table.Rows)
            {
                Jobs job = new Jobs
                {
                    CollegesId = (string)row["CollegesId"],
                    Contact = (string)row["Contact"],
                    JobsName = (string)row["JobsName"],
                    ReleaseTime = (DateTime)row["ReleaseTime"],
                    EndTime = (DateTime)row["EndTime"],
                    PayRangeLow = (double)row["PayRangeLow"],
                    PayRangeHigh= (double)row["PayRangeHigh"],
                    TrialLectureTime = (DateTime)row["TrialLectureTime"],
                    TrialInfo = (string)row["TrialInfo"],
                    Introduction = (string)row["Introduction"],
                    College = collegesManager.GetCollegeInfo((string)row["collegesId"]),
                    DeliveryTables = null
                };
                jobList.Add(job);
            }
            return jobList;
        }
        public bool CreateResume(Models.Resume resume)
        {
            string sql = "insert into Resume values(@ResumeId,@Name,@Gender,@YearOfBrithady,@MonthOfBrithday,@DayOfBrithday,@CardType,@IdNumber,@Salary,@CurrencyType,@Mobile,@QQ,@Email,@PlaceOfDomicile,@CityId,@Address,@Weight,@Height,@Marrige,@HomePage,@WorkYear,@Introduction,@UserId);";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterFactory.Create("@ResumeId",DbType.Int32,resume.ResumeID),
                parameterFactory.Create("@Name",DbType.String,resume.Name),
                parameterFactory.Create("@Gender",DbType.Int32,resume.Gender),
                parameterFactory.Create("@YearOfBrithady",DbType.String,resume.YearOfBirthday),
                parameterFactory.Create("@MonthOfBrithday",DbType.String,resume.MonthOfBirthday),
                parameterFactory.Create("@DayOfBrithday",DbType.String,resume.DayOfBirthday),
                parameterFactory.Create("@CardType",DbType.Int32,resume.CardType),
                parameterFactory.Create("@IdNumber",DbType.String,resume.IDNumber),
                parameterFactory.Create("@Salary",DbType.Int32,resume.Salary),
                parameterFactory.Create("@CurrencyType",DbType.Int32,resume.CurrencyType),
                parameterFactory.Create("@Mobile",DbType.String,resume.Mobile),
                parameterFactory.Create("@QQ",DbType.String,resume.QQ),
                parameterFactory.Create("@Email",DbType.String,resume.Email),
                parameterFactory.Create("@PlaceOfDomicile",DbType.String,resume.PlaceOfDomicile),
                parameterFactory.Create("@CityId",DbType.Int32,resume.CityId),
                parameterFactory.Create("@Address",DbType.String,resume.Address),
                parameterFactory.Create("@Weight",DbType.Int32,resume.Weight),
                parameterFactory.Create("@Height",DbType.Int32,resume.Height),
                parameterFactory.Create("@Marrige",DbType.Int32,resume.Marrige),
                parameterFactory.Create("@HomePage",DbType.String,resume.HomePage),
                parameterFactory.Create("@WorkYear",DbType.Int32,resume.WorkYear),
                parameterFactory.Create("@Introduction",DbType.String,resume.Introduction),
                parameterFactory.Create("@UserId",DbType.String,resume.UserId)
            };
            return dataBase.ExecuteNonQuery(sql, parameters) == 1;
        }

        public bool AddEducationExperience(Models.EducationBackground education)
        {
            string sql = "insert into Resume values(@EduId,@FromYear,@FormMonth,@ToYear,@ToMonth,@SchoolName,@SubMajor,@Degree,@EduDetail,@IsOverSeas,@ResumeId);";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterFactory.Create("@EduId",DbType.Int32,education.EduID),
                parameterFactory.Create("@FromYear",DbType.String,education.FromYear),
                parameterFactory.Create("@FormMonth",DbType.String,education.FromMonth),
                parameterFactory.Create("@ToYear",DbType.String,education.ToYear),
                parameterFactory.Create("@ToMonth",DbType.String,education.ToMonth),
                parameterFactory.Create("@SchoolName",DbType.String,education.SchoolName),
                parameterFactory.Create("@SubMajor",DbType.String,education.SubMajor),
                parameterFactory.Create("@Degree",DbType.Int32,education.Degree),
                parameterFactory.Create("@EduDetail",DbType.String,education.EduDetail),
                parameterFactory.Create("@IsOverSeas",DbType.Boolean,education.IsOverSeas),
                parameterFactory.Create("@ResumeId",DbType.Int32,education.ResumeID)
            };
            return dataBase.ExecuteNonQuery(sql, parameters) == 1;
        }
        public bool AddWorkExperience(Models.WorkExperience work)
        {
            string sql = "insert into Resume values(@WorkId,@FromYear,@FormMonth,@ToYear,@ToMonth,@CompanyName,@Position,@Responsiblity,@IsOverSeas,@ResumeId);";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterFactory.Create("@WorkId",DbType.Int32,work.WorkID),
                parameterFactory.Create("@FromYear",DbType.String,work.FromYear),
                parameterFactory.Create("@FormMonth",DbType.String,work.FromMonth),
                parameterFactory.Create("@ToYear",DbType.String,work.ToYear),
                parameterFactory.Create("@ToMonth",DbType.String,work.ToMonth),
                parameterFactory.Create("@CompanyName",DbType.String,work.CompanyName),
                parameterFactory.Create("@Responsiblity",DbType.String,work.Responsiblity),
                parameterFactory.Create("@IsOverSeas",DbType.Boolean,work.IsOverSeas),
                parameterFactory.Create("@ResumeId",DbType.Int32,work.ResumeID)
            };
            return dataBase.ExecuteNonQuery(sql, parameters) == 1;
        }
        public Models.Resume GetResume(string resumeID)
        {
            string sql = "select * from Resume where ResumeID = @ResumeID;";
            DbDataReader reader = dataBase.ExecuteReader(sql, parameterFactory.Create("@ResumeID", DbType.String, resumeID));
            Resume resume = new Resume();
            if (reader.Read())
            {
                resume.ResumeID = (int)reader["ResumeID"];
                resume.Name = (string)reader["Name"];
                resume.Gender = (int)reader["Gender"];
                resume.YearOfBirthday = (string)reader["YearOfBirthday"];
                resume.DayOfBirthday = (string)reader["DayOfBirthday"];
                resume.CardType = (int)reader["CardType"];
                resume.IDNumber = (string)reader["IDNumber"];
                resume.MonthOfBirthday = (string)reader["MonthOfBirthday"];
                resume.Address = (string)reader["Address"];
                resume.CurrencyType = (int)reader["CurrencyType"];
                resume.Salary = (int)reader["Salary"];
                resume.Mobile = (string)reader["Mobile"];
                resume.QQ = (string)reader["QQ"];
                resume.Email = (string)reader["Email"];
                resume.PlaceOfDomicile = (string)reader["PlaceOfDomicile"];
                resume.CityId = (int)reader["CityId"];
                resume.Weight = (int)reader["Weight"];
                resume.Height = (int)reader["Height"];
                resume.Marrige = (int)reader["Marrige"];
                resume.HomePage = (string)reader["HomePage"];
                resume.WorkYear = (int)reader["WorkYear"];
                resume.Introduction = (string)reader["Introduction"];
                resume.UserId = (string)reader["UserId"];

                resume.EducationBackgrounds = this.GetEducations(resume.ResumeID);
                resume.WorkExperiences = this.GetWorkExperiences(resume.ResumeID);
            }
            return resume;

        }
        public List<Models.Resume> GetResumes(string userId)
        {
            string sql = "select * from Resume where UserId = @UserId;";
            DbDataReader reader = dataBase.ExecuteReader(sql, parameterFactory.Create("@UserId", DbType.String, userId));
            List<Resume> resumes = new List<Resume>();
            while(reader.Read())
            {
                Resume resume = new Resume
                {
                    ResumeID = (int)reader["ResumeID"],
                    Name = (string)reader["Name"],
                    Gender = (int)reader["Gender"],
                    YearOfBirthday = (string)reader["YearOfBirthday"],
                    DayOfBirthday = (string)reader["DayOfBirthday"],
                    CardType = (int)reader["CardType"],
                    IDNumber = (string)reader["IDNumber"],
                    MonthOfBirthday = (string)reader["MonthOfBirthday"],
                    Address = (string)reader["Address"],
                    CurrencyType = (int)reader["CurrencyType"],
                    Salary = (int)reader["Salary"],
                    Mobile = (string)reader["Mobile"],
                    QQ = (string)reader["QQ"],
                    Email = (string)reader["Email"],
                    PlaceOfDomicile = (string)reader["PlaceOfDomicile"],
                    CityId = (int)reader["CityId"],
                    Weight = (int)reader["Weight"],
                    Height = (int)reader["Height"],
                    Marrige = (int)reader["Marrige"],
                    HomePage = (string)reader["HomePage"],
                    WorkYear = (int)reader["WorkYear"],
                    Introduction = (string)reader["Introduction"],
                    UserId = (string)reader["UserId"]
                };
                
                resume.EducationBackgrounds = this.GetEducations(resume.ResumeID);
                resume.WorkExperiences = this.GetWorkExperiences(resume.ResumeID);
                resumes.Add(resume);
                
            }
            reader.Close();
            return resumes;
            
        }
        private List<Models.EducationBackground> GetEducations(int resumeId)
        {
            string sql = "select * from EducationBackground where ResumeId = @ResumeID;";
            DbDataReader reader = dataBase.ExecuteReader(sql, parameterFactory.Create("@ResumeId", DbType.Int32, resumeId));
            List<Models.EducationBackground> educations = new List<EducationBackground>();
            while(reader.Read())
            {
                EducationBackground education = new EducationBackground();
                education.EduID = (int)reader["EduId"];
                education.EduDetail = (string)reader["EduDetail"];
                education.Degree = (int)reader["Degree"];
                education.FromYear = (string)reader["FromYear"];
                education.FromMonth = (string)reader["FromMonth"];
                education.ToYear = (string)reader["ToYear"];
                education.ToMonth = (string)reader["ToMonth"];
                education.ResumeID = (int)reader["ResumeID"];
                education.SchoolName = (string)reader["SchoolName"];
                education.SubMajor = (string)reader["SubMajor"];
                education.IsOverSeas = (int)reader["IsOverSeas"];

                educations.Add(education);
            }
            reader.Close();
            return educations;
        }
        private List<Models.WorkExperience> GetWorkExperiences(int resumeId)
        {
            string sql = "select * from WorkExperience where ResumeId = @ResumeID;";
            DbDataReader reader = dataBase.ExecuteReader(sql, parameterFactory.Create("@ResumeId", DbType.Int32, resumeId));
            List<Models.WorkExperience> works = new List<WorkExperience>();
            while (reader.Read())
            {
                Models.WorkExperience work = new WorkExperience
                {
                    WorkID = (int)reader["WorkID"],
                    CompanyName = (string)reader["CompanyName"],
                    Position = (string)reader["Position"],
                    FromYear = (string)reader["FromYear"],
                    FromMonth = (string)reader["FromMonth"],
                    ToYear = (string)reader["ToYear"],
                    ToMonth = (string)reader["ToMonth"],
                    ResumeID = (int)reader["ResumeID"],
                    Responsiblity = (string)reader["Responsiblity"],
                    IsOverSeas = (int)reader["IsOverSeas"]
                };
                works.Add(work);
                
            }
            reader.Close();
            return works;
        }
        public bool DeliveryResumeToJob(string userId,string collegeId,string jobName)
        {
            string sql = "insert into DeliveryTable values(@UserId,@CollegesId,@JobsName,@DeliveryTime,@TrialSocre);";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterFactory.Create("@UserId",DbType.String,userId),
                parameterFactory.Create("@CollegesId",DbType.String,collegeId),
                parameterFactory.Create("@JobsName",DbType.String,jobName),
                parameterFactory.Create("@DeliveryTime",DbType.DateTime,DateTime.Now),
                parameterFactory.Create("@TrialSocre",DbType.Double,null)
            };
            return dataBase.ExecuteNonQuery(sql, parameters) >0;
        }
        public bool CancelDelivery(string userId, string collegeId, string jobName)
        {
            string sql = "delete from DeleveryTable where UserId=@UserId,CollegesId=@CollegesId,JobsName=@JobsName;";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterFactory.Create("@UserId",DbType.String,userId),
                parameterFactory.Create("@CollegesId",DbType.String,collegeId),
                parameterFactory.Create("@JobsName",DbType.String,jobName),
            };
            return dataBase.ExecuteNonQuery(sql, parameters) > 0;
        }
        public bool CancelAllDelivery(string userId)
        {
            string sql = "delete from DeleveryTable where UserId=@UserId;";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterFactory.Create("@UserId",DbType.String,userId)
            };
            return dataBase.ExecuteNonQuery(sql, parameters) > 0;
        }
        public Jobs BreowseJob(string collegeId,string jobName)
        {
            string sql = "select * from Jobs where CollegesId=@CollegesId and JobsName=@JobsName;";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterFactory.Create("@CollegesId",DbType.String,collegeId),
                parameterFactory.Create("@JobsName",DbType.String,jobName),
            };
            DataTable table = dataBase.ExecuteDataTable(sql,parameters);
            if(table!=null&&table.Rows.Count>0)
            {
                Jobs job = new Jobs
                {
                    CollegesId = (string)table.Rows[0]["CollegesId"],
                    Contact = (string)table.Rows[0]["Contact"],
                    JobsName = (string)table.Rows[0]["JobsName"],
                    ReleaseTime = (DateTime)table.Rows[0]["ReleaseTime"],
                    EndTime = (DateTime)table.Rows[0]["EndTime"],
                    PayRangeLow = (double)table.Rows[0]["PayRangeLow"],
                    PayRangeHigh = (double)table.Rows[0]["PayRangeHigh"],
                    TrialLectureTime = (DateTime)table.Rows[0]["TrialLectureTime"],
                    TrialInfo = (string)table.Rows[0]["TrialInfo"],
                    Introduction = (string)table.Rows[0]["Introduction"],
                    College = collegesManager.GetCollegeInfo((string)table.Rows[0]["collegesId"]),
                    DeliveryTables = null
                };
                return job;
            }
            return null;
        }
        public DataTable BreowseJobTable(string collegeId, string jobName)
        {
            string sql = "select * from Jobs where CollegesId=@CollegesId and JobsName=@JobsName;";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterFactory.Create("@CollegesId",DbType.String,collegeId),
                parameterFactory.Create("@JobsName",DbType.String,jobName),
            };
            return dataBase.ExecuteDataTable(sql, parameters);
        }
        public DataSet BreowseJobSet(string collegeId, string jobName)
        {
            string sql = "select * from Jobs where CollegesId=@CollegesId and JobsName=@JobsName;";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterFactory.Create("@CollegesId",DbType.String,collegeId),
                parameterFactory.Create("@JobsName",DbType.String,jobName),
            };
            return dataBase.ExecuteDataSet(sql, parameters);
        }
        public bool IsDeliveriedJob(string userId, string collegeId, string jobName)
        {
            string sql = "select count(*) from DeliveryTable where UserId=@UserId and CollegesId=@CollegesId and JobsName=@JobsName;";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterFactory.Create("@UserId",DbType.String,userId),
                parameterFactory.Create("@CollegesId",DbType.String,collegeId),
                parameterFactory.Create("@JobsName",DbType.String,jobName),
            };
            return (int)dataBase.ExecuteScalar(sql, parameters) > 0;
        }
        public bool CancelDeliveriedJob(string userId, string collegeId, string jobName)
        {
            string sql = "delete from DeliveryTable where UserId=@UserId and CollegesId=@CollegesId and JobsName=@JobsName;";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterFactory.Create("@UserId",DbType.String,userId),
                parameterFactory.Create("@CollegesId",DbType.String,collegeId),
                parameterFactory.Create("@JobsName",DbType.String,jobName),
            };
            return dataBase.ExecuteNonQuery(sql, parameters) > 0;
        }
    }
}
