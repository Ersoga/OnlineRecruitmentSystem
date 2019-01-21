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
        DataOpertion UsersData = new DataOpertion(ConfigurationManager.ConnectionStrings["sqlConnectionL"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Init(object sender,EventArgs e)
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
            if(MLogin(UserLogin.UserName, UserLogin.Password))
            {
                Response.Write(s: "Good");
                //UserName.Text = V;
            }
            //if(Login.UserName)
           
        }
        private bool MLogin(string UserName,string Password)
        {
            var sqlStr = "select * from UserTable where UserName=@UserName and Password=@Password";
            DataTable table = UsersData.Select(sqlStr, new System.Data.SqlClient.SqlParameter[] { new System.Data.SqlClient.SqlParameter("@UserName", UserName), new System.Data.SqlClient.SqlParameter("@Password", Password) });
            if(table.Rows.Count.CompareTo(0)>0)
            {
                return true;
            }
            return false;
        }

        protected void UserLogin_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string strSql = "select * from UserTable where UserName=@UserName and Password=@Password";
            if(this.UsersData.Read(ref strSql, new SqlParameter[] { new SqlParameter("@UserName", UserLogin.UserName), new SqlParameter("@Password", UserLogin.Password) }).HasRows)
            {
                e.Authenticated = true;//通过验证 
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script><location.herf='/HomePage.aspx';</script>");
            }
            else
            {
                e.Authenticated = false;
            }
        }

        protected void UserLogin_LoginError(object sender, EventArgs e)
        {
            Response.Write("Error");
        }
    }
}