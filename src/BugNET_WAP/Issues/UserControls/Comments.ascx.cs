using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using BugNET.BLL;
using BugNET.Common;
using BugNET.Entities;
using BugNET.UserInterfaceLayer;
using System.Web.Security;

namespace BugNET.Issues.UserControls
{
    /// <summary>
    ///		Summary description for Comments.
    /// </summary>
    public partial class Comments : UserControl, IIssueTab
    {
        private Guid _issueOwnerUserId;

        /// <summary>
        /// Gets or sets the issue id.
        /// </summary>
        /// <value>The issue id.</value>
        public int IssueId
        {
            get { return ViewState.Get("IssueId", 0); }
            set { ViewState.Set("IssueId", value); }
        }

        /// <summary>
        /// Gets or sets the project id.
        /// </summary>
        /// <value>The project id.</value>
        public int ProjectId
        {
            get { return ViewState.Get("ProjectId", 0); }
            set { ViewState.Set("ProjectId", value); }
        }

        /// <summary>
        /// Initializes this instance.
        /// </summary>
        public void Initialize()
        {

            BindComments();

            //check users role permission for adding a comment
            if (!Page.User.Identity.IsAuthenticated || !UserManager.HasPermission(ProjectId, Globals.Permission.AddComment.ToString()))
                pnlAddComment.Visible = false;
        }

        /// <summary>
        /// Binds the comments.
        /// </summary>
        private void BindComments()
        {
            IList comments = IssueCommentManager.GetByIssueId(IssueId);

            if (comments.Count == 0)
            {
                lblComments.Text = GetLocalResourceObject("NoComments").ToString();
                lblComments.Visible = true;
                rptComments.Visible = false;
            }
            else
            {
                _issueOwnerUserId = IssueManager.GetById(IssueId).OwnerUserId;
                lblComments.Visible = false;

                rptComments.DataSource = comments;
                rptComments.DataBind();
                rptComments.Visible = true;
            }
        }

        /// <summary>
        /// Handles the ItemDataBound event of the rptComments control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.Web.UI.WebControls.RepeaterItemEventArgs"/> instance containing the event data.</param>
        protected void rptComments_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem) return;

            var currentComment = (IssueComment)e.Item.DataItem;

            if (currentComment.CreatorUserId == _issueOwnerUserId)
                ((HtmlControl)e.Item.FindControl("CommentArea")).Attributes["class"] = "commentContainerOwner";

            // The edit panel is default not shown.
            var pnlEditComment = e.Item.FindControl("pnlEditComment") as Panel;

            if (pnlEditComment != null) pnlEditComment.Visible = false;

            var creatorDisplayName = (Label)e.Item.FindControl("CreatorDisplayName");
            creatorDisplayName.Text = UserManager.GetUserDisplayName(currentComment.CreatorUserName);

            var lblDateCreated = (Label)e.Item.FindControl("lblDateCreated");
            lblDateCreated.Text = currentComment.DateCreated.ToString("f");

            var ltlComment = (Literal)e.Item.FindControl("ltlComment");

            // WARNING: Do not decode the text from the HTML control (which supplied the comment),
            // as this was encoded already.
            //
            // However it is still possible to edit the raw contents of the htmlcontrol
            // using hacked client side javascript or using a httprequest editor 
            // and poison the system that way! Does viewstate protect this in any way??

            ltlComment.Text = currentComment.Comment;


            var avatar = (Image)e.Item.FindControl("Avatar");

            if (HostSettingManager.Get(HostSettingNames.EnableGravatar, true))
            {
                var user = Membership.GetUser(currentComment.CreatorUserName);
                if (user != null) avatar.Attributes.Add("src", GetGravatarImageUrl(user.Email, 35));
            }
            else
            {
                avatar.Attributes.Add("src", Page.ResolveUrl("~/images/noprofile.png"));
                avatar.Style.Add("height", "35px");
                avatar.Style.Add("width", "35px");
            }

            var hlPermaLink = (HyperLink)e.Item.FindControl("hlPermalink");
            hlPermaLink.NavigateUrl = String.Format("{0}#{1}", HttpContext.Current.Request.Url, currentComment.Id);


            var cmdEditComment = e.Item.FindControl("cmdEditComment") as ImageButton;

            // Check if the current user is Authenticated and has permission to edit a comment.
            if (cmdEditComment != null)
            {
                cmdEditComment.Visible = false;

                // Check if the current user is Authenticated and has permission to edit a comment.//If user can edit comments
                if (Page.User.Identity.IsAuthenticated && UserManager.HasPermission(ProjectId, Globals.Permission.EditComment.ToString()))
                    cmdEditComment.Visible = true;
                    // Check if the project admin or a super user trying to edit the comment.
                else if ((Page.User.Identity.IsAuthenticated && UserManager.IsInRole(Globals.SUPER_USER_ROLE)) || (Page.User.Identity.IsAuthenticated && UserManager.IsInRole(this.ProjectId, Globals.ProjectAdminRole)))
                    cmdEditComment.Visible = true;
                    // Check if it is the original user, the project admin or a super user trying to edit the comment.
                else if (currentComment.CreatorUserName.ToLower() == Context.User.Identity.Name.ToLower() && UserManager.HasPermission(ProjectId, Globals.Permission.OwnerEditComment.ToString()))
                    cmdEditComment.Visible = true;
            }

