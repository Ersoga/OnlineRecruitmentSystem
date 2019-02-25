using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineRecuitmentSystemIDAL;

namespace OnlineRecuitmentSystemDAL
{
    class TransactionControl : ITransactionControl
    {
        private readonly IConnection _connection;
        public IDbTransaction _transaction { get;private set; }
        public TransactionControl(IConnection connection)
        {
            this._connection = connection;
        }
        public void CommitTransaction()
        {
            if(this._transaction!=null)
            {
                this._transaction.Commit();
                this._transaction = null;
                this._connection.InTransaction = false;
            }
            //throw new NotImplementedException();
        }

        public void RollBackTransaction()
        {
            if (this._transaction != null)
            {
                this._transaction.Rollback();
                this._transaction = null;
                this._connection.InTransaction = false;
            }
            //throw new NotImplementedException();
        }

        public void StartTransaction()
        {
            _connection.Open();
            _transaction = _connection.DatabaseConnection.BeginTransaction();
            _connection.InTransaction = true;
            //throw new NotImplementedException();
        }
    }
}
