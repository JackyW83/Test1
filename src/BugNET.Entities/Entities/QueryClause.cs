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
    public partial class QueryClause
    {
        public System.Guid Id { get; set; }
        public System.Guid QueryId { get; set; }
        public string BooleanOperator { get; set; }
        public string FieldName { get; set; }
        public string ComparisonOperator { get; set; }
        public string FieldValue { get; set; }
        public int DataType { get; set; }
        public bool IsCustomField { get; set; }
    
        public virtual Query Queries { get; set; }
    }
    
}
