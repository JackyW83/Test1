﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

namespace BugNET.Entities.DataContext
{
    public partial class BugNetDomainDataContext : DbContext
    {
        public BugNetDomainDataContext()
            : base("name=BugNetDomainDataContext")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
           // throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<ApplicationLog> ApplicationLogs { get; set; }
        public DbSet<HostSetting> HostSettings { get; set; }
        public DbSet<IssueAttachment> IssueAttachments { get; set; }
        public DbSet<IssueComment> IssueComments { get; set; }
        public DbSet<IssueHistory> IssueHistories { get; set; }
        public DbSet<IssueNotification> IssueNotifications { get; set; }
        public DbSet<IssueRevision> IssueRevisions { get; set; }
        public DbSet<Issue> Issues { get; set; }
        public DbSet<IssueVote> IssueVotes { get; set; }
        public DbSet<IssueWorkReport> IssueWorkReports { get; set; }
        public DbSet<Language> Languages { get; set; }
        public DbSet<Permission> Permissions { get; set; }
        public DbSet<ProjectCategory> ProjectCategories { get; set; }
        public DbSet<CustomField> CustomFields1 { get; set; }
        public DbSet<CustomFieldSelection> CustomFieldSelections1 { get; set; }
        public DbSet<CustomFieldType> CustomFieldTypes { get; set; }
        public DbSet<CustomFieldValue> CustomFieldValues { get; set; }
        public DbSet<ProjectIssueField> ProjectIssueFields { get; set; }
        public DbSet<IssueType> IssueTypes { get; set; }
        public DbSet<ProjectMailBox> ProjectMailBoxes { get; set; }
        public DbSet<Milestone> Milestones { get; set; }
        public DbSet<ProjectNotification> ProjectNotifications { get; set; }
        public DbSet<Priority> Priorities { get; set; }
        public DbSet<Resolution> Resolutions { get; set; }
        public DbSet<Project> Projects { get; set; }
        public DbSet<Status> Statuses { get; set; }
        public DbSet<Query> Queries { get; set; }
        public DbSet<QueryClause> QueryClauses { get; set; }
        public DbSet<RelatedIssue> RelatedIssues { get; set; }
        public DbSet<RequiredField> RequiredFields { get; set; }
        public DbSet<Role> Roles1 { get; set; }
        public DbSet<UserProfile> UserProfiles { get; set; }
        public DbSet<UserProject> UserProjects { get; set; }
        public DbSet<UserRole> UserRoles { get; set; }
    }
}