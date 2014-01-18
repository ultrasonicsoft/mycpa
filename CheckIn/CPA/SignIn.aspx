
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SignIn.aspx.cs" Inherits="CheckIn.Web_Pages.SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%">
        <tr>
            <td width="60%">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/CompanyLogo.jpg" 
                    Height="48px" Width="120px"/>
            </td>
            <td align="left">
                <table style="background-color: #e6e6f5" width="100%" CellPadding-left="10">
                    <tr >
                        <td style="padding-left:20px;">
                            <asp:Label ID="Label1" runat="server" Text="Sign In" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                     <tr>
                         <td style="padding-left:20px;">
                            <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:20px;">
                            <asp:TextBox ID="txtEmail" Width="80%"  runat="server" ></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="Email can not be empty" ControlToValidate="txtEmail" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid Email Address "
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                              
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:20px;">
                            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:20px;">
                            <asp:TextBox ID="txtPassword" TextMode="Password"  Width="80%" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="Password can not be empty" ControlToValidate="txtPassword" 
                                ForeColor="Red"></asp:RequiredFieldValidator >
                        </td>
                    </tr>
                      <tr>
                       <td style="padding-left:20px;">
                            <asp:Label ID="Label4" runat="server" Text="Forgot your password?"></asp:Label>
                        </td>
                    </tr>
                    <tr><td>
                        <asp:CustomValidator ID="loginValidation" runat="server" 
                             ForeColor="Red"  ErrorMessage="Login failed. Please check your username and password." ValidationGroup="loginControl" Visible="false"></asp:CustomValidator>
                             <asp:ValidationSummary id="ValidationSummary" 
                            ValidationGroup="loginControl" runat="server" DisplayMode="BulletList" 
                            CssClass="validationSummary"  
                            ForeColor="Red"></asp:ValidationSummary>
                        <br /></td></tr>                    
                    <tr >
                         <td style="padding-left:20px;">
                            <asp:Button ID="btnSignIn" runat="server" Text="Sign In" 
                                 onclick="btnSignIn_Click" />
                         </td>
                    </tr>
                    <tr><td><br /></td></tr>
                </table>

            </td>
        </tr>
    </table>
</asp:Content>
