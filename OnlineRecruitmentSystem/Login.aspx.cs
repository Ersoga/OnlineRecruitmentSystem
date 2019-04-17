using OnlineRecuitmentSystemBLL;
using OnlineRecuitmentSystemIBLL;
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
        //DataOpertion UsersData = new DataOpertion(ConfigurationManager.ConnectionStrings["sqlConnectionL"].ToString());
        AUser user = null;
        UserManager userManager = new UserManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            string type = Request.QueryString["type"].ToString();
            if(type == "user")
            {
                Session["type"] = 
            }
            if(Session["User"] ==null)
            {
                Session["User"] = user;
            }
        }

        protected void Page_Init(object sender,EventArgs e)
        {

        }
        protected void UserLogin_Authenticate(object sender, AuthenticateEventArgs e)
        {
            Models.UserTable user = new Models.UserTable();
            user.PhoneNumber = this.UserLogin.UserName;
            user.Password = this.UserLogin.Password;
            string result = userManager.Login(user);
            //string strSql = "select * from UserTable where UserName=@UserName and Password=@Password";
            //if(this.UsersData.Read(ref strSql, new SqlParameter[] { new SqlParameter("@UserName", UserLogin.UserName), new SqlParameter("@Password", UserLogin.Password) }).HasRows)
            if (result !=null)
            {
                if(result=="该用户不存在")
                {
                    Response.Write("<script>alert('该用户不存在');</script>");
                    e.Authenticated = false;
                }
                else
                {
                    e.Authenticated = true;//通过验证 
                    Session["User"] = result;
                    Session["Id"] = this.UserLogin.UserName;
                    //Response.Redirect("/HomePage.aspx?User=" +Server.UrlEncode(result));
                }
                // e.Authenticated = true;//通过验证 
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script><location.herf='/HomePage.aspx';</script>");
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