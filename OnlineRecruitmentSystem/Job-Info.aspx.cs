using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRecruitmentSystem
{
    public partial class Job_Info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //this.DataBind();
            //Response.Write("<script>alert('请登录后再试！')</script>");
        }

        protected void Header_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void JobInfo_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            Label City = e.Item.FindControl("City") as Label;
            City.Text = ((Jobs)e.Item.DataItem).College.City.CityName;

            LinkButton Apply = e.Item.FindControl("Apply") as LinkButton;
            if (Session["UserInfo"] != null)
            {
                UserTable user = (UserTable)Session["UserInfo"];
                Jobs job = e.Item.DataItem as Jobs;
                if(new OnlineRecuitmentSystemBLL.User().IsDeliveriedJob(user.PhoneNumber, job.CollegesId, job.JobsName))
                {
                    Apply.Text = "以投递";
                }
                else
                {
                    Apply.Text = "投递";
                }
                Apply.CommandArgument = user.PhoneNumber + ";" + job.CollegesId + ";" + job.JobsName;
            }
        }

        protected void JobInfo_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (Session["UserInfo"] != null)
            {
                UserTable user = (UserTable)Session["UserInfo"];
                string[] Argument = e.CommandArgument.ToString().Split(';');
                
                try
                {
                    if (new OnlineRecuitmentSystemBLL.User().IsDeliveriedJob(Argument[0], Argument[1], Argument[2]))
                    {
                        if (new OnlineRecuitmentSystemBLL.User().CancelDeliveriedJob(Argument[0], Argument[1], Argument[2]))
                        {
                            LinkButton Apply = e.Item.FindControl("Apply") as LinkButton;
                            Apply.Text = "投递";
                        }
                        else
                        {
                            Response.Write("<script>alert('取消失败')</script>");
                        }
                    }
                    else
                    {
                        if (new OnlineRecuitmentSystemBLL.User().DeliveryResumeToJob(Argument[0], Argument[1], Argument[2]))
                        {
                            LinkButton Apply = e.Item.FindControl("Apply") as LinkButton;
                            Apply.Text = "以投递";
                        }
                        else
                        {
                            Response.Write("<script>alert('投递失败')</script>");
                        }
                    }
                }
                catch(Exception ex)
                {
                    Response.Write("<script>alert('操作失败')</script>");
                }
                
            }
            else
            {
                Response.Write("<script>alert('请登录后再试！')</script>");
            }
            
        }
    }
}