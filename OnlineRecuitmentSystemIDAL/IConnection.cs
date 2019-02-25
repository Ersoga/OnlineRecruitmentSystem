using System.Data;


namespace OnlineRecuitmentSystemIDAL
{
    public interface IConnection
    {
        string ConnectionString { get; }

        IDbConnection DatabaseConnection { get; }

        bool InTransaction { get; set; }

        void Close();

        void Open();
    }
}
