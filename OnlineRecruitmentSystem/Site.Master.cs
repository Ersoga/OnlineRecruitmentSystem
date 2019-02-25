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
                this.LoginName.Text = (string)Session["User"];
                this.Register.InnerText = "注销";
                this.Register.HRef = "/Login.aspx";
                //this.LoginName.t
                //this.LoginName.Controls.Add(new HyperLink());
            }

        }
    }
}