            var cmdDeleteComment = e.Item.FindControl("cmdDeleteComment") as ImageButton;

            // Check if the current user is Authenticated and has the permission to delete a comment			
            if (!Page.User.Identity.IsAuthenticated || !UserManager.HasPermission(ProjectId, Globals.Permission.DeleteComment.ToString())) return;

            if (cmdDeleteComment == null) return;

            cmdDeleteComment.Attributes.Add("onclick", string.Format("return confirm('{0}');", GetLocalResourceObject("DeleteComment")));
            cmdDeleteComment.Visible = false;

            // Check if it is the original user, the project admin or a super user trying to delete the comment.
            if (currentComment.CreatorUserName.ToLower() == Context.User.Identity.Name.ToLower() || UserManager.IsInRole(Globals.SUPER_USER_ROLE) || UserManager.IsInRole(ProjectId, Globals.ProjectAdminRole))
            {
                cmdDeleteComment.Visible = true;
            }
        }

        /// <summary>
        /// Gets the gravatar image URL.
        /// </summary>
        /// <param name="emailId">The email id.</param>
        /// <param name="imgSize">Size of the img.</param>
        /// <returns></returns>
        private static string GetGravatarImageUrl(string emailId, int imgSize)
        {
            // Convert emailID to lower-case
            emailId = emailId.ToLower();

            var hash = FormsAuthentication.HashPasswordForStoringInConfigFile(emailId, "MD5").ToLower();

            // build Gravatar Image URL
            var imageUrl = string.Format("http://www.gravatar.com/avatar/{0}?s={1}&d=mm&r=g", hash, imgSize);

            return imageUrl;
        }

        /// <summary>
        /// Handles the ItemCommand event of the rptComments control.
        /// </summary>
        /// <param name="source">The source of the event.</param>
        /// <param name="e">The <see cref="System.Web.UI.WebControls.RepeaterCommandEventArgs"/> instance containing the event data.</param>
        protected void RptCommentsItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var pnlEditComment = e.Item.FindControl("pnlEditComment") as Panel;
            var pnlComment = e.Item.FindControl("pnlComment") as Panel;

            if (pnlEditComment == null) return;
            if (pnlComment == null) return;

            BugNET.UserControls.HtmlEditor editor;
            HiddenField commentNumber;
            IssueComment comment;

            switch (e.CommandName)
            {
                case "Save":
                    editor = pnlEditComment.FindControl("EditCommentHtmlEditor") as BugNET.UserControls.HtmlEditor;
                    if (editor != null)
                    {
                        if (editor.Text.Trim().Length == 0) return;

                        commentNumber = (HiddenField)pnlEditComment.FindControl("commentNumber");
                        var commentId = Convert.ToInt32(commentNumber.Value);

                        comment = IssueCommentManager.GetById(Convert.ToInt32(commentId));
                        comment.Comment = editor.Text.Trim();
                        IssueCommentManager.SaveOrUpdate(comment);

                        editor.Text = String.Empty;
                        commentNumber.Value = String.Empty;
                    }

                    pnlEditComment.Visible = false;
                    pnlComment.Visible = true;
                    pnlAddComment.Visible = true;

                    BindComments();
                    break;
                case"Cancel":
                    pnlEditComment.Visible = false;
                    pnlComment.Visible = true;
                    pnlAddComment.Visible = true;
                    BindComments();
                    break;
                case "Delete":
                    IssueCommentManager.Delete(Convert.ToInt32(e.CommandArgument));
                    BindComments();
                    break;
                case "Edit":
                    comment = IssueCommentManager.GetById(Convert.ToInt32(e.CommandArgument));

                    // Show the edit comment panel for the comment
                    pnlAddComment.Visible = false;
                    pnlEditComment.Visible = true;
                    pnlComment.Visible = false;

                    // Insert the existing comment text in the edit control.
                    editor = pnlEditComment.FindControl("EditCommentHtmlEditor") as BugNET.UserControls.HtmlEditor;
                    if (editor != null) editor.Text = comment.Comment;

                    // Save the comment ID for further editting.
                    commentNumber = (HiddenField)e.Item.FindControl("commentNumber");
                    if (commentNumber != null) commentNumber.Value = (string)e.CommandArgument;
                    break;
            }
        }

        /// <summary>
        /// Handles the Click event of the cmdAddComment control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void CmdAddCommentClick(object sender, EventArgs e)
        {
            if (CommentHtmlEditor.Text.Trim().Length == 0) return;

            var comment = new IssueComment
                              {
                                  IssueId = IssueId,
                                  Comment = CommentHtmlEditor.Text.Trim(),
                                  CreatorUserName = Security.GetUserName(),
                                  DateCreated = DateTime.Now
                              };

            IssueCommentManager.SaveOrUpdate(comment);
            CommentHtmlEditor.Text = String.Empty;
            BindComments();
        }
    }
}
