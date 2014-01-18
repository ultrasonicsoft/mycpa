<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerifyEmail.aspx.cs" Inherits="CheckIn.VerifyMail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
   <br />
    <br />
    <br />
     <p>Thank you for registering! A confirmation email has been sent to "<%=EmailID%>" 
    
    Activation mail may land in Spam folder sometimes, so please do check Spam folder once if you could not find it in Inbox </p>
    <br />
    <br />
    Please click on the Activation Link to Activate your account

    <br />
    <br />
        
      

</asp:Content>
