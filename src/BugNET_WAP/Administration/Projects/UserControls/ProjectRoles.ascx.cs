using System;
using System.Linq;
using System.Web.UI.WebControls;
using BugNET.BLL;
using BugNET.Common;
using BugNET.Entities;
using BugNET.UserInterfaceLayer;

namespace BugNET.Administration.Projects.UserControls
{
    /// <summary>
	///	Summary description for ProjectMemberRoles.
	/// </summary>
	public partial class ProjectRoles : System.Web.UI.UserControl, IEditProjectControl
	{
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
		protected void Page_Load(object sender, System.EventArgs e)
		{
		
		}
        /// <summary>
        /// Role Id
        /// </summary>
        int RoleId
        {
            get
            {
                if (ViewState["RoleId"] == null) return 0;
                return (int)ViewState["RoleId"];
            }
            set { ViewState["RoleId"] = value; }
        }

		#region IEditProjectControl Members

        /// <summary>
        /// Gets or sets the project id.
        /// </summary>
        /// <value>The project id.</value>
		public int ProjectId
		{
            get { return ((BasePage)Page).ProjectId; }
            set { ((BasePage)Page).ProjectId = value; }
		}

        /// <summary>
        /// Inits this instance.
        /// </summary>
		public void Initialize()
        {
            txtProjectID.Value = ProjectId.ToString();
            gvRoles.DataBind();
		}

        /// <summary>
        /// Updates this instance.
        /// </summary>
        /// <returns></returns>
		public bool Update()
		{
            
			return true;
		}

        /// <summary>
        /// Gets a value indicating whether [show save button].
        /// </summary>
        /// <value><c>true</c> if [show save button]; otherwise, <c>false</c>.</value>
        public bool ShowSaveButton
        {
            get { return false; }
        }
		#endregion

		#region Private Methods  

        /// <summary>
        /// Handles the Click event of the cmdAddUpdateRole control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void cmdAddUpdateRole_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            try
            {
                if (RoleId == 0)
                {
                    var roleName = txtRoleName.Text.Trim();
                    RoleId = RoleManager.CreateRole(roleName, ProjectId, txtDescription.Text, chkAutoAssign.Checked);
                    UpdatePermissions(RoleId);
                }
                else
                {
                    var r = RoleManager.GetById(RoleId);
                    r.Description = txtDescription.Text.Trim();
                    r.Name = txtRoleName.Text.Trim();
                    r.AutoAssign = chkAutoAssign.Checked;
                    RoleManager.SaveOrUpdate(r);
                    UpdatePermissions(RoleId);
                }

                AddRole.Visible = !AddRole.Visible;
                Roles.Visible = !Roles.Visible;
                Initialize();
            }
            catch
            {
                lblError.Text = LoggingManager.GetErrorMessageResource("AddRoleError");
            }
        }

