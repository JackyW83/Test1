<%@ Control Language="c#" Inherits="BugNET.UserControls.PickMilestone" Codebehind="PickMilestone.ascx.cs" %>
<asp:DropDownList id="ddlMilestone" runat="Server" />
<asp:RequiredFieldValidator id="reqVal" Display="Dynamic" Visible="False" 
    ControlToValidate="ddlMilestone" InitialValue="-1" Text="(required)"
	Runat="Server" meta:resourcekey="reqVal"  CssClass="req"></asp:RequiredFieldValidator>
