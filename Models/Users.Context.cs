﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class RecuitmentSystemEntities : DbContext
    {
        public RecuitmentSystemEntities()
            : base("name=RecuitmentSystemEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<UserTable> UserTables { get; set; }
        public virtual DbSet<City> Cities { get; set; }
        public virtual DbSet<College> Colleges { get; set; }
        public virtual DbSet<DeliveryTable> DeliveryTables { get; set; }
        public virtual DbSet<Job> Jobs { get; set; }
    }
}