        /// <summary>
        /// Binds the role details.
        /// </summary>
        /// <param name="roleId">The role id.</param>
		private void BindRoleDetails(int roleId)
		{
            if (roleId == -1)
            {
                cmdAddUpdateRole.Text = (string)GetLocalResourceObject("AddRoleButton.Text");
                cmdDelete.Visible = false;
                cancel.Visible = false;
                txtRoleName.Enabled = true;
                txtRoleName.Text = string.Empty;
                txtDescription.Text = string.Empty;
                txtDescription.Enabled = true;
                chkAddSubIssue.Checked = false;
                chkAddSubIssue.Enabled = true;
                chkAutoAssign.Enabled = true;
                chkAutoAssign.Checked = false;
                chkAssignIssue.Enabled = true;
                chkAssignIssue.Checked = false;
                chkCloseIssue.Enabled = true;
                chkCloseIssue.Checked = false;
                chkAddAttachment.Enabled = true;
                chkAddAttachment.Checked = false;
                chkAddComment.Enabled = true;
                chkAddComment.Checked = false;
                chkAddIssue.Enabled = true;
                chkAddIssue.Checked = false;
                chkAddRelated.Enabled = true;
                chkAddRelated.Checked = false;
                chkAddTimeEntry.Enabled = true;
                chkAddTimeEntry.Checked = false;
                chkAssignIssue.Enabled = true;
                chkAssignIssue.Checked = false;
                chkDeleteAttachment.Enabled = true;
                chkDeleteAttachment.Checked = false;
                chkDeleteComment.Enabled = true;
                chkDeleteComment.Checked = false;
                chkDeleteIssue.Enabled = true;
                chkDeleteIssue.Checked = false;
                chkDeleteRelated.Enabled = true;
                chkDeleteRelated.Checked = false;
                chkDeleteTimeEntry.Enabled = true;
                chkDeleteTimeEntry.Checked = false;
                chkEditComment.Enabled = true;
                chkEditComment.Checked = false;
                chkEditIssue.Enabled = true;
                chkEditIssue.Checked = false;
                chkEditIssueDescription.Enabled = true;
                chkEditIssueDescription.Checked = false;
                chkEditIssueSummary.Enabled = true;
                chkEditIssueSummary.Checked = false;
                chkEditOwnComment.Enabled = true;
                chkEditOwnComment.Checked = false;
                chkEditQuery.Enabled = true;
                chkEditQuery.Checked = false;
                chkReOpenIssue.Enabled = true;
                chkReOpenIssue.Checked = false;
                chkSubscribeIssue.Enabled = true;
                chkSubscribeIssue.Checked = false;
                chkDeleteQuery.Enabled = true;
                chkDeleteQuery.Checked = false;
                chkAddQuery.Enabled = true;
                chkAddQuery.Checked = false;
                chkEditProject.Checked = false;
                chkChangeIssueStatus.Checked = false;
                chkAddParentIssue.Checked = false;
                chkDeleteSubIssue.Checked = false;
                chkDeleteParentIssue.Checked = false;
                chkEditProject.Checked = false;
                chkDeleteProject.Checked = false;
                chkCloneProject.Checked = false;
                chkCreateProject.Checked = false;
                chkViewProjectCalendar.Checked = false;
            }
            else
            {
                RoleId = roleId;
                Role r = RoleManager.GetById(roleId);

                foreach (string s in Globals.DefaultRoles)
                {
                    //if default role lock record
                    if (r.Name == s)
                    {
                        cmdDelete.Visible = false;
                        cancel.Visible = false;
                        txtRoleName.Enabled = false;
                        txtDescription.Enabled = false;
                    }
                }
                var message = string.Format(GetLocalResourceObject("ConfirmDelete").ToString(), r.Name);
                cmdDelete.OnClientClick = String.Format("return confirm('{0}');", message);
                cancel.OnClientClick = String.Format("return confirm('{0}');", message);
                AddRole.Visible = !AddRole.Visible;
                Roles.Visible = !Roles.Visible;
                cmdAddUpdateRole.Text = GetLocalResourceObject("UpdateRole").ToString();
                txtRoleName.Text = r.Name;
                txtDescription.Text = r.Description;
                chkAutoAssign.Checked = r.AutoAssign;
                RoleNameTitle.Text = string.Concat(GetLocalResourceObject("RoleNameTitle.Text"), " ", r.Name);
                ReBind();
            }
		}
		#endregion
   
        /// <summary>
        /// Handles the Click event of the AddRole control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void AddRole_Click(object sender, EventArgs e)
        {
            AddRole.Visible = !AddRole.Visible;
            Roles.Visible= !Roles.Visible;          
            txtRoleName.Visible = true;
            txtRoleName.Text = string.Empty;
            RoleNameTitle.Text = (string)GetLocalResourceObject("AddNewRole.Text");       
            cmdDelete.Visible = false;
            cancel.Visible = false;
            BindRoleDetails(-1);
        }

