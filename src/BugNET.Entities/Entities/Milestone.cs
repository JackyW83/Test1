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
    public partial class Milestone
    {
        public Milestone()
        {
            this.Issues = new HashSet<Issue>();
            this.AffectedIssues = new HashSet<Issue>();
        }
    
        public System.Guid Id { get; set; }
        public System.Guid ProjectId { get; set; }
        public string Name { get; set; }
        public string ImageUrl { get; set; }
        public int SortOrder { get; set; }
        public System.DateTime DateCreated { get; set; }
        public Nullable<System.DateTime> DueDate { get; set; }
        public Nullable<System.DateTime> ReleaseDate { get; set; }
        public string Notes { get; set; }
        public bool Completed { get; set; }
    
        public virtual ICollection<Issue> Issues { get; set; }
        public virtual ICollection<Issue> AffectedIssues { get; set; }
        public virtual Project Project { get; set; }
    }
    
}
