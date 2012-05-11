//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

namespace BugNET.Entities.DataContext
{
    public partial class ProjectCategory
    {
        public ProjectCategory()
        {
            this.Issues = new HashSet<Issue>();
            this.Children = new HashSet<ProjectCategory>();
        }
    
        public System.Guid Id { get; set; }
        public string Name { get; set; }
        public System.Guid ProjectId { get; set; }
        public Nullable<System.Guid> ParentCategoryId { get; set; }
        public bool Disabled { get; set; }
    
        public virtual ICollection<Issue> Issues { get; set; }
        public virtual ICollection<ProjectCategory> Children { get; set; }
        public virtual ProjectCategory Parent { get; set; }
        public virtual Project Project { get; set; }
    }
    
}