using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRecruitmentSystem
{
    public partial class Login : System.Web.UI.Page
    {
        private const string V = "True";

        //const string str = "Data Source = (LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\14436\\source\\repos\\OnlineRecruitmentSystem\\OnlineRecruitmentSystem\\App_Data\\RecuitmentSystem.mdf;Integrated Security = True";
        //private SqlConnection con = new SqlConnection(strL);

        //public SqlConnection Con { get => con; set => con = value; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void m_Login_Click(object sender, EventArgs e)
        {
            //Con.Open();
            //string UserName = this.Page.User.ToString();
            //SqlCommand cmd = new SqlCommand("select * from UserTable where Name="+UserName.ToString()+";", Con);
            //object time = cmd.ExecuteScalar(); //或是 cmd.ExecuteReader();cmd.ExecuteNonQuery();
            //SqlDataReader read = new SqlDataReader(cmd);
            //read.Read();
            //或 Console.WriteLine(time.ToString());
            //Con.Close();
            if(MLogin(UserName.Text.ToString(), Password.Text.ToString()))
            {
                UserName.Text = V;
            }
           
        }
        private bool MLogin(string UserName,string Password)
        {
            var sqlStr = "select * from UserTable where UserName=@UserName and Password=@Password";
            DataTable table = DataOpertion.Select(sqlStr, new System.Data.SqlClient.SqlParameter[] { new System.Data.SqlClient.SqlParameter("@UserName", UserName), new System.Data.SqlClient.SqlParameter("@Password", Password) });
            if(table.Rows.Count.CompareTo(0)>0)
            {
                return true;
            }
            return false;
        }
    }
}