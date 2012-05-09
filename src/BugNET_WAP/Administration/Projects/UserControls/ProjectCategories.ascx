﻿<%@ Control Language="c#" Inherits="BugNET.Administration.Projects.UserControls.ProjectCategories" Codebehind="ProjectCategories.ascx.cs" AutoEventWireup="True" %>
<%@ Register TagPrefix="it" TagName="PickCategory" Src="~/UserControls/PickCategory.ascx" %>

<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    <Scripts>
        <asp:ScriptReference Path="~/js/jquery.jstree.js" />
        <asp:ScriptReference Path="~/js/jquery.cookie.js" />
    </Scripts>
</asp:ScriptManagerProxy>
<script type="text/javascript">
    $(function () {
        var projectId = { 'projectId': '<%=ProjectId%>' };
        $("#divJsTree")
//			.bind("loaded.jstree", function (event, data) {
//			    alert("TREE IS LOADED");
//			})
            .bind("dblclick.jstree", function (e, data) { 
                $("#divJsTree").jstree("rename"); 
            })
            .bind("move_node.jstree",function (e, data) {
			     //listkeys(data.rslt); 
                 if(data.rslt.np != undefined && data.rslt.o != undefined)
                 {
                    var currentNodeId = data.rslt.o.attr('id');
                    
                    var newParentNodeId = data.rslt.np.attr('id') == 'divJsTree' ? 0 : data.rslt.np.attr('id');
                   
                    BugNET.Webservices.BugNetServices.MoveCategory(currentNodeId,0,newParentNodeId, SucceededCallback, OnError);
                 }
            })
            .bind("rename_node.jstree",function (e, data) {
                //listkeys(data.rslt.obj);
			    var currentNodeId = data.rslt.obj.attr('id');
                var name = data.rslt.name;
                BugNET.Webservices.BugNetServices.RenameCategory(currentNodeId,name, SucceededCallback, OnError);
            })	
			.bind("reselect.jstree", function (event, data) {
			    $("#divJsTree").jstree("open_all");
			})
			.bind("create.jstree", function (e, data) {
                //listkeys(data.rslt); 
			    var node = data.rslt;              
			    var name = node.name;
			    var id = node.id;
			    var parentNode = data.inst._get_parent(data.rslt.obj);
			    if (parentNode) {
			        var parentNodeId = parentNode == -1 ? 0 : parentNode.attr('id');
                     //add the new node
			        BugNET.Webservices.BugNetServices.AddCategory(<%=ProjectId %>,name,parentNodeId,function(result){
			        	node.id = result; 
			        }, OnError);   
			    }		   
			})
			.bind("select_node.jstree", function (e, data) {
                $('#HiddenField1').val(data.rslt.obj.attr('id'));
			    //alert(data.rslt.obj.attr('id')); 
                //alert($('#HiddenField1').val());
			})
			.jstree({
			    "plugins": ["themes", "json_data", "dnd", "crrm", "ui"],
			    "json_data": {
			        "ajax": {
                        "type": "POST",
			            "data": JSON.stringify(projectId),
			            "contentType": "application/json; charset=utf-8",
			            "dataType": "json",
			            "url": '<%=ResolveUrl("~/WebServices/BugNetServices.asmx/GetCategories")%>',
			            "success": function (retval) {
			                if (retval.hasOwnProperty('d')) {
			                    return (eval(retval.d));
			                }
			                return retval;
			            }
			        }
			    }
			});
        $("#AddNewCategory").click(function () {
            $("#divJsTree").jstree("create");  
        });
        $("#DeleteCategory").click(function () { 
            var node = $("#divJsTree").jstree('get_selected');
           if(node.find("> ul > li").length > 0){
                return alert('You must delete all child categories of this parent first.');
           }
           $find('DeleteCategoryMP').show();
		   //$("#divJsTree").jstree("remove"); 
	    });

        //test method to iterate object
        listkeys = function(obj) { 
            var str = ''; 
            for(j in obj) { 
                str += typeof(obj[j]) + ' : ' + j + '\n'; 
            } 
            alert(str); 
        } 

    });
    // This is the callback function that
	// processes the Web Service return value.
	function SucceededCallback(result){
		return;
	}
	function OnError(result){
		alert("Error: " + result.get_message());
	}   
    function onOk(sender,e){
		 var selectedNode = tree.getSelectionModel().getSelectedNode();       
        document.getElementById('<%=HiddenField1.ClientID %>').value = selectedNode.id;
        $("#divJsTree").jstree('refresh', -1);
	}
