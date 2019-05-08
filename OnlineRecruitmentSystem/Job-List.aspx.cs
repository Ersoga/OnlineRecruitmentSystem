using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRecruitmentSystem
{
    public partial class Job_List : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void JobsList_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            Label SchoolName = e.Item.FindControl("SchoolName") as Label;
            SchoolName.Text = ((Jobs)e.Item.DataItem).College.CollegesName;
            Label City = e.Item.FindControl("City") as Label;
            City.Text = ((Jobs)e.Item.DataItem).College.City.CityName;
            LinkButton Browse = e.Item.FindControl("Browse") as LinkButton;
            //Browse.OnClientClick = "OnBrowseClick";
            //Browse.Click += new EventHandler(this.OnBrowseClick);
            //Browse.PostBackUrl = '<%#"OrderWork.aspx?id="+Eval('OrderID') %>' >
              Browse.CommandArgument = "JobsName=" + Server.UrlEncode(((Jobs)e.Item.DataItem).JobsName) + "&CollegesId=" + Server.UrlEncode(((Jobs)e.Item.DataItem).CollegesId);
            //Browse.CommandArgument = "JobsName=" + HttpUtility.UrlEncode(System.Text.Encoding.UTF8.GetBytes(((Jobs)e.Item.DataItem).JobsName))+"&CollegesId=" + HttpUtility.UrlEncode(System.Text.Encoding.UTF8.GetBytes(((Jobs)e.Item.DataItem).CollegesId));
            Browse.PostBackUrl = "Job-Info.aspx?" + Browse.CommandArgument;
            //Browse.Command += new CommandEventHandler(this.OnBrowseClick);

        }
        public void OnBrowseClick(object sender, EventArgs e)
        {
            LinkButton linkButton = sender as LinkButton;
            Response.Redirect("Job-Info.aspx?" +linkButton.CommandArgument);
        }
    }
}