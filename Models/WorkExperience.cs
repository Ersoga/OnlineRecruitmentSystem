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
    
    public partial class WorkExperience
    {
        public int WorkID { get; set; }
        public string FromYear { get; set; }
        public string FromMonth { get; set; }
        public string ToYear { get; set; }
        public string ToMonth { get; set; }
        public string CompanyName { get; set; }
        public string Position { get; set; }
        public string Responsiblity { get; set; }
        public Nullable<int> IsOverSeas { get; set; }
        public Nullable<int> ResumeID { get; set; }
    
        public virtual Resume Resume { get; set; }
    }
}
