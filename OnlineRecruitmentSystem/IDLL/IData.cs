using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using MySql;
using System.Data;
using System.Data.SqlClient;

namespace OnlineRecruitmentSystem
{
    interface IData
    {
        //private const string ConnectStr = ConfigurationManager.ConnectionStrings["sqlConnectionL"].ToString();
        string ConnectStr { get; set; }
        void Select();
        void Delect();
        void Insert();
        void Alter();
    }
}
