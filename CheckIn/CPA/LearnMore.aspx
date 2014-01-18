<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="LearnMore.aspx.cs" Inherits="CheckIn.Web_Pages.LearnMore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%">
        <tr>
            <td>
                <asp:Image ID="Image1" runat="server" Height="50px" Width="85px" ImageUrl="~/Images/CompanyLogo.jpg" />
            </td>
            <td align="right">
                <asp:Button ID="Button1" runat="server" Text="Sign Up Now" 
                    onclick="Button1_Click" />
            </td>
        </tr>
        <tr align="center">
            <td width="60%" colspan=2>
                <asp:Label ID="Label9" runat="server" Text="How it works?" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label10" runat="server" Text="Your clients find you on our site"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Your clients book an appointment from your schedule"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Your receive the appointment details"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
