﻿using System;
using System.Collections.Generic;
using BugNET.BLL;
using BugNET.Common;
using BugNET.Entities;
using BugNET.UserInterfaceLayer;

namespace BugNET.Issues.UserControls
{
    public partial class Revisions : System.Web.UI.UserControl, IIssueTab
    {
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region IIssueTab Members

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
            //IssueRevisionsDataGrid.Columns[0].HeaderText = GetLocalResourceObject("IssueRevisionsDataGrid.RevisionHeader.Text").ToString();
            //IssueRevisionsDataGrid.Columns[1].HeaderText = GetLocalResourceObject("IssueRevisionsDataGrid.AuthorHeader.Text").ToString();
            //IssueRevisionsDataGrid.Columns[2].HeaderText = GetLocalResourceObject("IssueRevisionsDataGrid.RevisionDateHeader.Text").ToString();
            //IssueRevisionsDataGrid.Columns[3].HeaderText = GetLocalResourceObject("IssueRevisionsDataGrid.RepositoryHeader.Text").ToString();
            //IssueRevisionsDataGrid.Columns[4].HeaderText = GetLocalResourceObject("IssueRevisionsDataGrid.MessageHeader.Text").ToString();

            BindIssueRevisions();
        }

        #endregion

        private void BindIssueRevisions()
        {
            List<IssueRevision> revisions = IssueRevisionManager.GetByIssueId(IssueId);
            if (revisions.Count == 0)
            {
                IssueRevisionsLabel.Text = GetLocalResourceObject("NoRevisions").ToString();
                IssueRevisionsLabel.Visible = true;
                IssueRevisionsDataGrid.Visible = false;
            }
            else
            {
                IssueRevisionsDataGrid.DataSource = revisions;
                IssueRevisionsDataGrid.DataKeyField = "IssueId";
                IssueRevisionsDataGrid.DataBind();
                IssueRevisionsLabel.Visible = false;
                IssueRevisionsDataGrid.Visible = true;
            }
        }
    }
}