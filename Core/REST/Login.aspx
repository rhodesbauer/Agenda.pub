<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="REST.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:Panel ID="pnlErrorsOrWarnings" runat="server" Visible="False" BorderWidth="2" BorderStyle="Double" BorderColor="Red" BackColor="#FFCC99">
        <asp:Label ID="lblErrorsOrWarnings" runat="server" Text="" Font-Bold="True"></asp:Label>
     </asp:Panel>
     <asp:Panel ID="pnlSuccessMessages" runat="server" Visible="False" BorderWidth="1" BorderStyle="Dotted" BorderColor="#0000CC" BackColor="#99FFCC">
        <asp:Label ID="lblSuccessMessages" runat="server" Text="" Font-Bold="True"></asp:Label>
     </asp:Panel>
    <div class="row row-no-gutters">
      <div class="col-md-6">
          <p>PlaceHolder for instructions:</p> 
      </div>
      <div class="col-md-6" id="dvForm">
        
        <div class="row row-no-gutters">
            <div class="col-md-6">
                <asp:Label ID="lblEmail" runat="server" Text="User email: "></asp:Label>
            </div>
            <div class="col-md-6">
                <input id="txtUser" type="text" onfocusout="leaveEmail()"/>
            </div>
        </div> 
        
        <div class="row row-no-gutters">
            <div class="col-md-6">
                <asp:Label ID="lblAccess" runat="server" Text="User Password: "></asp:Label>
            </div>
            <div class="col-md-6">
                <input id="txtAccess" type="password" onfocusout="leavePass()"/>
            </div>
        </div>
        <div class="row row-no-gutters">
            <div class="col-md-6">
                <asp:Button ID="btnAccess" runat="server" Text="Access" OnClick="btnAccess_Click" />
            </div>
            <div class="col-md-6">
            </div>
        </div>
        <div class="row row-no-gutters">
            <div id="dvControl">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="hidden"></asp:TextBox>
                <asp:TextBox ID="txtHash" runat="server" CssClass="hidden"></asp:TextBox>
            </div>
        </div>
     </div>
   </div>
</asp:Content>
