﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/SingleColumn.master" AutoEventWireup="true" CodeBehind="AccessDenied.aspx.cs" Inherits="BugNET.Errors.AccessDenied" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h1><asp:literal ID="litTitle" runat="server" Text="<%$ Resources:AccessDenied %>"></asp:literal></h1>
    <p style="margin-top:1em"><asp:Label id="Label1" runat="server" Text="<%$ Resources:Message %>" /></p> 
    <p style="margin-top:1em"><asp:Label id="Label2" runat="server" /></p>
</asp:Content>
