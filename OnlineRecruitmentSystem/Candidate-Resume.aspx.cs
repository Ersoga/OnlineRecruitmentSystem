using Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRecruitmentSystem
{
    public partial class Candidate_Resume : System.Web.UI.Page
    {
        Resume CurrentResume;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["UserInfo"] == null)
            {
                Response.Redirect("index.aspx");
            }
            List<Models.Resume> resumes = new OnlineRecuitmentSystemBLL.User().GetResumes(((Models.UserTable)Session["UserInfo"]).PhoneNumber);
            if (resumes != null)
            {
                this.CVId.DataSource = resumes;
                this.CVId.DataTextField = "ResumeID";
                this.CVId.DataValueField = "ResumeID";
                this.CVId.DataBind();
                CurrentResume = resumes[0];
                this.Education_List.DataSource = resumes[0].EducationBackgrounds;
                this.Education_List.DataBind();
                Models.Resume resume = resumes.Find(x => { return x.ResumeID.ToString() == this.CVId.SelectedValue; });
                this.ResumeList.DataSource = new List<Resume>() { resume };
                this.ResumeList.DataBind();
            }
        }

        protected void CVId_Init(object sender, EventArgs e)
        {
            //DataTable data =new OnlineRecuitmentSystemBLL.User().
            //this.CVId.DataSource = 
        }

        protected void ResumeList_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            DropDownList PlaceType3 = e.Item.FindControl("PlaceType1") as DropDownList;
            DataTable table = Common.Tool.GetCityById((int)CurrentResume.CityId);
            DataColumn[] keys = new DataColumn[1];
            keys[0] = table.Columns[0];
            table.PrimaryKey = keys;
            int pid = (int)table.Rows[0]["Pid"];
            PlaceType3.DataSource = Common.Tool.GetCity(pid);
            PlaceType3.DataTextField = "CityName";
            PlaceType3.DataValueField = "Id";
            PlaceType3.DataBind();
            PlaceType3.Items.FindByValue(CurrentResume.CityId.ToString()).Selected = true;

            DropDownList PlaceType2 = e.Item.FindControl("PlaceType2") as DropDownList;
            DataTable table1 = Common.Tool.GetCityById(pid);
            DataColumn[] keys1 = new DataColumn[1];
            keys1[0] = table1.Columns[0];
            table1.PrimaryKey = keys1;
            int pid2 = (int)table1.Rows[0]["Pid"];
            PlaceType2.DataSource = Common.Tool.GetCity(pid2); ;
            PlaceType2.DataTextField = "CityName";
            PlaceType2.DataValueField = "Id";
            PlaceType2.DataBind();
            PlaceType2.Items.FindByValue(((int)table1.Rows[0]["Id"]).ToString()).Selected = true;

            DropDownList PlaceType1 = e.Item.FindControl("PlaceType1") as DropDownList;
            DataTable table2 = Common.Tool.GetCityById(pid2);
            DataColumn[] keys2 = new DataColumn[1];
            keys2[0] = table2.Columns[0];
            table2.PrimaryKey = keys2;
            PlaceType1.DataSource = Common.Tool.GetCity((int)table2.Rows[0]["Pid"]);
            PlaceType1.DataTextField = "CityName";
            PlaceType1.DataValueField = "Id";
            PlaceType1.DataBind();
            PlaceType1.Items.FindByValue(((int)table2.Rows[0]["Id"]).ToString()).Selected = true;


        }

        protected void CVId_SelectedIndexChanged(object sender, EventArgs e)
        {
            CurrentResume = new OnlineRecuitmentSystemBLL.User().GetResumes(((Models.UserTable)Session["UserInfo"]).PhoneNumber).Find(x=> {return x.ResumeID.ToString() == ((DropDownList)sender).SelectedValue; });
        }

        protected void Education_List_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            
        }

        // id 参数名应该与控件上设置的 DataKeyNames 值匹配
        public void Education_List_DeleteItem(int id)
        {
            this.Education_List.Items.RemoveAt(id);
            Response.Write("<script>alter('" + id.ToString() + "');</script>");
        }
    }
}