</script>
 <div>
	<asp:ValidationSummary ID="ValidationSummary1" runat="server"  DisplayMode="BulletList"   HeaderText="<%$ Resources:SharedResources, ValidationSummaryHeaderText %>" CssClass="validationSummary" />
	<h2><asp:literal ID="CategoriesTitle" runat="Server" meta:resourcekey="CategoriesTitle" /></h2>
	<br />
	<asp:CustomValidator  Display="dynamic" meta:resourcekey="CategoryValidator" Runat="server" OnServerValidate="CategoryValidation_Validate" id="ComponentValidation" />
	<p>
		<asp:label ID="DescriptionLabel" runat="server" meta:resourcekey="DescriptionLabel" />
	</p>
	 <BN:Message ID="Message1" runat="server" /> 
	 <br />
	 <img alt="Add Category" type="image" src="../../images/plugin_add.gif" class="icon" />
	 <a href="#" id="AddNewCategory">Add Category</a>
	 &nbsp;
	 <asp:LinkButton ID="LinkButton1" runat="server" Text="Not Used" style="display:none;" ></asp:LinkButton>
	 <img alt="Delete Category" type="image" src="../../images/plugin_delete.gif" class="icon" />
	 <a href="#" id="DeleteCategory" >Delete Category</a>
	 <br />
	 <br />
	<div id="divJsTree"></div>
	<asp:HiddenField ID="HiddenField1" ClientIDMode="Static" runat="server" />
</div>
<asp:Panel ID="pnlDeleteCategory" runat="server" CssClass="ModalPopup" Style="display: none;">
    <asp:Panel ID="pnlHeader" runat="server" CssClass="ModalHeader">
        Delete Category</asp:Panel>
    <div class="ModalContainer">
        Please select between the following options:
        <br />
        <br />
        <table cellspacing="10" style="margin-left: 10px; text-align: left;">
            <tr>
                <td>
                    <asp:RadioButton ID="RadioButton1" GroupName="DeleteCategory" runat="server" Checked="true"
                        Height="30px" Text="&nbsp;&nbsp;Delete this category and all assigned issues." />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton ID="RadioButton2" GroupName="DeleteCategory" runat="server" Height="30px"
                        Text="&nbsp;&nbsp;Assign all issues to an existing category." />
                    <div style="margin: 0 0 0 35px;">
                        <it:PickCategory ID="DropCategory" DisplayDefault="true" Required="false" runat="Server" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton ID="RadioButton3" GroupName="DeleteCategory" runat="server" Height="30px"
                        Text="&nbsp;&nbsp;Assign all issues to a new category. " />
                    <div style="margin: 0 0 0 35px;">
                        <asp:TextBox ID="NewCategoryTextBox" runat="server" Text=""></asp:TextBox>
                    </div>
                </td>
            </tr>
        </table>
        <p style="text-align: center;">
            <asp:Button ID="OkButton" runat="server" OnClick="OkButton_Click" OnClientClick="onOk();"
                Text="Ok" />
            <asp:Button ID="CancelButton" runat="server" Text="Cancel" />
        </p>
    </div>
</asp:Panel>

<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server"  TargetControlID="LinkButton1"
    PopupControlID="pnlDeleteCategory" BackgroundCssClass="modalBackground" CancelControlID="CancelButton"
    DropShadow="false" BehaviorID="DeleteCategoryMP" PopupDragHandleControlID="pnlHeader" />
<ajaxToolkit:ConfirmButtonExtender ID="cbe" runat="server" TargetControlID="LinkButton1"
    DisplayModalPopupID="ModalPopupExtender2" />
<ajaxToolkit:TextBoxWatermarkExtender ID="TBWE2" runat="server" TargetControlID="NewCategoryTextBox"
    WatermarkText="Enter a new category" WatermarkCssClass="watermarked" />


