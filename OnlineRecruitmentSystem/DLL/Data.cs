using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using MySql;
namespace OnlineRecruitmentSystem
{
    public class DataOpertion
    {
        private string ConnectStr { get; set; }
        public  DataOpertion(string str)
        {
            this.ConnectStr = str;
        }

        // = ConfigurationManager.ConnectionStrings["sqlConnectionL"].ToString();
        private SqlConnection Connect()
        {
            SqlConnection con = new SqlConnection(ConnectStr);
            con.Open();
            return con;
        }
        private SqlCommand Command(ref string sql, params SqlParameter[] parameter)
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand com = new SqlCommand(sql, this.Connect());
            com.Parameters.AddRange(parameter);
            return com;
        }
        /// <summary>
        /// 查看修改行数
        /// </summary>
        /// <param name="sql">sql</param>
        /// <returns></returns>
        public virtual int Execute(ref string sql, params SqlParameter[] parameter)
        {
            return this.Command(ref sql,parameter).ExecuteNonQuery();
        }
        /// <summary>
        /// 获取数据集
        /// </summary>
        /// <param name="sql">sql</param>
        /// <returns></returns>
        
        
        public virtual SqlDataReader Read(ref string sql, params SqlParameter[] parameter)
        {
            return this.Command(ref sql,parameter).ExecuteReader();
        }
        /// <summary>
        /// 数据库查询
        /// </summary>
        /// <param name="sqlStr"></param>
        /// <param name="parameter">参数</param>
        /// <returns></returns>
        public DataTable Select(string sqlStr, params SqlParameter[] parameter)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectStr))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sqlStr, conn);
                    DataTable dt = new DataTable();
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    cmd.Parameters.AddRange(parameter);
                    adapter.SelectCommand = cmd;
                    adapter.Fill(dt);
                    //adapter.GetFillParameters();
                    conn.Close();
                    return dt;
                }
            }
            catch (Exception ex)
            {
                throw new ApplicationException("查询数据异常" + ex.Message);
            }
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="sqlStr"></param>
        /// <param name="parameter"></param>
        /// <returns></returns>
        public bool UpdateData(string sqlStr, params SqlParameter[] parameter)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection())
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sqlStr, conn);
                    cmd.Parameters.AddRange(parameter);
                    var row = cmd.ExecuteNonQuery();
                    conn.Close();
                    if (row > 0)
                    {
                        return true;
                    }
                    return false;
                }
            }
            catch (Exception ex)
            {
                throw new ApplicationException("更新数据异常" + ex.Message);
            }
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="sqlStr"></param>
        /// <param name="parameter"></param>
        /// <returns></returns>
        public static bool DeleteData(string sqlStr, params SqlParameter[] parameter)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection())
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sqlStr, conn);
                    cmd.Parameters.AddRange(parameter);
                    var row = cmd.ExecuteNonQuery();
                    conn.Close();
                    if (row > 0)
                    {
                        return true;
                    }
                    return false;
                }
            }
            catch (Exception ex)
            {
                throw new ApplicationException("删除数据异常" + ex.Message);
            }
        }
        
    }
    public class Recruitment
    {
        private int _id;
        private string _name;
        private string _sex;
        private string _address;
        private string _phoneNumber;
        private string _email;
        private ArraySegment<Skill> _skill;
        private ArraySegment<Intension> _intension;
        private ArraySegment<EduBackground> _eduBackground;


        /// <summary>
        /// 简历编号
        /// </summary>
        public int Id { get => _id; set => _id = value; }
        /// <summary>
        /// 姓名
        /// </summary>
        public string Name { get => _name; set => _name = value; }
        /// <summary>
        /// 性别
        /// </summary>
        public string Sex { get => _sex; set => _sex = value; }
        /// <summary>
        /// 地址
        /// </summary>
        public string Address { get => _address; set => _address = value; }
        /// <summary>
        /// 电话号码
        /// </summary>
        public string PhoneNumber { get => _phoneNumber; set => _phoneNumber = value; }
        /// <summary>
        /// 邮箱
        /// </summary>
        public string Email { get => _email; set => _email = value; }
        /// <summary>
        /// 技能
        /// </summary>
        public ArraySegment<Skill> Skill { get => _skill; set => _skill = value; }
        /// <summary>
        /// 求职意向
        /// </summary>
        public ArraySegment<Intension> Intension { get => _intension; set => _intension = value; }
        /// <summary>
        /// 教育背景
        /// </summary>
        public ArraySegment<EduBackground> EduBackground { get => _eduBackground; set => _eduBackground = value; }

        public override bool Equals(object obj)
        {
            var recruitment = obj as Recruitment;
            return recruitment != null &&
                   _id == recruitment._id &&
                   _name == recruitment._name &&
                   _sex == recruitment._sex &&
                   _address == recruitment._address &&
                   _phoneNumber == recruitment._phoneNumber &&
                   _email == recruitment._email &&
                   EqualityComparer<ArraySegment<Skill>>.Default.Equals(_skill, recruitment._skill) &&
                   EqualityComparer<ArraySegment<Intension>>.Default.Equals(_intension, recruitment._intension) &&
                   EqualityComparer<ArraySegment<EduBackground>>.Default.Equals(_eduBackground, recruitment._eduBackground) &&
                   Id == recruitment.Id &&
                   Name == recruitment.Name &&
                   Sex == recruitment.Sex &&
                   Address == recruitment.Address &&
                   PhoneNumber == recruitment.PhoneNumber &&
                   Email == recruitment.Email &&
                   EqualityComparer<ArraySegment<Skill>>.Default.Equals(Skill, recruitment.Skill) &&
                   EqualityComparer<ArraySegment<Intension>>.Default.Equals(Intension, recruitment.Intension) &&
                   EqualityComparer<ArraySegment<EduBackground>>.Default.Equals(EduBackground, recruitment.EduBackground);
        }

        public override int GetHashCode()
        {
            var hashCode = -367373111;
            hashCode = hashCode * -1521134295 + _id.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(_name);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(_sex);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(_address);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(_phoneNumber);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(_email);
            hashCode = hashCode * -1521134295 + EqualityComparer<ArraySegment<Skill>>.Default.GetHashCode(_skill);
            hashCode = hashCode * -1521134295 + EqualityComparer<ArraySegment<Intension>>.Default.GetHashCode(_intension);
            hashCode = hashCode * -1521134295 + EqualityComparer<ArraySegment<EduBackground>>.Default.GetHashCode(_eduBackground);
            hashCode = hashCode * -1521134295 + Id.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Name);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Sex);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Address);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(PhoneNumber);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Email);
            hashCode = hashCode * -1521134295 + EqualityComparer<ArraySegment<Skill>>.Default.GetHashCode(Skill);
            hashCode = hashCode * -1521134295 + EqualityComparer<ArraySegment<Intension>>.Default.GetHashCode(Intension);
            hashCode = hashCode * -1521134295 + EqualityComparer<ArraySegment<EduBackground>>.Default.GetHashCode(EduBackground);
            return hashCode;
        }
    }
    public class Skill
    {

        public enum DegreeOfProdiciency
        {
            Proficient,//精通
            Proficiency,//熟练
            Well,//良好
            General//一般
        }
        public Dictionary<string,DegreeOfProdiciency> SkillList { get; set; }

        public override bool Equals(object obj)
        {
            var skill = obj as Skill;
            return skill != null &&
                   EqualityComparer<Dictionary<string, DegreeOfProdiciency>>.Default.Equals(SkillList, skill.SkillList);
        }

        public override int GetHashCode()
        {
            return 1085229522 + EqualityComparer<Dictionary<string, DegreeOfProdiciency>>.Default.GetHashCode(SkillList);
        }
    }
    public class Intension
    {
        private int _lowSalary;
        private string _address;
        private string _position;
        private int _highSalary;
        private TypeOfWork _workType;

        public enum TypeOfWork
        {
            Practice,
            Regular
        }
        /// <summary>
        /// 职位
        /// </summary>
        public string Position { get => _position; set => _position = value; }
        /// <summary>
        /// 地址
        /// </summary>
        public string Address { get => _address; set => _address = value; }
        /// <summary>
        /// 最低工资
        /// </summary>
        public int LowSalary { get => _lowSalary; set => _lowSalary = value; }
        /// <summary>
        /// 最高工资
        /// </summary>
        public int HighSalary { get => _highSalary; set => _highSalary = value; }
        /// <summary>
        /// 工作类型
        /// </summary>
        public TypeOfWork WorkType { get => _workType; set => _workType = value; }

        public override bool Equals(object obj)
        {
            var intension = obj as Intension;
            return intension != null &&
                   _lowSalary == intension._lowSalary &&
                   _address == intension._address &&
                   _position == intension._position &&
                   _highSalary == intension._highSalary &&
                   _workType == intension._workType &&
                   Position == intension.Position &&
                   Address == intension.Address &&
                   LowSalary == intension.LowSalary &&
                   HighSalary == intension.HighSalary &&
                   WorkType == intension.WorkType;
        }

        public override int GetHashCode()
        {
            var hashCode = -1918347377;
            hashCode = hashCode * -1521134295 + _lowSalary.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(_address);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(_position);
            hashCode = hashCode * -1521134295 + _highSalary.GetHashCode();
            hashCode = hashCode * -1521134295 + _workType.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Position);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Address);
            hashCode = hashCode * -1521134295 + LowSalary.GetHashCode();
            hashCode = hashCode * -1521134295 + HighSalary.GetHashCode();
            hashCode = hashCode * -1521134295 + WorkType.GetHashCode();
            return hashCode;
        }
    }
    public class EduBackground
    {
        private string _speciality;
        private DateTime _startDate;
        private DateTime _endDate;
        private string _schoolName;

        /// <summary>
        /// 开始日期
        /// </summary>
        public DateTime StartDate { get => _startDate; set => _startDate = value; }
        /// <summary>
        /// 结束日期
        /// </summary>
        public DateTime EndDate { get => _endDate; set => _endDate = value; }
        /// <summary>
        /// 学校名称
        /// </summary>
        public string SchoolName { get => _schoolName; set => _schoolName = value; }
        /// <summary>
        /// 专业
        /// </summary>
        public string Speciality { get => _speciality; set => _speciality = value; }
    }
}