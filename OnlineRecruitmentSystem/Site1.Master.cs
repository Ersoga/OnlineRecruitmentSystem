using OnlineRecuitmentSystemBLL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRecruitmentSystem
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["UserInfo"] == null)
            {
                //login.Style["display"] = "block";
                //userInfo.Style["display"] = "none";
                login.Attributes.Remove("hidden");
                userInfo.Attributes["hidden"] = "hidden";
            }
            else
            {
                Models.UserTable user = (Models.UserTable)Session["UserInfo"];
                login.Attributes["hidden"] = "hidden";
                userInfo.Attributes.Remove("hidden");
                userName.InnerText = user.UserName;
                if (File.Exists("images/头像/" + user.PhoneNumber + ".jpg"))
                {
                    photo.ImageUrl = "images/头像/" + user.PhoneNumber + ".jpg";
                }
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            User user = new User();
            if(user.Login(this.LoginPhoneNumber.Text,this.LoginPwd.Text))
            {
                Session["UserInfo"] = user.UserInfo;
            }
            else
            {
                Response.Write("alter('登陆失败');");
            }
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            if (this.RegisterPwd.Text == this.RegisterPwdRe.Text)
            {
                Models.UserTable user = new Models.UserTable();
                user.PhoneNumber = this.RegisterPhone.Text;
                user.Password = this.RegisterPwd.Text;
                user.UserName = this.RegisterName.Text;
                user.RegistrationTime = DateTime.Now;
                user.Type = "普通用户";
                User userManager = new User();
                if (userManager.UserManager.ValidationUser(user.PhoneNumber))
                {
                    Response.Write("<script>alert('已存在该用户,请登录');</script>");
                    Response.Redirect("/Index.aspx");
                }
                else
                {
                    if (userManager.Register(user))
                    {
                        Response.Write("<script>alert('注册成功');</script>");
                        Response.Redirect("/Index.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('注册失败');</script>");
                        //Response.Redirect("/Login.aspx");
                    }
                }

            }
            else
            {
                Response.Write("<script>alert('两次密码不相同')</script>");
            }
        }
    }
}