<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="CheckIn.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%">
                <tr valign="middle">
                    <td colspan="4" align="center" >
                        <asp:Image ID="Image1" runat="server" Height="50px" Width="85px" 
                            ImageUrl="~/Images/CompanyLogo.jpg" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr >
                    <td align="right" width="50%">
                    <%--    <asp:DropDownList ID="ddlSpeciality" runat="server" Width="40%">
                        </asp:DropDownList>--%>
                          <%--<input type="text" id="txtCity" runat="server" value="Enter City" onclick="if (this.value == 'Enter City') { this.value = '' }" 
                            onblur="if(this.value==''){this.value='Enter City'}">
                    </td width="50%">--%>

                         <asp:DropDownList ID="ddlState" runat="server" Width="40%" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AutoPostBack="true" AppendDataBoundItems="True">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlCity" runat="server" Width="40%" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" AutoPostBack="true" AppendDataBoundItems="True" 
                            >
                        </asp:DropDownList>
                          

                    </td width="50%">
                    <td width="20">OR\AND</td>
                    <td>
                        <%--<asp:TextBox ID="txtZipCode" runat="server" Width="40%" Text="Enter Zip Code\City" 
                            onclick="if(this.value=='Enter Zip Code\City'){this.value=''}"
                            onblur="if(this.value==''){this.value='Enter Zip Code\City'}" Visible="false"></asp:TextBox>--%>

                        <input type="text" id="txtZipCode" runat="server" value="Enter Zip Code" onclick="if (this.value == 'Enter Zip Code') { this.value = '' }" 
                            onblur="if(this.value==''){this.value='Enter Zip Code'}">
                        <asp:CustomValidator ID="CustomValidator1" ForeColor="Red" runat="server" ErrorMessage="Enter correct Zip Code" ControlToValidate="txtZipCode" ></asp:CustomValidator>
                     
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <asp:Button ID="btnSearchCPA" runat="server" Text="Search CPA" 
                            onclick="btnSearchCPA_Click" />
                              <%--<asp:Button ID="Button1" runat="server" Text="Calendar" onclick="Button1_Click" 
                            />--%>
                             <%--<asp:Button ID="Button2" runat="server" Text="Appointments" onclick="Button2_Click" 
                            />
                    </td>--%>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
