using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineRecruitmentSystem
{
    public partial class College : System.Web.UI.Page
    {
        College college = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["College"] == null)
                Response.Redirect("Login.aspx?type=school");
            college = (College)Session["College"];
        }
    }
}