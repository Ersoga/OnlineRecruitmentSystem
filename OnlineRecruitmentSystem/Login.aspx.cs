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
        User user = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                user = new User();
                Session["user"] = user;
            }
            else
            {
                user = (User)Session["user"];
            }
        }

        protected void Page_Init(object sender,EventArgs e)
        {

        }
        protected void UserLogin_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if (user.Login(this.UserLogin.UserName, this.UserLogin.Password))
            {
                user.LoginStatus = LoginInfo.LOGIN;
                e.Authenticated = true;
            }
            else
            {
                user.LoginStatus = LoginInfo.UN_LOGIN;
                e.Authenticated = false;
            }
        }

        protected void UserLogin_LoginError(object sender, EventArgs e)
        {
            Response.Write("Error");
        }
    }
}