        /// <summary>
        /// Handles the RowCommand event of the gvUsers control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.Web.UI.WebControls.GridViewCommandEventArgs"/> instance containing the event data.</param>
        protected void gvRoles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "EditRole":
                    //get roles details and bind to form
                    BindRoleDetails(Convert.ToInt32(e.CommandArgument));
                    break;
            }
        }

        /// <summary>
        /// Updates the permissions.
        /// </summary>
        /// <param name="roleId">The role id.</param>
        private void UpdatePermissions(int roleId)
        {
            //adds
            if (chkAddIssue.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.AddIssue); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.AddIssue); }
            if (chkAddComment.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.AddComment); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.AddComment); }
            if (chkAddAttachment.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.AddAttachment); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.AddAttachment); }
            if (chkAddRelated.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.AddRelated); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.AddRelated); }
            if (chkAddTimeEntry.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.AddTimeEntry); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.AddTimeEntry); }

            if (chkAddQuery.Checked) RoleManager.AddPermission(roleId, (int)Globals.Permission.AddQuery); else RoleManager.DeletePermission(roleId, (int)Globals.Permission.AddQuery);
            if (chkAddSubIssue.Checked) RoleManager.AddPermission(roleId, (int)Globals.Permission.AddSubIssue); else RoleManager.DeletePermission(roleId,(int)Globals.Permission.AddSubIssue);
            if (chkAddParentIssue.Checked) RoleManager.AddPermission(roleId, (int)Globals.Permission.AddParentIssue); else RoleManager.DeletePermission(roleId, (int)Globals.Permission.AddParentIssue);

            //edits
            if (chkEditProject.Checked) RoleManager.AddPermission(roleId, (int)Globals.Permission.AdminEditProject); else RoleManager.DeletePermission(roleId, (int)Globals.Permission.AdminEditProject);
            if (chkDeleteProject.Checked) RoleManager.AddPermission(roleId, (int)Globals.Permission.AdminDeleteProject); else RoleManager.DeletePermission(roleId, (int)Globals.Permission.AdminDeleteProject);
            if (chkCloneProject.Checked) RoleManager.AddPermission(roleId, (int)Globals.Permission.AdminCloneProject); else RoleManager.DeletePermission(roleId, (int)Globals.Permission.AdminCloneProject);
            if (chkCreateProject.Checked) RoleManager.AddPermission(roleId, (int)Globals.Permission.AdminCreateProject); else RoleManager.DeletePermission(roleId, (int)Globals.Permission.AdminCreateProject);
            if (chkViewProjectCalendar.Checked) RoleManager.AddPermission(roleId, (int)Globals.Permission.ViewProjectCalendar); else RoleManager.DeletePermission(roleId, (int)Globals.Permission.ViewProjectCalendar);
            if (chkChangeIssueStatus.Checked) RoleManager.AddPermission(roleId, (int)Globals.Permission.ChangeIssueStatus); else RoleManager.DeletePermission(roleId, (int)Globals.Permission.ChangeIssueStatus);
            if (chkEditQuery.Checked) RoleManager.AddPermission(roleId, (int)Globals.Permission.EditQuery); else RoleManager.DeletePermission(roleId, (int)Globals.Permission.EditQuery);

            if (chkEditIssue.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.EditIssue); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.EditIssue); }
            if (chkEditComment.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.EditComment); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.EditComment); }
            if (chkEditOwnComment.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.OwnerEditComment); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.OwnerEditComment); }
            if (chkEditIssueDescription.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.EditIssueDescription); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.EditIssueDescription); }
            if (chkEditIssueSummary.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.EditIssueTitle); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.EditIssueTitle); }

            //deletes
            if (chkDeleteIssue.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.DeleteIssue); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.DeleteIssue); }
            if (chkDeleteComment.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.DeleteComment); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.DeleteComment); }
            if (chkDeleteAttachment.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.DeleteAttachment); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.DeleteAttachment); }
            if (chkDeleteRelated.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.DeleteRelated); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.DeleteRelated); }

            if (chkDeleteQuery.Checked) RoleManager.AddPermission(roleId, (int)Globals.Permission.DeleteQuery); else RoleManager.DeletePermission(roleId, (int)Globals.Permission.DeleteQuery);
            if (chkDeleteParentIssue.Checked) RoleManager.AddPermission(roleId, (int)Globals.Permission.DeleteParentIssue); else RoleManager.DeletePermission(roleId, (int)Globals.Permission.DeleteParentIssue);
            if (chkDeleteSubIssue.Checked) RoleManager.AddPermission(roleId, (int)Globals.Permission.DeleteSubIssue); else RoleManager.DeletePermission(roleId, (int)Globals.Permission.DeleteSubIssue);


            //misc
            if (chkAssignIssue.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.AssignIssue); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.AssignIssue); }
            if (chkSubscribeIssue.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.SubscribeIssue); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.SubscribeIssue); }

            if (chkReOpenIssue.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.ReopenIssue); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.ReopenIssue); }
            
            if (chkCloseIssue.Checked) RoleManager.AddPermission(roleId, (int)Globals.Permission.CloseIssue); else RoleManager.DeletePermission(roleId, (int)Globals.Permission.CloseIssue); 

            if (chkDeleteTimeEntry.Checked)
            { RoleManager.AddPermission(roleId, (int)Globals.Permission.DeleteTimeEntry); }
            else
            { RoleManager.DeletePermission(roleId, (int)Globals.Permission.DeleteTimeEntry); }
        }

        /// <summary>
        /// Rebinds the permission checkboxes.
        /// </summary>
        private void ReBind()
        {
            chkChangeIssueStatus.Checked = false;
            chkAssignIssue.Checked = false;
            chkCloseIssue.Checked = false;
            chkAddAttachment.Checked = false;
            chkAddComment.Checked = false;
            chkAddIssue.Checked = false;
            chkAddRelated.Checked = false;
            chkAddTimeEntry.Checked = false;            
            chkDeleteAttachment.Checked = false;
            chkDeleteComment.Checked = false;
            chkDeleteIssue.Checked = false;
            chkDeleteRelated.Checked = false;
            chkDeleteTimeEntry.Checked = false;
            chkEditComment.Checked = false;
            chkEditIssue.Checked = false;
            chkEditIssueDescription.Checked = false;
            chkEditIssueSummary.Checked = false;
            chkEditOwnComment.Checked = false;
            chkReOpenIssue.Checked = false;
            chkSubscribeIssue.Checked = false;
            chkAddQuery.Checked = false;
            chkDeleteQuery.Checked = false;
            chkEditProject.Checked = false;
            chkChangeIssueStatus.Checked = false;
            chkAddParentIssue.Checked = false;
            chkDeleteSubIssue.Checked = false;
            chkDeleteParentIssue.Checked = false;
            chkEditProject.Checked = false;
            chkDeleteProject.Checked = false;
            chkCloneProject.Checked = false;
            chkCreateProject.Checked = false;
            chkViewProjectCalendar.Checked = false;

            var permissions = RoleManager.GetPermissionsById(RoleId);

            foreach (var permission in permissions.Select(p => p.Key.ToEnum<Globals.Permission>()))
            {
                switch (permission)
                {
                    case Globals.Permission.None:
                        break;
                    case Globals.Permission.CloseIssue:
                        chkCloseIssue.Checked = true;
                        break;
                    case Globals.Permission.AddIssue:
                        chkAddIssue.Checked = true;
                        break;
                    case Globals.Permission.AssignIssue:
                        chkAssignIssue.Checked = true;
                        break;
                    case Globals.Permission.EditIssue:
                        chkEditIssue.Checked = true;
                        break;
                    case Globals.Permission.SubscribeIssue:
                        chkSubscribeIssue.Checked = true;
                        break;
                    case Globals.Permission.DeleteIssue:
                        chkDeleteIssue.Checked = true;
                        break;
                    case Globals.Permission.AddComment:
                        chkAddComment.Checked = true;
                        break;
                    case Globals.Permission.EditComment:
                        chkEditComment.Checked = true;
                        break;
                    case Globals.Permission.DeleteComment:
                        chkDeleteComment.Checked = true;
                        break;
                    case Globals.Permission.AddAttachment:
                        chkAddAttachment.Checked = true;
                        break;
                    case Globals.Permission.DeleteAttachment:
                        chkDeleteAttachment.Checked = true;
                        break;
                    case Globals.Permission.AddRelated:
                        chkAddRelated.Checked = true;
                        break;
                    case Globals.Permission.DeleteRelated:
                        chkDeleteRelated.Checked = true;
                        break;
                    case Globals.Permission.ReopenIssue:
                        chkReOpenIssue.Checked = true;
                        break;
                    case Globals.Permission.OwnerEditComment:
                        chkEditOwnComment.Checked = true;
                        break;
                    case Globals.Permission.EditIssueDescription:
                        chkEditIssueDescription.Checked = true;
                        break;
                    case Globals.Permission.EditIssueTitle:
                        chkEditIssueSummary.Checked = true;
                        break;
                    case Globals.Permission.AdminEditProject:
                        chkEditProject.Checked = true;
                        break;
                    case Globals.Permission.AddTimeEntry:
                        chkAddTimeEntry.Checked = true;
                        break;
                    case Globals.Permission.DeleteTimeEntry:
                        chkDeleteTimeEntry.Checked = true;
                        break;
                    case Globals.Permission.AdminCreateProject:
                        chkCreateProject.Checked = true;
                        break;
                    case Globals.Permission.AddQuery:
                        chkAddQuery.Checked = true;
                        break;
                    case Globals.Permission.DeleteQuery:
                        chkDeleteQuery.Checked = true;
                        break;
                    case Globals.Permission.AdminCloneProject:
                        chkCloneProject.Checked = true;
                        break;
                    case Globals.Permission.AddSubIssue:
                        chkAddSubIssue.Checked = true;
                        break;
                    case Globals.Permission.DeleteSubIssue:
                        chkDeleteSubIssue.Checked = true;
                        break;
                    case Globals.Permission.AddParentIssue:
                        chkAddParentIssue.Checked = true;
                        break;
                    case Globals.Permission.DeleteParentIssue:
                        chkDeleteParentIssue.Checked = true;
                        break;
                    case Globals.Permission.AdminDeleteProject:
                        chkDeleteProject.Checked = true;
                        break;
                    case Globals.Permission.ViewProjectCalendar:
                        chkViewProjectCalendar.Checked = true;
                        break;
                    case Globals.Permission.ChangeIssueStatus:
                        chkChangeIssueStatus.Checked = true;
                        break;
                    case Globals.Permission.EditQuery:
                        chkEditQuery.Checked = true;
                        break;
                    default:
                        throw new ArgumentOutOfRangeException();
                }
            }
        }
        /// <summary>
        /// Handles the Click event of the cmdCancel control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            AddRole.Visible = !AddRole.Visible;
            Roles.Visible = !Roles.Visible;
            RoleId = -1;
        }

        /// <summary>
        /// Handles the Click event of the cmdDelete control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            try
            {
                RoleManager.Delete(RoleId);
                AddRole.Visible = !AddRole.Visible;
                Roles.Visible = !Roles.Visible;
                Initialize();
            }
            catch
            {
                lblError.Text = LoggingManager.GetErrorMessageResource("DeleteRoleError"); 
            }
        }
	}
}
