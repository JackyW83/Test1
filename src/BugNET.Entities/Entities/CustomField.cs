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
    public partial class CustomField
    {
        public CustomField()
        {
            this.CustomFieldSelections = new HashSet<CustomFieldSelection>();
            this.CustomFieldValues = new HashSet<CustomFieldValue>();
        }
    
        public Guid Id { get; set; }
        public Guid ProjectId { get; set; }
        public string Name { get; set; }
        public bool Required { get; set; }
        public int DataType { get; set; }
        public Guid CustomFieldTypeId { get; set; }
    
        public virtual CustomFieldType CustomFieldType { get; set; }
        public virtual Project Project { get; set; }
        public virtual ICollection<CustomFieldSelection> CustomFieldSelections { get; set; }
        public virtual ICollection<CustomFieldValue> CustomFieldValues { get; set; }
    }
    
}
