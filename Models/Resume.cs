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
    
    public partial class Resume
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Resume()
        {
            this.EducationBackgrounds = new HashSet<EducationBackground>();
            this.JobIntensions = new HashSet<JobIntension>();
            this.WorkExperiences = new HashSet<WorkExperience>();
        }
    
        public int ResumeID { get; set; }
        public string Name { get; set; }
        public Nullable<int> Gender { get; set; }
        public string YearOfBirthday { get; set; }
        public string MonthOfBirthday { get; set; }
        public string DayOfBirthday { get; set; }
        public Nullable<int> CardType { get; set; }
        public string IDNumber { get; set; }
        public Nullable<int> Salary { get; set; }
        public Nullable<int> CurrencyType { get; set; }
        public string Mobile { get; set; }
        public string QQ { get; set; }
        public string Email { get; set; }
        public string PlaceOfDomicile { get; set; }
        public Nullable<int> CityId { get; set; }
        public string Address { get; set; }
        public Nullable<int> Stature { get; set; }
        public Nullable<int> Height { get; set; }
        public Nullable<int> Marrige { get; set; }
        public string HomePage { get; set; }
        public Nullable<int> StudentGroup { get; set; }
        public Nullable<int> WorkYear { get; set; }
        public string Introduction { get; set; }
        public Nullable<int> Weight { get; set; }
        public string UserId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EducationBackground> EducationBackgrounds { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<JobIntension> JobIntensions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WorkExperience> WorkExperiences { get; set; }
        public virtual UserTable UserTable { get; set; }
    }
}
