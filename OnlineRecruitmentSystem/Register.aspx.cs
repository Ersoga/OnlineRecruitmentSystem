using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineRecuitmentSystemIBLL;
using OnlineRecuitmentSystemBLL;
namespace OnlineRecruitmentSystem
{
    public partial class Register : System.Web.UI.Page
    {
        IUserManager userManager = new UserManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Regist_Click(object sender, EventArgs e)
        {
            if(this.Password.Text==this.RePassword.Text)
            {
                Models.UserTable user = new Models.UserTable();
                user.PhoneNumber = this.PhoneNumber.Text;
                user.Password = this.Password.Text;
                user.UserName = this.UserName.Text;
                user.RegistrationTime = DateTime.Now;
                user.Type = "普通用户";
                userManager.RegistUser(user);
            }
            else
            {
                Response.Write("<script>alter('两次密码不相同')</script>");
            }
        }
    }
}