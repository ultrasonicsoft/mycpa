<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PersonalInformation.aspx.cs" Inherits="CheckIn.CPA.PersonalInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%--<style type="text/css">
        .style1
        {
             height: 154px;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
         <table width="100%" style="background-color: #e6e6f5" cellpadding="10px">
                <tr>
                    <td width="10%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/CompanyLogo.jpg" Height="40" />
                    </td>
                    <%--<td width="15%">
                        <asp:DropDownList ID="ddlSpeciality" runat="server" Width="100%">
                        </asp:DropDownList>
                    </td>
                    <td width="45%">
                        <asp:TextBox ID="txtZipCode" runat="server" Width="160px" Text="Enter Zip Code\City"></asp:TextBox>
                        &nbsp;
                        <asp:Button ID="btnRefineSearch" runat="server" Text="Refine Search" OnClick="btnRefineSearch_Click" />
                    </td>
                    <td width="25%">
                    </td>--%>
                    <td width="15%">
                       <%-- <asp:DropDownList ID="ddlSpeciality" runat="server" Width="100%">
                        </asp:DropDownList>--%>
                        <input type="text" id="txtCity" runat="server" value="Enter City" onclick="if (this.value == 'Enter City') { this.value = '' }" 
                            onblur="if(this.value==''){this.value='Enter City'}">
                    </td>
                    <td width="45%">
                       <%-- <asp:TextBox ID="txtZipCode" runat="server" Width="160px" Text="Enter Zip Code\City"></asp:TextBox>--%>
                         <input type="text" id="txtZipCode" runat="server" value="Enter Zip Code" onclick="if (this.value == 'Enter Zip Code') { this.value = '' }" 
                            onblur="if(this.value==''){this.value='Enter Zip Code'}">
                        &nbsp;
                        <asp:Button ID="btnRefineSearch" runat="server" Text="Refine Search" OnClick="btnRefineSearch_Click" />
                    </td>
                    <td width="25%">
                    </td>
                </tr>
            </table>
            <br />
            <table width="100%" style="background-color: #e6e6f5" cellpadding="8px">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="1. Select CPA Appointment"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="2. Appointment Information"></asp:Label>
                    </td>
                    <td style="background-color: #000079">
                        <asp:Label ID="Label5" runat="server" Text="3. Personal Information" Font-Bold="true"
                            ForeColor="White"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="4. Finished!"></asp:Label>
                    </td>
                </tr>
            </table>
            <table width="100%">
                <tr>
                    <td width="70%">
                        <asp:Panel ID="pnlCustomerDetails" runat="server">
                            <table cellpadding="5px" width="100%">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Who will be seeing the CPA" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCustomerName" runat="server" Text="[Customer Name]"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPhoneNumber" runat="server" Text="[Phone Number]"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnEditContact" runat="server" Text="Edit Contact Information" 
                                            onclick="btnEditContact_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       
                                        <asp:Button ID="btnBookAppointment" runat="server" Text="Book Appointment" 
                                            onclick="btnBookAppointment_Click" Width="163px" />
                                         <asp:Label ID="lblEmail" runat="server" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="pnlMaxBook" runat="server"  >

                            <table cellpadding="5px" width="100%">
                                <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                         <asp:Label ID="lblMaxAppointment" runat="server" Text="Restricted to book Maximum 5 Appointment"></asp:Label>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <asp:Button ID="BtnOK" runat="server" Text="OK" Height="23px" OnClick="BtnOK_Click" Width="75px" 
                                            />
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>
                                </table>
                        </asp:Panel>
                        <asp:Panel ID="pnlBookedAppointment" runat="server">

                            <table cellpadding="5px" width="100%" >
                                 <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                         <asp:Label ID="Label13" runat="server" 
                                             Text="This appointment has been already booked by somebody else
                                                            please select other appointment" ></asp:Label>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <asp:Button ID="btnAlreadyBook" runat="server" Text="OK" Height="23px"  Width="75px" OnClick="btnAlreadyBook_Click" 
                                            />
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>
                                </table>
                        </asp:Panel>
                        <asp:Panel ID="pnlEditCustomerDetails" runat="server" Visible="false">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtFirstName" Text="First Name" runat="server"   ></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="FirstName not Empty"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Allow Only 1-25 Alphabet " ControlToValidate="txtFirstName"
                                            ValidationExpression="^[a-zA-Z]{1,25}$"  ForeColor="Red"></asp:RegularExpressionValidator>--%>
                                        <asp:CustomValidator ID="CustValFisrtName" runat="server"  ForeColor="Red" ControlToValidate="txtFirstName"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Text="Last Name"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>

                                        <asp:TextBox ID="txtLastName" Text="Last Name" runat="server" ></asp:TextBox>
                                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="LastName Not Empty"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ValidationExpression="^[a-zA-z]{1,25}$"
                                            ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ErrorMessage="Allow Only 1-25 Alphabet" ControlToValidate="txtLastName"></asp:RegularExpressionValidator></td>--%>
                                <asp:CustomValidator ID="CustValLastName" runat="server"  ForeColor="Red" ControlToValidate="txtLastName"></asp:CustomValidator>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text="Contact Number"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                           <tr>
                                               <td align="right" >
                                                   <asp:TextBox ID="txtPhNumberPart1" Width="40" MaxLength="3" runat="server" Height="22px"></asp:TextBox>
                                                   
                                               </td>
                                               <td align="center" >
                                                   <asp:Label ID="Label12" runat="server" Text="Label" Width="40"> - </asp:Label>
                                                   <asp:TextBox ID="txtPhNumberPart2" Width="40"  MaxLength="3" runat="server">  </asp:TextBox>
                                                    <asp:Label ID="Label11" runat="server" Width="40" Text="Label"> - </asp:Label>
                                               </td>
                                               <td align="center" >
                                                   <asp:TextBox ID="txtPhNumberPart3" Width="40" MaxLength="4" runat="server"></asp:TextBox>

                                               </td>

                                           </tr> 
                                            <tr>
<%--                                                <td align="center">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPhNumberPart1" ForeColor="Red" ErrorMessage="not empty"></asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:RegularExpressionValidator ID="Regtxtph1"   runat="server"  ForeColor="Red" ErrorMessage="3 digits  start from 2" ControlToValidate="txtPhNumberPart1"
                                        ValidationExpression="^[2-9]\d{2}$"></asp:RegularExpressionValidator>

                                                </td> 
                                                 <td align="center">
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="not empty" ControlToValidate="txtPhNumberPart2" ></asp:RequiredFieldValidator>
                                                     <br />
                                                      <asp:RegularExpressionValidator ID="Regtxtph2" runat="server"  ForeColor="Red" ErrorMessage="3 digits" ControlToValidate="txtPhNumberPart2"
                                        ValidationExpression="^\d{3}$"></asp:RegularExpressionValidator> 
                                               </td>

                                               <td align="center">
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="not empty" ControlToValidate="txtPhNumberPart3"></asp:RequiredFieldValidator>
                                                   <br />
                                                        <asp:RegularExpressionValidator ID="regtxtph3" runat="server"  ForeColor="Red" ErrorMessage="4 digits" ControlToValidate="txtPhNumberPart3"
                                        ValidationExpression="^\d{4}$"></asp:RegularExpressionValidator>
                                                </td>--%>
                                               </tr>                                
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       

                                        <asp:CustomValidator ID="CustPhoneNumber" runat="server"  ForeColor="Red" ErrorMessage="All Character are digit"></asp:CustomValidator>
                                       

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnSaveContactInformation" runat="server" 
                                            Text="Save Contact Information" onclick="btnSaveContactInformation_Click" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                            onclick="btnCancel_Click" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td valign="top" > 
                        <asp:Panel ID="pnlCPADetails" runat="server">
                        <table width="100%">
                            <tr>
                                <td width="30%">
                                     <a href="CPADetailsInfo.aspx">
                                        <asp:Image ID="imgCPA" Height="150" Width="150" runat="server"></asp:Image></a>
                                </td>
                                <td class="style1">
                                    <asp:HyperLink ID="lnkCPADetail" runat="server">CPA Company Name</asp:HyperLink>
                                    <br />
                                    <asp:Label ID="lblName" runat="server" Text="CPA Name"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblAddress1" runat="server" Text="Address 1"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblAddress2" runat="server" Text="Address 2"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblZipCode" runat="server" Text="Zip Code"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblCPAName" runat="server" Text="CPANAME" Visible="false"></asp:Label>
                                    <asp:Label ID="lblCity" runat="server" Text="City" Visible="false"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label7" runat="server" Text="Schedule" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblScheduleDate" runat="server" Text="[Schedule Date]"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label8" runat="server" Text="Purpose of Visit" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblPurposeOfVisit" runat="server" Text="[Purpose of Visit]"></asp:Label>
                                </td>
                            </tr>
                        </table>
                            </asp:Panel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
