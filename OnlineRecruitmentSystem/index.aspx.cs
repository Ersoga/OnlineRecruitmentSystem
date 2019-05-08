using Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OnlineRecruitmentSystem
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Models.Jobs> jobs = new OnlineRecuitmentSystemBLL.User().BrowseJobsInfo(10);
            if (!Page.IsPostBack)
            {
                this.JobList.DataSource = jobs;
                this.JobList.DataBind();
            }
            //foreach (Models.Jobs item in jobs)
            //{
            //    Panel main = new Panel();
            //    main.CssClass = "col-sm-6 col-lg-12 fj_post home3";
            //    Panel panel = new Panel();
            //    panel.CssClass = "details";
            //    ///image
            //    Panel panel1 = new Panel();
            //    panel1.CssClass = "thumb fn-smd";
            //    Image image = new Image();
            //    image.CssClass = "img-fluid";
            //    image.ImageUrl = "images/partners/2.jpg";
            //    panel1.Controls.Add(image);
            //    panel.Controls.Add(panel1);

            //    HtmlGenericControl jobhead = new HtmlGenericControl("h3");
            //    jobhead.InnerText = item.JobsName;
            //    panel.Controls.Add(jobhead);
            //    HtmlGenericControl posted = new HtmlGenericControl("p");
            //    posted.InnerText = item.ReleaseTime.ToString();
            //    panel.Controls.Add(posted);
            //    //JobList.Controls.Add(panel);
            //    HtmlGenericControl brower = new HtmlGenericControl("a");
            //    //Button button = new Button();
            //    //button.CssClass = "btn btn-md btn-transparent2 float-right fn-smd";
            //    //button.Text = "查看";
            //    brower.Attributes.Add("class", "btn btn-md btn-transparent2 float-right fn-smd");
            //    brower.InnerText = "查看";
            //    HtmlGenericControl ul = new HtmlGenericControl("ul");
            //    ul.Attributes.Add("class", "featurej_post");

            //    HtmlGenericControl li = new HtmlGenericControl("li");
            //    li.Attributes.Add("class", "list-inline-item");
            //    HtmlGenericControl span = new HtmlGenericControl("span");
            //    span.Attributes.Add("class", "flaticon-location-pin");
            //    HtmlGenericControl li_a = new HtmlGenericControl("a")
            //    {
            //        InnerText = item.College.City.CityName
            //    };
            //    li.Controls.Add(span);
            //    li.Controls.Add(li_a);
            //    ul.Controls.Add(li);

            //    HtmlGenericControl li_1 = new HtmlGenericControl("li");
            //    li_1.Attributes.Add("class", "list-inline-item");
            //    HtmlGenericControl span_1 = new HtmlGenericControl("span");
            //    span_1.Attributes.Add("class", "flaticon-price pl20");
            //    HtmlGenericControl li_a_1 = new HtmlGenericControl("a");
            //    if (item.PayRangeLow == null || item.PayRangeHigh == null)
            //    {
            //        li_a_1.InnerText = "面议";
            //    }
            //    else
            //    {
            //        li_a_1.InnerText = "RMB " + item.PayRangeLow.ToString() + "-" + item.PayRangeHigh.ToString();
            //    }
            //    li_1.Controls.Add(span_1);
            //    li_1.Controls.Add(li_a_1);
            //    ul.Controls.Add(li_1);

            //    panel.Controls.Add(ul);
            //    main.Controls.Add(panel);
            //    main.Controls.Add(brower);
            //    JobList.Controls.Add(main);
            //}
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            Response.Redirect("Job-List.aspx?" + "key=" + Server.UrlEncode(Key.Text));
            //Response.Redirect("Job-List.aspx?" + "key=" + HttpUtility.UrlEncode(System.Text.Encoding.UTF8.GetBytes(this.Key.Text)));
        }

        protected void JobList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            //List<Models.Jobs> jobs = new List<Models.Jobs>();
            //jobs = new OnlineRecuitmentSystemBLL.User().BrowseJobsInfo(10);
            //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            //{
            //    DataList dataList = e.Item.FindControl("JobList1") as DataList;
            //    //DataRowView rowv = (DataRowView)e.Item.DataItem;

            //    //DataRow[] rows = Data().Tables[1].Select("sayId='" + rowv["id"].ToString() + "'");
            //    //DataTable dt = Data().Tables[1].Clone();
            //    //foreach (DataRow dr in rows)
            //    //{
            //    //    dt.ImportRow(dr);
            //    //}
            //    dataList.DataSource = jobs;
            //    dataList.DataBind();
            //}
        }

        protected void JobList_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            Label City = e.Item.FindControl("City") as Label;
            City.Text = ((Jobs)e.Item.DataItem).College.City.CityName;

            LinkButton Browse = e.Item.FindControl("Browse") as LinkButton;
            Browse.CommandArgument = "JobsName=" + Server.UrlEncode(((Jobs)e.Item.DataItem).JobsName) + "&CollegesId=" + Server.UrlEncode(((Jobs)e.Item.DataItem).CollegesId);
            //Browse.PostBackUrl = "Job-Info.aspx?" + Browse.CommandArgument;
            //Browse.Click += new EventHandler((x,y)=> { });
            Browse.CommandName = "ToInfo";
            Browse.Command += new CommandEventHandler((x, y) => {
                Response.Redirect("Job-Info.aspx?" + y.CommandArgument);
            });
        }

        protected void JobList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Response.Redirect("Job-Info.aspx?" + e.CommandArgument);
        }
    }
}