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
    
    public partial class SchoolRegister : System.Web.UI.Page
    {
        ICollegesManager schoolManager = new CollagesManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Regist_Click(object sender, EventArgs e)
        {
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.DropDownList2.DataSource = SqlDataSource2;
            Page.EnableDynamicData(typeof(string));
            //Response.Redirect(Request.Url.ToString());
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            DropDownList2.Items.Clear();
        }
    }
}