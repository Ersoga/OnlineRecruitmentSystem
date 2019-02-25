using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineRecuitmentSystemIDAL;

namespace OnlineRecuitmentSystemDAL
{
    class Connection : IConnection
    {
        public string ConnectionString { get;private set; }

        public IDbConnection DatabaseConnection { get; private set; }

        public bool InTransaction { get; set; }

        public Connection(string connectionString)
        {
            this.ConnectionString = connectionString;
        }

        public void Close()
        {
            if(!InTransaction)
            {
                DatabaseConnection.Close();
                DatabaseConnection.Dispose();
            }
        }

        public void Open()
        {
            if(DatabaseConnection !=null&&DatabaseConnection.State!=ConnectionState.Open)
            {
                DatabaseConnection = new SqlConnection(this.ConnectionString);
                DatabaseConnection.Open();
            }
        }
    }
}
