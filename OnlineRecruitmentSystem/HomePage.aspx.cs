using OnlineRecuitmentSystemBLL;
using OnlineRecuitmentSystemIBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRecruitmentSystem
{
    public partial class HoemPage : System.Web.UI.Page
    {
        AUser user = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                user = new RegistedUser();

            }
            else
            {
                user = new UnRegistedUser();
                List<Models.Job> jobs = null;
                if (job_SearchMethod.SelectedValue == "0")
                {
                    jobs = user.BrowseJobsInfo(10);
                }
                for (int i = 0; i < jobs.Count / 3; i++)
                {
                    TableRow row = new TableRow();
                    for (int j = 0; j < 3; j++)
                    {
                        TableCell cell = new TableCell();
                        LinkButton JobsName = new LinkButton();
                        JobsName.CssClass = "h1";
                        JobsName.Text = jobs[i * 3 + j].JobsName;
                        LinkButton CollegeName = new LinkButton();
                        CollegeName.Text = jobs[i * 3 + j].College.CollegesName;
                        cell.Controls.Add(JobsName);
                        cell.Controls.Add(CollegeName);
                        row.Cells.Add(cell);
                    }
                    job_InfoTable.Rows.Add(row);
                }
            }
                //Button button = new Button();
                //button.Text = string.Format("{0}", Session["User"]);
                //TableCell cell = new TableCell();
                //cell.Controls.Add(button);
                //TableRow row = new TableRow();
                //row.Cells.Add(cell);
                //this.Table1.Rows.Add(row);
                
        }

        protected void job_Search_Click(object sender, EventArgs e)
        {
            List<Models.Job> jobs = null;
            if (job_SearchMethod.SelectedValue == "0")
            {
                jobs = user.SelectJobsInfoByCity(this.job_SerachString.Text);
            }
            for(int i = 0;i<jobs.Count/3;i++)
            {
                TableRow row = new TableRow();
                for (int j = 0; j < 3; j++)
                {
                    TableCell cell = new TableCell();
                    LinkButton JobsName = new LinkButton();
                    JobsName.CssClass = "h1";
                    JobsName.Text = jobs[i*3+j].JobsName;
                    LinkButton CollegeName = new LinkButton();
                    CollegeName.Text = jobs[i * 3 + j].College.CollegesName;
                    cell.Controls.Add(JobsName);
                    cell.Controls.Add(CollegeName);
                    row.Cells.Add(cell);
                }
                job_InfoTable.Rows.Add(row);
            }
        }
    }
}