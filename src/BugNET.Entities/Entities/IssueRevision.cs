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
    public partial class IssueRevision
    {
        public System.Guid Id { get; set; }
        public int Revision { get; set; }
        public int IssueId { get; set; }
        public string Repository { get; set; }
        public string RevisionAuthor { get; set; }
        public string RevisionDate { get; set; }
        public string RevisionMessage { get; set; }
        public System.DateTime DateCreated { get; set; }
    }
    
}
