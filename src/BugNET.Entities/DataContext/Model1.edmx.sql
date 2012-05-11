
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 05/11/2012 17:35:52
-- Generated from EDMX file: D:\Development\Test\src\BugNET.Entities\DataContext\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BugNET.Entities.DataContext.BugNetDataContext];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BugNet_Issues_BugNet_ProjectCategories1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_Issues] DROP CONSTRAINT [FK_BugNet_Issues_BugNet_ProjectCategories1];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_Issues_BugNet_ProjectIssueTypes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_Issues] DROP CONSTRAINT [FK_BugNet_Issues_BugNet_ProjectIssueTypes];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_Issues_BugNet_ProjectMilestones]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_Issues] DROP CONSTRAINT [FK_BugNet_Issues_BugNet_ProjectMilestones];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_Issues_BugNet_ProjectMilestones1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_Issues] DROP CONSTRAINT [FK_BugNet_Issues_BugNet_ProjectMilestones1];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_Issues_BugNet_ProjectPriorities1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_Issues] DROP CONSTRAINT [FK_BugNet_Issues_BugNet_ProjectPriorities1];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_Issues_BugNet_ProjectResolutions]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_Issues] DROP CONSTRAINT [FK_BugNet_Issues_BugNet_ProjectResolutions];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_Issues_BugNet_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_Issues] DROP CONSTRAINT [FK_BugNet_Issues_BugNet_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_Issues_BugNet_ProjectStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_Issues] DROP CONSTRAINT [FK_BugNet_Issues_BugNet_ProjectStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_ProjectCategories_BugNet_ProjectCategories]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_ProjectCategories] DROP CONSTRAINT [FK_BugNet_ProjectCategories_BugNet_ProjectCategories];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_ProjectCategories_BugNet_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_ProjectCategories] DROP CONSTRAINT [FK_BugNet_ProjectCategories_BugNet_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_ProjectCustomFields_BugNet_ProjectCustomFieldTypes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_ProjectCustomFields] DROP CONSTRAINT [FK_BugNet_ProjectCustomFields_BugNet_ProjectCustomFieldTypes];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_ProjectCustomFields_BugNet_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_ProjectCustomFields] DROP CONSTRAINT [FK_BugNet_ProjectCustomFields_BugNet_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_ProjectCustomFieldSelections_BugNet_ProjectCustomFields]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_ProjectCustomFieldSelections] DROP CONSTRAINT [FK_BugNet_ProjectCustomFieldSelections_BugNet_ProjectCustomFields];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_ProjectCustomFieldValues_BugNet_ProjectCustomFields]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_ProjectCustomFieldValues] DROP CONSTRAINT [FK_BugNet_ProjectCustomFieldValues_BugNet_ProjectCustomFields];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_ProjectIssueFields_BugNet_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_ProjectIssueFields] DROP CONSTRAINT [FK_BugNet_ProjectIssueFields_BugNet_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_ProjectIssueTypes_BugNet_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_ProjectIssueTypes] DROP CONSTRAINT [FK_BugNet_ProjectIssueTypes_BugNet_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_ProjectMailBoxes_BugNet_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_ProjectMailBoxes] DROP CONSTRAINT [FK_BugNet_ProjectMailBoxes_BugNet_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_ProjectMilestones_BugNet_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_ProjectMilestones] DROP CONSTRAINT [FK_BugNet_ProjectMilestones_BugNet_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_ProjectNotifications_BugNet_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_ProjectNotifications] DROP CONSTRAINT [FK_BugNet_ProjectNotifications_BugNet_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_ProjectPriorities_BugNet_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_ProjectPriorities] DROP CONSTRAINT [FK_BugNet_ProjectPriorities_BugNet_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_Projects_BugNet_ProjectResolutions]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_Projects] DROP CONSTRAINT [FK_BugNet_Projects_BugNet_ProjectResolutions];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_ProjectStatus_BugNet_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_ProjectStatus] DROP CONSTRAINT [FK_BugNet_ProjectStatus_BugNet_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_Queries_BugNet_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_Queries] DROP CONSTRAINT [FK_BugNet_Queries_BugNet_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_QueryClauses_BugNet_Queries]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_QueryClauses] DROP CONSTRAINT [FK_BugNet_QueryClauses_BugNet_Queries];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_RolePermissions_BugNet_Permissions]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_RolePermissions] DROP CONSTRAINT [FK_BugNet_RolePermissions_BugNet_Permissions];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_RolePermissions_BugNet_Roles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_RolePermissions] DROP CONSTRAINT [FK_BugNet_RolePermissions_BugNet_Roles];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_Roles_BugNet_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_Roles] DROP CONSTRAINT [FK_BugNet_Roles_BugNet_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_UserProjects_BugNet_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_UserProjects] DROP CONSTRAINT [FK_BugNet_UserProjects_BugNet_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_BugNet_UserRoles_BugNet_Roles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BugNet_UserRoles] DROP CONSTRAINT [FK_BugNet_UserRoles_BugNet_Roles];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[BugNet_ApplicationLog]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_ApplicationLog];
GO
IF OBJECT_ID(N'[dbo].[BugNet_HostSettings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_HostSettings];
GO
IF OBJECT_ID(N'[dbo].[BugNet_IssueAttachments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_IssueAttachments];
GO
IF OBJECT_ID(N'[dbo].[BugNet_IssueComments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_IssueComments];
GO
IF OBJECT_ID(N'[dbo].[BugNet_IssueHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_IssueHistory];
GO
IF OBJECT_ID(N'[dbo].[BugNet_IssueNotifications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_IssueNotifications];
GO
IF OBJECT_ID(N'[dbo].[BugNet_IssueRevisions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_IssueRevisions];
GO
IF OBJECT_ID(N'[dbo].[BugNet_Issues]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_Issues];
GO
IF OBJECT_ID(N'[dbo].[BugNet_IssueVotes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_IssueVotes];
GO
IF OBJECT_ID(N'[dbo].[BugNet_IssueWorkReports]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_IssueWorkReports];
GO
IF OBJECT_ID(N'[dbo].[BugNet_Languages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_Languages];
GO
IF OBJECT_ID(N'[dbo].[BugNet_Permissions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_Permissions];
GO
IF OBJECT_ID(N'[dbo].[BugNet_ProjectCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_ProjectCategories];
GO
IF OBJECT_ID(N'[dbo].[BugNet_ProjectCustomFields]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_ProjectCustomFields];
GO
IF OBJECT_ID(N'[dbo].[BugNet_ProjectCustomFieldSelections]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_ProjectCustomFieldSelections];
GO
IF OBJECT_ID(N'[dbo].[BugNet_ProjectCustomFieldTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_ProjectCustomFieldTypes];
GO
IF OBJECT_ID(N'[dbo].[BugNet_ProjectCustomFieldValues]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_ProjectCustomFieldValues];
GO
IF OBJECT_ID(N'[dbo].[BugNet_ProjectIssueFields]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_ProjectIssueFields];
GO
IF OBJECT_ID(N'[dbo].[BugNet_ProjectIssueTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_ProjectIssueTypes];
GO
IF OBJECT_ID(N'[dbo].[BugNet_ProjectMailBoxes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_ProjectMailBoxes];
GO
IF OBJECT_ID(N'[dbo].[BugNet_ProjectMilestones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_ProjectMilestones];
GO
IF OBJECT_ID(N'[dbo].[BugNet_ProjectNotifications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_ProjectNotifications];
GO
IF OBJECT_ID(N'[dbo].[BugNet_ProjectPriorities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_ProjectPriorities];
GO
IF OBJECT_ID(N'[dbo].[BugNet_ProjectResolutions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_ProjectResolutions];
GO
IF OBJECT_ID(N'[dbo].[BugNet_Projects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_Projects];
GO
IF OBJECT_ID(N'[dbo].[BugNet_ProjectStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_ProjectStatus];
GO
IF OBJECT_ID(N'[dbo].[BugNet_Queries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_Queries];
GO
IF OBJECT_ID(N'[dbo].[BugNet_QueryClauses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_QueryClauses];
GO
IF OBJECT_ID(N'[BugNETEntitiesDataContextBugNetDataContextModelStoreContainer].[BugNet_RelatedIssues]', 'U') IS NOT NULL
    DROP TABLE [BugNETEntitiesDataContextBugNetDataContextModelStoreContainer].[BugNet_RelatedIssues];
GO
IF OBJECT_ID(N'[dbo].[BugNet_RequiredFieldList]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_RequiredFieldList];
GO
IF OBJECT_ID(N'[dbo].[BugNet_RolePermissions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_RolePermissions];
GO
IF OBJECT_ID(N'[dbo].[BugNet_Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_Roles];
GO
IF OBJECT_ID(N'[dbo].[BugNet_UserProfiles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_UserProfiles];
GO
IF OBJECT_ID(N'[dbo].[BugNet_UserProjects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_UserProjects];
GO
IF OBJECT_ID(N'[dbo].[BugNet_UserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BugNet_UserRoles];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'BugNet_ApplicationLog'
CREATE TABLE [dbo].[BugNet_ApplicationLog] (
    [Id] uniqueidentifier  NOT NULL,
    [Date] datetime  NOT NULL,
    [Thread] varchar(255)  NOT NULL,
    [Level] varchar(50)  NOT NULL,
    [Logger] varchar(255)  NOT NULL,
    [User] nvarchar(50)  NOT NULL,
    [Message] varchar(4000)  NOT NULL,
    [Exception] varchar(2000)  NULL
);
GO

-- Creating table 'BugNet_HostSettings'
CREATE TABLE [dbo].[BugNet_HostSettings] (
    [SettingName] nvarchar(50)  NOT NULL,
    [SettingValue] nvarchar(max)  NULL
);
GO

-- Creating table 'BugNet_IssueAttachments'
CREATE TABLE [dbo].[BugNet_IssueAttachments] (
    [Id] uniqueidentifier  NOT NULL,
    [IssueId] int  NOT NULL,
    [FileName] nvarchar(250)  NOT NULL,
    [Description] nvarchar(80)  NOT NULL,
    [FileSize] int  NOT NULL,
    [ContentType] nvarchar(50)  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [Attachment] varbinary(max)  NULL
);
GO

-- Creating table 'BugNet_IssueComments'
CREATE TABLE [dbo].[BugNet_IssueComments] (
    [Id] uniqueidentifier  NOT NULL,
    [IssueId] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [Comment] nvarchar(max)  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'BugNet_IssueHistory'
CREATE TABLE [dbo].[BugNet_IssueHistory] (
    [Id] uniqueidentifier  NOT NULL,
    [IssueId] int  NOT NULL,
    [FieldChanged] nvarchar(50)  NOT NULL,
    [OldValue] nvarchar(50)  NOT NULL,
    [NewValue] nvarchar(50)  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'BugNet_IssueNotifications'
CREATE TABLE [dbo].[BugNet_IssueNotifications] (
    [Id] uniqueidentifier  NOT NULL,
    [IssueId] int  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'BugNet_IssueRevisions'
CREATE TABLE [dbo].[BugNet_IssueRevisions] (
    [Id] uniqueidentifier  NOT NULL,
    [Revision] int  NOT NULL,
    [IssueId] int  NOT NULL,
    [Repository] nvarchar(400)  NOT NULL,
    [RevisionAuthor] nvarchar(100)  NOT NULL,
    [RevisionDate] nvarchar(100)  NOT NULL,
    [RevisionMessage] nvarchar(max)  NOT NULL,
    [DateCreated] datetime  NOT NULL
);
GO

-- Creating table 'BugNet_Issues'
CREATE TABLE [dbo].[BugNet_Issues] (
    [Id] uniqueidentifier  NOT NULL,
    [Title] nvarchar(500)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [StatusId] uniqueidentifier  NULL,
    [PriorityId] uniqueidentifier  NULL,
    [TypeId] uniqueidentifier  NULL,
    [CategoryId] uniqueidentifier  NULL,
    [ProjectId] uniqueidentifier  NOT NULL,
    [AffectedMilestoneId] uniqueidentifier  NULL,
    [ResolutionId] uniqueidentifier  NULL,
    [CreatorUserId] uniqueidentifier  NOT NULL,
    [AssignedUserId] uniqueidentifier  NULL,
    [OwnerUserId] uniqueidentifier  NULL,
    [DueDate] datetime  NULL,
    [MilestoneId] uniqueidentifier  NOT NULL,
    [Visibility] int  NOT NULL,
    [Estimation] decimal(5,2)  NOT NULL,
    [Progress] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [LastUpdate] datetime  NOT NULL,
    [LastUpdateUserId] uniqueidentifier  NOT NULL,
    [Disabled] bit  NOT NULL
);
GO

-- Creating table 'BugNet_IssueVotes'
CREATE TABLE [dbo].[BugNet_IssueVotes] (
    [Id] uniqueidentifier  NOT NULL,
    [IssueId] int  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [DateCreated] datetime  NOT NULL
);
GO

-- Creating table 'BugNet_IssueWorkReports'
CREATE TABLE [dbo].[BugNet_IssueWorkReports] (
    [Id] uniqueidentifier  NOT NULL,
    [IssueId] int  NOT NULL,
    [WorkDate] datetime  NOT NULL,
    [Duration] decimal(4,2)  NOT NULL,
    [IssueCommentId] int  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'BugNet_Languages'
CREATE TABLE [dbo].[BugNet_Languages] (
    [Id] uniqueidentifier  NOT NULL,
    [CultureCode] nvarchar(50)  NOT NULL,
    [CultureName] nvarchar(200)  NOT NULL,
    [FallbackCulture] nvarchar(50)  NULL
);
GO

-- Creating table 'BugNet_Permissions'
CREATE TABLE [dbo].[BugNet_Permissions] (
    [Id] uniqueidentifier  NOT NULL,
    [PermissionKey] nvarchar(50)  NOT NULL,
    [PermissionName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'BugNet_ProjectCategories'
CREATE TABLE [dbo].[BugNet_ProjectCategories] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [ProjectId] uniqueidentifier  NOT NULL,
    [ParentCategoryId] uniqueidentifier  NULL,
    [Disabled] bit  NOT NULL
);
GO

-- Creating table 'BugNet_ProjectCustomFields'
CREATE TABLE [dbo].[BugNet_ProjectCustomFields] (
    [Id] uniqueidentifier  NOT NULL,
    [ProjectId] uniqueidentifier  NOT NULL,
    [CustomFieldName] nvarchar(50)  NOT NULL,
    [CustomFieldRequired] bit  NOT NULL,
    [CustomFieldDataType] int  NOT NULL,
    [CustomFieldTypeId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'BugNet_ProjectCustomFieldSelections'
CREATE TABLE [dbo].[BugNet_ProjectCustomFieldSelections] (
    [Id] uniqueidentifier  NOT NULL,
    [CustomFieldId] uniqueidentifier  NOT NULL,
    [Value] nchar(255)  NOT NULL,
    [Name] nchar(255)  NOT NULL,
    [SortOrder] int  NOT NULL
);
GO

-- Creating table 'BugNet_ProjectCustomFieldTypes'
CREATE TABLE [dbo].[BugNet_ProjectCustomFieldTypes] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'BugNet_ProjectCustomFieldValues'
CREATE TABLE [dbo].[BugNet_ProjectCustomFieldValues] (
    [Id] uniqueidentifier  NOT NULL,
    [IssueId] uniqueidentifier  NOT NULL,
    [CustomFieldId] uniqueidentifier  NOT NULL,
    [CustomFieldValue] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'BugNet_ProjectIssueFields'
CREATE TABLE [dbo].[BugNet_ProjectIssueFields] (
    [ld] uniqueidentifier  NOT NULL,
    [ProjectId] uniqueidentifier  NOT NULL,
    [IssueFieldId] nvarchar(50)  NOT NULL,
    [IssueFieldRequired] bit  NOT NULL,
    [IssueFieldShowOnNewIssue] bit  NOT NULL,
    [IssueFieldShowOnEditIssue] bit  NOT NULL,
    [SortOrder] int  NOT NULL
);
GO

-- Creating table 'BugNet_ProjectIssueTypes'
CREATE TABLE [dbo].[BugNet_ProjectIssueTypes] (
    [Id] uniqueidentifier  NOT NULL,
    [ProjectId] uniqueidentifier  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ImageUrl] nvarchar(50)  NOT NULL,
    [SortOrder] int  NOT NULL
);
GO

-- Creating table 'BugNet_ProjectMailBoxes'
CREATE TABLE [dbo].[BugNet_ProjectMailBoxes] (
    [Id] uniqueidentifier  NOT NULL,
    [MailBox] nvarchar(100)  NOT NULL,
    [ProjectId] uniqueidentifier  NOT NULL,
    [AssignToUserId] uniqueidentifier  NULL,
    [IssueTypeId] int  NULL
);
GO

-- Creating table 'BugNet_ProjectMilestones'
CREATE TABLE [dbo].[BugNet_ProjectMilestones] (
    [Id] uniqueidentifier  NOT NULL,
    [ProjectId] uniqueidentifier  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ImageUrl] nvarchar(50)  NOT NULL,
    [SortOrder] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [DueDate] datetime  NULL,
    [ReleaseDate] datetime  NULL,
    [Notes] nvarchar(max)  NULL,
    [Completed] bit  NOT NULL
);
GO

-- Creating table 'BugNet_ProjectNotifications'
CREATE TABLE [dbo].[BugNet_ProjectNotifications] (
    [Id] uniqueidentifier  NOT NULL,
    [ProjectId] uniqueidentifier  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'BugNet_ProjectPriorities'
CREATE TABLE [dbo].[BugNet_ProjectPriorities] (
    [Id] uniqueidentifier  NOT NULL,
    [ProjectId] uniqueidentifier  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ImageUrl] nvarchar(50)  NOT NULL,
    [SortOrder] int  NOT NULL
);
GO

-- Creating table 'BugNet_ProjectResolutions'
CREATE TABLE [dbo].[BugNet_ProjectResolutions] (
    [Id] uniqueidentifier  NOT NULL,
    [ProjectId] uniqueidentifier  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ImageUrl] nvarchar(50)  NOT NULL,
    [SortOrder] int  NOT NULL
);
GO

-- Creating table 'BugNet_Projects'
CREATE TABLE [dbo].[BugNet_Projects] (
    [Id] uniqueidentifier  NOT NULL,
    [ProjectName] nvarchar(50)  NOT NULL,
    [ProjectCode] nvarchar(50)  NOT NULL,
    [ProjectDescription] nvarchar(max)  NOT NULL,
    [AttachmentUploadPath] nvarchar(256)  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [ProjectDisabled] bit  NOT NULL,
    [ProjectAccessType] int  NOT NULL,
    [ProjectManagerUserId] uniqueidentifier  NOT NULL,
    [ProjectCreatorUserId] uniqueidentifier  NOT NULL,
    [AllowAttachments] bit  NOT NULL,
    [AttachmentStorageType] int  NULL,
    [SvnRepositoryUrl] nvarchar(255)  NULL,
    [AllowIssueVoting] bit  NOT NULL,
    [ProjectImageFileContent] varbinary(max)  NULL,
    [ProjectImageFileName] nvarchar(150)  NULL,
    [ProjectImageContentType] nvarchar(50)  NULL,
    [ProjectImageFileSize] bigint  NULL
);
GO

-- Creating table 'BugNet_ProjectStatus'
CREATE TABLE [dbo].[BugNet_ProjectStatus] (
    [Id] uniqueidentifier  NOT NULL,
    [ProjectId] uniqueidentifier  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ImageUrl] nvarchar(50)  NOT NULL,
    [SortOrder] int  NOT NULL,
    [State] bit  NOT NULL
);
GO

-- Creating table 'BugNet_Queries'
CREATE TABLE [dbo].[BugNet_Queries] (
    [Id] uniqueidentifier  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [ProjectId] uniqueidentifier  NOT NULL,
    [QueryName] nvarchar(255)  NOT NULL,
    [IsPublic] bit  NOT NULL
);
GO

-- Creating table 'BugNet_QueryClauses'
CREATE TABLE [dbo].[BugNet_QueryClauses] (
    [Id] uniqueidentifier  NOT NULL,
    [QueryId] uniqueidentifier  NOT NULL,
    [BooleanOperator] nvarchar(50)  NOT NULL,
    [FieldName] nvarchar(50)  NOT NULL,
    [ComparisonOperator] nvarchar(50)  NOT NULL,
    [FieldValue] nvarchar(50)  NOT NULL,
    [DataType] int  NOT NULL,
    [IsCustomField] bit  NOT NULL
);
GO

-- Creating table 'BugNet_RelatedIssues'
CREATE TABLE [dbo].[BugNet_RelatedIssues] (
    [PrimaryIssueId] int  NOT NULL,
    [SecondaryIssueId] int  NOT NULL,
    [RelationType] int  NOT NULL
);
GO

-- Creating table 'BugNet_RequiredFieldList'
CREATE TABLE [dbo].[BugNet_RequiredFieldList] (
    [Id] uniqueidentifier  NOT NULL,
    [FieldName] nvarchar(50)  NOT NULL,
    [FieldValue] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'BugNet_Roles'
CREATE TABLE [dbo].[BugNet_Roles] (
    [Id] uniqueidentifier  NOT NULL,
    [ProjectId] uniqueidentifier  NOT NULL,
    [RoleName] nvarchar(256)  NOT NULL,
    [RoleDescription] nvarchar(256)  NOT NULL,
    [AutoAssign] bit  NOT NULL
);
GO

-- Creating table 'BugNet_UserProfiles'
CREATE TABLE [dbo].[BugNet_UserProfiles] (
    [UserName] nvarchar(50)  NOT NULL,
    [FirstName] nvarchar(100)  NULL,
    [LastName] nvarchar(100)  NULL,
    [DisplayName] nvarchar(100)  NULL,
    [IssuesPageSize] int  NULL,
    [NotificationTypes] nvarchar(255)  NULL,
    [PreferredLocale] nvarchar(50)  NULL,
    [LastUpdate] datetime  NOT NULL,
    [SelectedIssueColumns] nvarchar(50)  NULL
);
GO

-- Creating table 'BugNet_UserProjects'
CREATE TABLE [dbo].[BugNet_UserProjects] (
    [UserId] uniqueidentifier  NOT NULL,
    [ProjectId] uniqueidentifier  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [SelectedIssueColumns] nvarchar(255)  NULL
);
GO

-- Creating table 'BugNet_UserRoles'
CREATE TABLE [dbo].[BugNet_UserRoles] (
    [UserId] uniqueidentifier  NOT NULL,
    [RoleId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'BugNet_RolePermissions'
CREATE TABLE [dbo].[BugNet_RolePermissions] (
    [BugNet_Permissions_Id] uniqueidentifier  NOT NULL,
    [BugNet_Roles_Id] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'BugNet_ApplicationLog'
ALTER TABLE [dbo].[BugNet_ApplicationLog]
ADD CONSTRAINT [PK_BugNet_ApplicationLog]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [SettingName] in table 'BugNet_HostSettings'
ALTER TABLE [dbo].[BugNet_HostSettings]
ADD CONSTRAINT [PK_BugNet_HostSettings]
    PRIMARY KEY CLUSTERED ([SettingName] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_IssueAttachments'
ALTER TABLE [dbo].[BugNet_IssueAttachments]
ADD CONSTRAINT [PK_BugNet_IssueAttachments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_IssueComments'
ALTER TABLE [dbo].[BugNet_IssueComments]
ADD CONSTRAINT [PK_BugNet_IssueComments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_IssueHistory'
ALTER TABLE [dbo].[BugNet_IssueHistory]
ADD CONSTRAINT [PK_BugNet_IssueHistory]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_IssueNotifications'
ALTER TABLE [dbo].[BugNet_IssueNotifications]
ADD CONSTRAINT [PK_BugNet_IssueNotifications]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_IssueRevisions'
ALTER TABLE [dbo].[BugNet_IssueRevisions]
ADD CONSTRAINT [PK_BugNet_IssueRevisions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_Issues'
ALTER TABLE [dbo].[BugNet_Issues]
ADD CONSTRAINT [PK_BugNet_Issues]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_IssueVotes'
ALTER TABLE [dbo].[BugNet_IssueVotes]
ADD CONSTRAINT [PK_BugNet_IssueVotes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_IssueWorkReports'
ALTER TABLE [dbo].[BugNet_IssueWorkReports]
ADD CONSTRAINT [PK_BugNet_IssueWorkReports]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_Languages'
ALTER TABLE [dbo].[BugNet_Languages]
ADD CONSTRAINT [PK_BugNet_Languages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_Permissions'
ALTER TABLE [dbo].[BugNet_Permissions]
ADD CONSTRAINT [PK_BugNet_Permissions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_ProjectCategories'
ALTER TABLE [dbo].[BugNet_ProjectCategories]
ADD CONSTRAINT [PK_BugNet_ProjectCategories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_ProjectCustomFields'
ALTER TABLE [dbo].[BugNet_ProjectCustomFields]
ADD CONSTRAINT [PK_BugNet_ProjectCustomFields]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_ProjectCustomFieldSelections'
ALTER TABLE [dbo].[BugNet_ProjectCustomFieldSelections]
ADD CONSTRAINT [PK_BugNet_ProjectCustomFieldSelections]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_ProjectCustomFieldTypes'
ALTER TABLE [dbo].[BugNet_ProjectCustomFieldTypes]
ADD CONSTRAINT [PK_BugNet_ProjectCustomFieldTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_ProjectCustomFieldValues'
ALTER TABLE [dbo].[BugNet_ProjectCustomFieldValues]
ADD CONSTRAINT [PK_BugNet_ProjectCustomFieldValues]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ld] in table 'BugNet_ProjectIssueFields'
ALTER TABLE [dbo].[BugNet_ProjectIssueFields]
ADD CONSTRAINT [PK_BugNet_ProjectIssueFields]
    PRIMARY KEY CLUSTERED ([ld] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_ProjectIssueTypes'
ALTER TABLE [dbo].[BugNet_ProjectIssueTypes]
ADD CONSTRAINT [PK_BugNet_ProjectIssueTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_ProjectMailBoxes'
ALTER TABLE [dbo].[BugNet_ProjectMailBoxes]
ADD CONSTRAINT [PK_BugNet_ProjectMailBoxes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_ProjectMilestones'
ALTER TABLE [dbo].[BugNet_ProjectMilestones]
ADD CONSTRAINT [PK_BugNet_ProjectMilestones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_ProjectNotifications'
ALTER TABLE [dbo].[BugNet_ProjectNotifications]
ADD CONSTRAINT [PK_BugNet_ProjectNotifications]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_ProjectPriorities'
ALTER TABLE [dbo].[BugNet_ProjectPriorities]
ADD CONSTRAINT [PK_BugNet_ProjectPriorities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_ProjectResolutions'
ALTER TABLE [dbo].[BugNet_ProjectResolutions]
ADD CONSTRAINT [PK_BugNet_ProjectResolutions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_Projects'
ALTER TABLE [dbo].[BugNet_Projects]
ADD CONSTRAINT [PK_BugNet_Projects]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_ProjectStatus'
ALTER TABLE [dbo].[BugNet_ProjectStatus]
ADD CONSTRAINT [PK_BugNet_ProjectStatus]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_Queries'
ALTER TABLE [dbo].[BugNet_Queries]
ADD CONSTRAINT [PK_BugNet_Queries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_QueryClauses'
ALTER TABLE [dbo].[BugNet_QueryClauses]
ADD CONSTRAINT [PK_BugNet_QueryClauses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [PrimaryIssueId], [SecondaryIssueId], [RelationType] in table 'BugNet_RelatedIssues'
ALTER TABLE [dbo].[BugNet_RelatedIssues]
ADD CONSTRAINT [PK_BugNet_RelatedIssues]
    PRIMARY KEY CLUSTERED ([PrimaryIssueId], [SecondaryIssueId], [RelationType] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_RequiredFieldList'
ALTER TABLE [dbo].[BugNet_RequiredFieldList]
ADD CONSTRAINT [PK_BugNet_RequiredFieldList]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BugNet_Roles'
ALTER TABLE [dbo].[BugNet_Roles]
ADD CONSTRAINT [PK_BugNet_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [UserName] in table 'BugNet_UserProfiles'
ALTER TABLE [dbo].[BugNet_UserProfiles]
ADD CONSTRAINT [PK_BugNet_UserProfiles]
    PRIMARY KEY CLUSTERED ([UserName] ASC);
GO

-- Creating primary key on [UserId], [ProjectId] in table 'BugNet_UserProjects'
ALTER TABLE [dbo].[BugNet_UserProjects]
ADD CONSTRAINT [PK_BugNet_UserProjects]
    PRIMARY KEY CLUSTERED ([UserId], [ProjectId] ASC);
GO

-- Creating primary key on [UserId], [RoleId] in table 'BugNet_UserRoles'
ALTER TABLE [dbo].[BugNet_UserRoles]
ADD CONSTRAINT [PK_BugNet_UserRoles]
    PRIMARY KEY CLUSTERED ([UserId], [RoleId] ASC);
GO

-- Creating primary key on [BugNet_Permissions_Id], [BugNet_Roles_Id] in table 'BugNet_RolePermissions'
ALTER TABLE [dbo].[BugNet_RolePermissions]
ADD CONSTRAINT [PK_BugNet_RolePermissions]
    PRIMARY KEY NONCLUSTERED ([BugNet_Permissions_Id], [BugNet_Roles_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CategoryId] in table 'BugNet_Issues'
ALTER TABLE [dbo].[BugNet_Issues]
ADD CONSTRAINT [FK_BugNet_Issues_BugNet_ProjectCategories1]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[BugNet_ProjectCategories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_Issues_BugNet_ProjectCategories1'
CREATE INDEX [IX_FK_BugNet_Issues_BugNet_ProjectCategories1]
ON [dbo].[BugNet_Issues]
    ([CategoryId]);
GO

-- Creating foreign key on [TypeId] in table 'BugNet_Issues'
ALTER TABLE [dbo].[BugNet_Issues]
ADD CONSTRAINT [FK_BugNet_Issues_BugNet_ProjectIssueTypes]
    FOREIGN KEY ([TypeId])
    REFERENCES [dbo].[BugNet_ProjectIssueTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_Issues_BugNet_ProjectIssueTypes'
CREATE INDEX [IX_FK_BugNet_Issues_BugNet_ProjectIssueTypes]
ON [dbo].[BugNet_Issues]
    ([TypeId]);
GO

-- Creating foreign key on [AffectedMilestoneId] in table 'BugNet_Issues'
ALTER TABLE [dbo].[BugNet_Issues]
ADD CONSTRAINT [FK_BugNet_Issues_BugNet_ProjectMilestones]
    FOREIGN KEY ([AffectedMilestoneId])
    REFERENCES [dbo].[BugNet_ProjectMilestones]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_Issues_BugNet_ProjectMilestones'
CREATE INDEX [IX_FK_BugNet_Issues_BugNet_ProjectMilestones]
ON [dbo].[BugNet_Issues]
    ([AffectedMilestoneId]);
GO

-- Creating foreign key on [MilestoneId] in table 'BugNet_Issues'
ALTER TABLE [dbo].[BugNet_Issues]
ADD CONSTRAINT [FK_BugNet_Issues_BugNet_ProjectMilestones1]
    FOREIGN KEY ([MilestoneId])
    REFERENCES [dbo].[BugNet_ProjectMilestones]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_Issues_BugNet_ProjectMilestones1'
CREATE INDEX [IX_FK_BugNet_Issues_BugNet_ProjectMilestones1]
ON [dbo].[BugNet_Issues]
    ([MilestoneId]);
GO

-- Creating foreign key on [PriorityId] in table 'BugNet_Issues'
ALTER TABLE [dbo].[BugNet_Issues]
ADD CONSTRAINT [FK_BugNet_Issues_BugNet_ProjectPriorities1]
    FOREIGN KEY ([PriorityId])
    REFERENCES [dbo].[BugNet_ProjectPriorities]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_Issues_BugNet_ProjectPriorities1'
CREATE INDEX [IX_FK_BugNet_Issues_BugNet_ProjectPriorities1]
ON [dbo].[BugNet_Issues]
    ([PriorityId]);
GO

-- Creating foreign key on [ResolutionId] in table 'BugNet_Issues'
ALTER TABLE [dbo].[BugNet_Issues]
ADD CONSTRAINT [FK_BugNet_Issues_BugNet_ProjectResolutions]
    FOREIGN KEY ([ResolutionId])
    REFERENCES [dbo].[BugNet_ProjectResolutions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_Issues_BugNet_ProjectResolutions'
CREATE INDEX [IX_FK_BugNet_Issues_BugNet_ProjectResolutions]
ON [dbo].[BugNet_Issues]
    ([ResolutionId]);
GO

-- Creating foreign key on [PriorityId] in table 'BugNet_Issues'
ALTER TABLE [dbo].[BugNet_Issues]
ADD CONSTRAINT [FK_BugNet_Issues_BugNet_Projects]
    FOREIGN KEY ([PriorityId])
    REFERENCES [dbo].[BugNet_Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_Issues_BugNet_Projects'
CREATE INDEX [IX_FK_BugNet_Issues_BugNet_Projects]
ON [dbo].[BugNet_Issues]
    ([PriorityId]);
GO

-- Creating foreign key on [StatusId] in table 'BugNet_Issues'
ALTER TABLE [dbo].[BugNet_Issues]
ADD CONSTRAINT [FK_BugNet_Issues_BugNet_ProjectStatus]
    FOREIGN KEY ([StatusId])
    REFERENCES [dbo].[BugNet_ProjectStatus]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_Issues_BugNet_ProjectStatus'
CREATE INDEX [IX_FK_BugNet_Issues_BugNet_ProjectStatus]
ON [dbo].[BugNet_Issues]
    ([StatusId]);
GO

-- Creating foreign key on [ParentCategoryId] in table 'BugNet_ProjectCategories'
ALTER TABLE [dbo].[BugNet_ProjectCategories]
ADD CONSTRAINT [FK_BugNet_ProjectCategories_BugNet_ProjectCategories]
    FOREIGN KEY ([ParentCategoryId])
    REFERENCES [dbo].[BugNet_ProjectCategories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_ProjectCategories_BugNet_ProjectCategories'
CREATE INDEX [IX_FK_BugNet_ProjectCategories_BugNet_ProjectCategories]
ON [dbo].[BugNet_ProjectCategories]
    ([ParentCategoryId]);
GO

-- Creating foreign key on [ProjectId] in table 'BugNet_ProjectCategories'
ALTER TABLE [dbo].[BugNet_ProjectCategories]
ADD CONSTRAINT [FK_BugNet_ProjectCategories_BugNet_Projects]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[BugNet_Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_ProjectCategories_BugNet_Projects'
CREATE INDEX [IX_FK_BugNet_ProjectCategories_BugNet_Projects]
ON [dbo].[BugNet_ProjectCategories]
    ([ProjectId]);
GO

-- Creating foreign key on [CustomFieldTypeId] in table 'BugNet_ProjectCustomFields'
ALTER TABLE [dbo].[BugNet_ProjectCustomFields]
ADD CONSTRAINT [FK_BugNet_ProjectCustomFields_BugNet_ProjectCustomFieldTypes]
    FOREIGN KEY ([CustomFieldTypeId])
    REFERENCES [dbo].[BugNet_ProjectCustomFieldTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_ProjectCustomFields_BugNet_ProjectCustomFieldTypes'
CREATE INDEX [IX_FK_BugNet_ProjectCustomFields_BugNet_ProjectCustomFieldTypes]
ON [dbo].[BugNet_ProjectCustomFields]
    ([CustomFieldTypeId]);
GO

-- Creating foreign key on [ProjectId] in table 'BugNet_ProjectCustomFields'
ALTER TABLE [dbo].[BugNet_ProjectCustomFields]
ADD CONSTRAINT [FK_BugNet_ProjectCustomFields_BugNet_Projects]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[BugNet_Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_ProjectCustomFields_BugNet_Projects'
CREATE INDEX [IX_FK_BugNet_ProjectCustomFields_BugNet_Projects]
ON [dbo].[BugNet_ProjectCustomFields]
    ([ProjectId]);
GO

-- Creating foreign key on [CustomFieldId] in table 'BugNet_ProjectCustomFieldSelections'
ALTER TABLE [dbo].[BugNet_ProjectCustomFieldSelections]
ADD CONSTRAINT [FK_BugNet_ProjectCustomFieldSelections_BugNet_ProjectCustomFields]
    FOREIGN KEY ([CustomFieldId])
    REFERENCES [dbo].[BugNet_ProjectCustomFields]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_ProjectCustomFieldSelections_BugNet_ProjectCustomFields'
CREATE INDEX [IX_FK_BugNet_ProjectCustomFieldSelections_BugNet_ProjectCustomFields]
ON [dbo].[BugNet_ProjectCustomFieldSelections]
    ([CustomFieldId]);
GO

-- Creating foreign key on [CustomFieldId] in table 'BugNet_ProjectCustomFieldValues'
ALTER TABLE [dbo].[BugNet_ProjectCustomFieldValues]
ADD CONSTRAINT [FK_BugNet_ProjectCustomFieldValues_BugNet_ProjectCustomFields]
    FOREIGN KEY ([CustomFieldId])
    REFERENCES [dbo].[BugNet_ProjectCustomFields]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_ProjectCustomFieldValues_BugNet_ProjectCustomFields'
CREATE INDEX [IX_FK_BugNet_ProjectCustomFieldValues_BugNet_ProjectCustomFields]
ON [dbo].[BugNet_ProjectCustomFieldValues]
    ([CustomFieldId]);
GO

-- Creating foreign key on [ProjectId] in table 'BugNet_ProjectIssueFields'
ALTER TABLE [dbo].[BugNet_ProjectIssueFields]
ADD CONSTRAINT [FK_BugNet_ProjectIssueFields_BugNet_Projects]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[BugNet_Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_ProjectIssueFields_BugNet_Projects'
CREATE INDEX [IX_FK_BugNet_ProjectIssueFields_BugNet_Projects]
ON [dbo].[BugNet_ProjectIssueFields]
    ([ProjectId]);
GO

-- Creating foreign key on [ProjectId] in table 'BugNet_ProjectIssueTypes'
ALTER TABLE [dbo].[BugNet_ProjectIssueTypes]
ADD CONSTRAINT [FK_BugNet_ProjectIssueTypes_BugNet_Projects]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[BugNet_Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_ProjectIssueTypes_BugNet_Projects'
CREATE INDEX [IX_FK_BugNet_ProjectIssueTypes_BugNet_Projects]
ON [dbo].[BugNet_ProjectIssueTypes]
    ([ProjectId]);
GO

-- Creating foreign key on [ProjectId] in table 'BugNet_ProjectMailBoxes'
ALTER TABLE [dbo].[BugNet_ProjectMailBoxes]
ADD CONSTRAINT [FK_BugNet_ProjectMailBoxes_BugNet_Projects]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[BugNet_Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_ProjectMailBoxes_BugNet_Projects'
CREATE INDEX [IX_FK_BugNet_ProjectMailBoxes_BugNet_Projects]
ON [dbo].[BugNet_ProjectMailBoxes]
    ([ProjectId]);
GO

-- Creating foreign key on [ProjectId] in table 'BugNet_ProjectMilestones'
ALTER TABLE [dbo].[BugNet_ProjectMilestones]
ADD CONSTRAINT [FK_BugNet_ProjectMilestones_BugNet_Projects]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[BugNet_Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_ProjectMilestones_BugNet_Projects'
CREATE INDEX [IX_FK_BugNet_ProjectMilestones_BugNet_Projects]
ON [dbo].[BugNet_ProjectMilestones]
    ([ProjectId]);
GO

-- Creating foreign key on [ProjectId] in table 'BugNet_ProjectNotifications'
ALTER TABLE [dbo].[BugNet_ProjectNotifications]
ADD CONSTRAINT [FK_BugNet_ProjectNotifications_BugNet_Projects]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[BugNet_Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_ProjectNotifications_BugNet_Projects'
CREATE INDEX [IX_FK_BugNet_ProjectNotifications_BugNet_Projects]
ON [dbo].[BugNet_ProjectNotifications]
    ([ProjectId]);
GO

-- Creating foreign key on [ProjectId] in table 'BugNet_ProjectPriorities'
ALTER TABLE [dbo].[BugNet_ProjectPriorities]
ADD CONSTRAINT [FK_BugNet_ProjectPriorities_BugNet_Projects]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[BugNet_Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_ProjectPriorities_BugNet_Projects'
CREATE INDEX [IX_FK_BugNet_ProjectPriorities_BugNet_Projects]
ON [dbo].[BugNet_ProjectPriorities]
    ([ProjectId]);
GO

-- Creating foreign key on [Id] in table 'BugNet_Projects'
ALTER TABLE [dbo].[BugNet_Projects]
ADD CONSTRAINT [FK_BugNet_Projects_BugNet_ProjectResolutions]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[BugNet_ProjectResolutions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProjectId] in table 'BugNet_ProjectStatus'
ALTER TABLE [dbo].[BugNet_ProjectStatus]
ADD CONSTRAINT [FK_BugNet_ProjectStatus_BugNet_Projects]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[BugNet_Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_ProjectStatus_BugNet_Projects'
CREATE INDEX [IX_FK_BugNet_ProjectStatus_BugNet_Projects]
ON [dbo].[BugNet_ProjectStatus]
    ([ProjectId]);
GO

-- Creating foreign key on [ProjectId] in table 'BugNet_Queries'
ALTER TABLE [dbo].[BugNet_Queries]
ADD CONSTRAINT [FK_BugNet_Queries_BugNet_Projects]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[BugNet_Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_Queries_BugNet_Projects'
CREATE INDEX [IX_FK_BugNet_Queries_BugNet_Projects]
ON [dbo].[BugNet_Queries]
    ([ProjectId]);
GO

-- Creating foreign key on [ProjectId] in table 'BugNet_Roles'
ALTER TABLE [dbo].[BugNet_Roles]
ADD CONSTRAINT [FK_BugNet_Roles_BugNet_Projects]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[BugNet_Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_Roles_BugNet_Projects'
CREATE INDEX [IX_FK_BugNet_Roles_BugNet_Projects]
ON [dbo].[BugNet_Roles]
    ([ProjectId]);
GO

-- Creating foreign key on [ProjectId] in table 'BugNet_UserProjects'
ALTER TABLE [dbo].[BugNet_UserProjects]
ADD CONSTRAINT [FK_BugNet_UserProjects_BugNet_Projects]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[BugNet_Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_UserProjects_BugNet_Projects'
CREATE INDEX [IX_FK_BugNet_UserProjects_BugNet_Projects]
ON [dbo].[BugNet_UserProjects]
    ([ProjectId]);
GO

-- Creating foreign key on [QueryId] in table 'BugNet_QueryClauses'
ALTER TABLE [dbo].[BugNet_QueryClauses]
ADD CONSTRAINT [FK_BugNet_QueryClauses_BugNet_Queries]
    FOREIGN KEY ([QueryId])
    REFERENCES [dbo].[BugNet_Queries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_QueryClauses_BugNet_Queries'
CREATE INDEX [IX_FK_BugNet_QueryClauses_BugNet_Queries]
ON [dbo].[BugNet_QueryClauses]
    ([QueryId]);
GO

-- Creating foreign key on [RoleId] in table 'BugNet_UserRoles'
ALTER TABLE [dbo].[BugNet_UserRoles]
ADD CONSTRAINT [FK_BugNet_UserRoles_BugNet_Roles]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[BugNet_Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_UserRoles_BugNet_Roles'
CREATE INDEX [IX_FK_BugNet_UserRoles_BugNet_Roles]
ON [dbo].[BugNet_UserRoles]
    ([RoleId]);
GO

-- Creating foreign key on [BugNet_Permissions_Id] in table 'BugNet_RolePermissions'
ALTER TABLE [dbo].[BugNet_RolePermissions]
ADD CONSTRAINT [FK_BugNet_RolePermissions_BugNet_Permissions]
    FOREIGN KEY ([BugNet_Permissions_Id])
    REFERENCES [dbo].[BugNet_Permissions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BugNet_Roles_Id] in table 'BugNet_RolePermissions'
ALTER TABLE [dbo].[BugNet_RolePermissions]
ADD CONSTRAINT [FK_BugNet_RolePermissions_BugNet_Roles]
    FOREIGN KEY ([BugNet_Roles_Id])
    REFERENCES [dbo].[BugNet_Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BugNet_RolePermissions_BugNet_Roles'
CREATE INDEX [IX_FK_BugNet_RolePermissions_BugNet_Roles]
ON [dbo].[BugNet_RolePermissions]
    ([BugNet_Roles_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------