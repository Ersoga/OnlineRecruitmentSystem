﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineRecuitmentSystemIDAL;
using OnlineRecuitmentSystemDAL;
using OnlineRecuitmentSystemIBLL;
using Models;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;

namespace OnlineRecuitmentSystemBLL
{
    public class CollagesManager:ICollegesManager
    {
        IDataBase collegesDb = new SqlServer();
        ParameterFactory parameterFactory = new OnlineRecuitmentSystemDAL.ParameterFactory();

        public bool DeleteCollege(string key)
        {
            string sql = "delete from Colleges where CollegesID = @CollegesId;";
            return collegesDb.ExecuteNonQuery(sql, parameterFactory.Create("@CollegesId", DbType.String, key)) != 0;
        }

        public College GetCollegeInfo(string key)
        {
            DataRow row = this.GetCollegeRow(key);
            College college = null;
            if(row!=null)
            {
                college = new College();
                college.CollegesId = (string)row["CollegesId"];
                college.CollegesName = (string)row["CollegesName"];
                college.Contact = (string)row["Contact"];
                college.IsVerification = (bool)row["IsVerification"];
                college.RegisterTime = (DateTime)row["RegisterTime"];
                college.CityId = (int)row["CityId"];
                return college;
            }
            return college;
        }
        
        public DataRow GetCollegeRow(string key)
        {
            string sql = "select * from Colleges where CollegesId = @CollegesId;";
            DataTable table = collegesDb.ExecuteDataTable(sql, parameterFactory.Create("CollegesId", DbType.String, key));
            if(table!=null)
            {
                return table.Rows[0];
            }
            return null;

        }

        public bool Register(College college)
        {
            string sql = "insert into Colleges value(@CollegeId,@CollegesName,@Contact,@IsVerification,@RegisterTime,CityId);";
            DbParameter[] parameters = new DbParameter[]
            {
                parameterFactory.Create("@CollegeId",DbType.String,college.CollegesId),
                parameterFactory.Create("@CollegesName",DbType.String,college.CollegesName),
                parameterFactory.Create("@Contact",DbType.String,college.Contact),
                parameterFactory.Create("@IsVerification",DbType.Binary,college.IsVerification),
                parameterFactory.Create("@RegisterTime",DbType.DateTime,college.RegisterTime),
                parameterFactory.Create("@CityId",DbType.Int32,college.CityId)
            };
            return collegesDb.ExecuteNonQuery(sql, parameters) == 1;
        }


        public bool ValidationUser(string key)
        {
            string sql = "select * from Colleges where CollegesId = @CollegesId;";
            return collegesDb.ExecuteNonQuery(sql, parameterFactory.Create("CollegesId", DbType.String, key))>0;
        }

    }
}
