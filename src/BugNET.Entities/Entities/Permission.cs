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
    public partial class Permission
    {
        public Permission()
        {
            this.Roles = new HashSet<Role>();
        }
    
        public System.Guid Id { get; set; }
        public string PermissionKey { get; set; }
        public string PermissionName { get; set; }
    
        public virtual ICollection<Role> Roles { get; set; }
    }
    
}
