using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OnlineRecruitmentSystem
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string Users = Server.UrlDecode(Request.QueryString["User"]);
            //Session["User"].ToString();
            if ((string)Session["User"] != null)
            {
                this.UserLogin.Text = (string)Session["User"];
                this.UserLogin.PostBackUrl = "~/PersonalCenter.aspx";
                this.SchoolLogin.Text = "注销";
                this.SchoolLogin.ID = "Logout";
                this.SchoolLogin.Style["herf"] = "~/Login.aspx?";
                this.SchoolLogin.Click += Logout_Click;
            }
            else
            {
                this.UserLogin.Text = "用户登陆";
                this.SchoolLogin.Text = "高校登陆";
                this.UserLogin.PostBackUrl = "~/Login.aspx?type=User";
                this.UserLogin.Click += UserLogin_Click;
                this.SchoolLogin.PostBackUrl = "~/Login.aspx?type=School";
                this.SchoolLogin.Click += SchoolLogin_Click;
                //this.Register.Click += Logout_Click;
            }

        }
        protected void UserLogin_Click(object sender, EventArgs e)
        {
            Session["type"] = "User";
        }
        protected void SchoolLogin_Click(object sender, EventArgs e)
        {
            Session["type"] = "School";
        }
        protected void Logout_Click(object sender,EventArgs e)
        {
            string returnType = (string)Session["type"];
            this.Session.Clear();
            Response.Redirect("~/Login.aspx"+"?type="+returnType);
        }
        protected void PersonalCenter(object sender,EventArgs e)
        {
            Response.Redirect("~/PersonalCenter.aspx");
        }
    }
}