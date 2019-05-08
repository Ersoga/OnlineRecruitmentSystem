using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineRecuitmentSystemBLL;
using OnlineRecuitmentSystemIBLL;
using System.Data;

namespace OnlineRecruitmentSystem
{
    public partial class PersonalCenter : System.Web.UI.Page
    {
        //IUserManager user = new UserManager();
        //DataSet info = new DataSet();
        //DataTable userInfoTable = new DataTable();
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (Session["User"] == null)
        //        return;
        //    // this.FormView1.Controls.Add(new Button());
        //    this.Page.Title = (string)Session["User"] + "的个人中心";
        //    //info = user.GetInfo((string) Session["UserId"]);
        //    this.Name.Text = (string)Session["User"];
        //    if (info == null)
        //        return;
        //    userInfoTable = info.Tables[0];
        //    for (int i = 0; i < userInfoTable.Columns.Count-2; i++)
        //    {
        //        TableRow row = new TableRow();
        //        row.CssClass = "";
        //        row.Height = 100;
        //        for (int j = 0; j < 2; j++)
        //        {
        //            TableCell cell1 = new TableCell();
        //            cell1.CssClass = "";
        //            //cell1.
        //            Label label = new Label();
        //            TextBox text = new TextBox();
        //            string key = userInfoTable.Columns[(i + 1) * 2 + j].ColumnName;
        //            label.Text = key;
        //            text.Text = (string)userInfoTable.Rows[0][key];
        //            cell1.Controls.Add(label);
        //            cell1.Controls.Add(text);
        //            row.Cells.Add(cell1);
        //        }
        //        this.PersonalInfoTable.Rows.Add(row);
        //    }
        //}
    }
}