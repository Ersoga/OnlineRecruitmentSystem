//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class JobIntension
    {
        public int JobIntensionId { get; set; }
        public Nullable<int> JobTerm { get; set; }
        public string JobArea { get; set; }
        public string IndustryType { get; set; }
        public string FunType { get; set; }
        public Nullable<int> Salary { get; set; }
        public Nullable<int> EntryTime { get; set; }
        public Nullable<int> ResumeID { get; set; }
    
        public virtual Resume Resume { get; set; }
    }
}