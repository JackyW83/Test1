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
    public partial class Query
    {
        public Query()
        {
            this.QueryClauses = new HashSet<QueryClause>();
        }
    
        public System.Guid Id { get; set; }
        public System.Guid UserId { get; set; }
        public System.Guid ProjectId { get; set; }
        public string QueryName { get; set; }
        public bool IsPublic { get; set; }
    
        public virtual Project Project { get; set; }
        public virtual ICollection<QueryClause> QueryClauses { get; set; }
    }
    
}
