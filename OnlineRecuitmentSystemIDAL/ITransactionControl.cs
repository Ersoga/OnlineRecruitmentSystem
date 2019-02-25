using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineRecuitmentSystemIDAL
{
    public interface ITransactionControl
    {
        /// <summary>
        /// 开始
        /// </summary>
        void StartTransaction();
        /// <summary>
        /// 提交
        /// </summary>
        void CommitTransaction();
        /// <summary>
        /// 回滚
        /// </summary>
        void RollBackTransaction();
    }
}
