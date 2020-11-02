<%@ Page Title="Add New User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="newUser.aspx.cs" Inherits="REST.newUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <asp:Panel ID="pnlErrorsOrWarnings" runat="server" Visible="False" BorderWidth="2" BorderStyle="Double" BorderColor="Red" BackColor="#FFCC99">
     <asp:Label ID="lblErrorsOrWarnings" runat="server" Text="" Font-Bold="True"></asp:Label></asp:Panel>
 <asp:Panel ID="pnlSuccessMessages" runat="server" Visible="False" BorderWidth="1" BorderStyle="Dotted" BorderColor="#0000CC" BackColor="#99FFCC">
     <asp:Label ID="lblSuccessMessages" runat="server" Text="" Font-Bold="True"></asp:Label></asp:Panel>
 <div class="row row-no-gutters">
  <div class="col-md-6">
      <p>PlaceHolder for instructions:</p>
      <p>To change user data send e-mail to postmaster@agenda.pub</p>
      <p>This is the minimum amount of information the system needs. If you click "Add User" you agree that Agenda.pub can keep this information until you explicitly manifest your interest in having your data removed, by contacting us directly on or e-mail.<br /> Be aware that this is not a imediate procedure and may take time depending on the amount of data you inserted.</p>
  </div>
  <div class="col-md-6" id="dvForm">
      <asp:Label ID="lblTitle" runat="server" Text="New User"></asp:Label>
      <div class="row row-no-gutters">
        <div class="col-md-6 col-xs-6">
            <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label></div>
        <div class="col-md-6 col-xs-6">
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox></div>
      </div>
      <div class="row row-no-gutters">
        <div class="col-md-6 col-xs-6">
            <asp:Label ID="lblEmail" runat="server" Text="E-mail"></asp:Label><br /><small><asp:Label ID="lblEmailHint" runat="server" Text="Used to Login"></asp:Label></small></div>
        <div class="col-md-6 col-xs-6">
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox></div>
      </div>
      <div class="row row-no-gutters">
        <div class="col-md-6 col-xs-6">
            <asp:Label ID="lblMobile" runat="server" Text="Mobile Number:"></asp:Label></div>
        <div class="col-md-6 col-xs-6">
            <asp:TextBox ID="txtMobile" runat="server" TextMode="Phone"></asp:TextBox></div>
      </div>
      <div class="row row-no-gutters">
        <div class="col-md-6 col-xs-6">
            <asp:Label ID="lblComments" runat="server" Text="Comments: "></asp:Label></div>
        <div class="col-md-6 col-xs-6">
            <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine"></asp:TextBox></div>
      </div>
      <div class="row row-no-gutters">
        <div class="col-md-6 col-xs-6">
            <asp:Label ID="lblPassword" runat="server" Text="Desired Password!"></asp:Label></div>
        <div class="col-md-6 col-xs-6">
            <input id="txtAccess" type="password" onfocusout="leavePass()"/>
        </div>
      </div>
      <div class="row row-no-gutters">
        <div class="col-md-6 col-xs-6">
            <asp:Label ID="lblVerifyPassword" runat="server" Text="Verify Password"></asp:Label></div>
        <div class="col-md-6 col-xs-6">
            <input id="txtVerification" type="password" onfocusout="validatePassword()"/>
        </div>
      </div>
      <div class="row row-no-gutters">
        <div class="col-md-6 col-xs-6"><center><asp:Button ID="btnSave" runat="server" Text="Add User" Enabled="False" OnClick="btnSave_Click"></asp:Button></center></div>
        <div class="col-md-6 col-xs-6"><center><asp:Button ID="btnCancel" runat="server" Text="Scrap and Return" OnClick="btnCancel_Click"></asp:Button></center></div>
      </div>

  </div>
</div>
    <div class="hidden" id="dvControl">        
        <asp:TextBox ID="txtHash" runat="server" CssClass="hidden"></asp:TextBox>
    </div>
</asp:Content>
