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
    public partial class Role
    {
        public Role()
        {
            this.UserRoles = new HashSet<UserRole>();
            this.Permissions = new HashSet<Permission>();
        }
    
        public System.Guid Id { get; set; }
        public System.Guid ProjectId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool AutoAssign { get; set; }
    
        public virtual Project Project { get; set; }
        public virtual ICollection<UserRole> UserRoles { get; set; }
        public virtual ICollection<Permission> Permissions { get; set; }
    }
    
}
