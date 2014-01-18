<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="CheckIn.CPA.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
                        <asp:Button ID="btnRefineSearch" runat="server" Text="Refine Search" 
                            OnClick="btnRefineSearch_Click" style="height: 26px" />
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
            <td width="25%"></td>
        </tr>
    </table>
            <br />
            <table width="100%" style="background-color: #e6e6f5" cellpadding="8px">
                <tr>
                    <td width="35%">
                       
<%--                         <asp:HyperLink ID="HyperLink3" runat="server"  NavigateUrl="~/CPA/ViewScheduledAppointments.aspx">View Scheduled Appointments</asp:HyperLink>--%>
                         <asp:HyperLink ID="HyperLink1" runat="server"  NavigateUrl= "~/CPA/ViewScheduledAppointments.aspx?">View Scheduled Appointments</asp:HyperLink>
                    </td>
                    <td width="35%">
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/CPA/ViewPastAppointment.aspx?">View Past Appointments</asp:HyperLink>
                    </td width="30%">
                    <td style="background-color: #000079">
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/CPA/UserProfile.aspx?">Account Settings</asp:HyperLink>
                    </td>
                </tr>
            </table>

    <asp:Panel ID="pnlUserProfile"  runat="server">
    <table style="background-color: #e6e6f5" width="100%" cellpadding-left="10">
                    <tr>
                        <td style="padding-left: 20px;" width="18%">
                            <asp:Label ID="Label9" runat="server" Text="Profile" Font-Bold="True"></asp:Label>
                            <br /></td>
                    </tr>
                  

                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label11" runat="server" Text="Email"></asp:Label>
                        </td>
                  
                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Label ID="lblEmail" Width="80%" runat="server"></asp:Label>
                             </td>
                    </tr>
                  

                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label12" runat="server" Text="First Name"></asp:Label>
                        </td>
                    

                        <td style="padding-left: 20px;" class="auto-style1"  >
                            <asp:Label ID="lblFirstName" Width="40%" Text="First Name" runat="server"></asp:Label>
                         </tr>
                    <tr>   
                            
                        </td>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label10" runat="server" Text="Last Name"></asp:Label>
                        </td>
                    

                        <td style="padding-left: 20px;" class="auto-style1"  >
                            <asp:Label ID="lblLastName" Width="40%" Text="Last Name" runat="server"></asp:Label>
                            
                            
                        </td>
                   
                     

                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label13" runat="server" Text="Date Of Birth"></asp:Label>
                        </td>
                  
                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Label ID="lblDOB" Width="20%" Text="DOF" runat="server"></asp:Label>
                           
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label14" runat="server" Text="Gender"></asp:Label>
                        </td>
                  

                        <td style="padding-left: 20px;" class="auto-style1">
                           
                            <asp:Label ID="lblGender" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label15" runat="server" Text="Image"></asp:Label>
                        </td>
                  

                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Image ID="imgUser" runat="server" Height="62px" Width="62px" />
                            <%--<asp:FileUpload ID="ImageUpload"   runat="server" Width="257px" />--%>
                        </td>
                         
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label16" runat="server" Text="Phone Number"></asp:Label>
                        </td>
                   
                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Label ID="lblPhoneNumber" Width="80%" runat="server"></asp:Label>
                            
                        </td>
                    </tr>
                    

                   

                    <tr>
                        <td>
                            <br /></td>
                        <td style="padding-left: 20px;" class="auto-style1">   
                            <br />      
                                   <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" Width="60px" 
                   />
                </td>
                    </tr>
                </table>
        </asp:Panel>

    <asp:Panel ID="pnlEditUserProfile" runat="server">
    <table  cellpadding-left="10" width="50%">
        <tr>
            <td style="padding-left: 20px;" class="style2">
                <asp:Label ID="Label4" runat="server" Text="Account Information" Font-Bold="True"></asp:Label>
                <br />
                <asp:Label ID="Label1" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 20px;" class="style2">
                <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 20px;" class="style2">
                <asp:TextBox ID="txtEmail" Width="80%" runat="server" ></asp:TextBox>
                 <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email can not be empty" SetFocusOnError="true"
                                ControlToValidate="txtEmail" ValidationGroup="signUpValidation" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email Address " ControlToValidate="txtEmail"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="signUpValidation" ForeColor="Red"></asp:RegularExpressionValidator>
    
            </td>
        </tr>
        <tr>
            <td style="padding-left: 20px;" class="style2">
                <asp:Label ID="Label3" runat="server" Text="Generate Password"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 20px;" class="style2">
                <asp:TextBox ID="txtPassword" TextMode="Password" Width="40%" runat="server"></asp:TextBox>
                <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password can not be empty" SetFocusOnError="true"
                                ControlToValidate="txtPassword" ValidationGroup="signUpValidation" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ControlToValidate="txtPassword"
                                ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" ValidationGroup="signUpValidation" SetFocusOnError="true"
                                ErrorMessage="Contain 8 and 10 characters, one digit and one alphabetic character, and must not contain special characters."></asp:RegularExpressionValidator>
     
            </td>
        </tr>

          <tr>
                                    <td style="padding-left: 20px;">
                                        <asp:Label ID="Label5" runat="server" Text="First Name"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">
                                        <asp:TextBox ID="txtFirstName"  Width="40%" Text="First Name" runat="server"   ></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="FirstName not Empty"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Allow Only 1-25 Alphabet " ControlToValidate="txtFirstName"
                                            ValidationExpression="^[a-zA-Z]{1,25}$"  ForeColor="Red"></asp:RegularExpressionValidator>--%>
                                        <asp:CustomValidator ID="CustValFisrtName"  ValidationGroup="signUpValidation"  runat="server"  ForeColor="Red" ControlToValidate="txtFirstName"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">
                                        <asp:Label ID="Label20" runat="server" Text="Last Name"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">
                                        <asp:TextBox ID="txtLastName"   Width="40%" Text="Last Name" runat="server" ></asp:TextBox>
                                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="LastName Not Empty"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ValidationExpression="^[a-zA-z]{1,25}$"
                                            ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ErrorMessage="Allow Only 1-25 Alphabet" ControlToValidate="txtLastName"></asp:RegularExpressionValidator></td>--%>
                                <asp:CustomValidator ID="CustValLastName"   ValidationGroup="signUpValidation" runat="server"  ForeColor="Red" ControlToValidate="txtLastName"></asp:CustomValidator>
                              </td>

                                </tr>
        <%--<tr>
            <td style="padding-left: 20px;" class="style2">
                <asp:Label ID="Label5" runat="server" Text="Name"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 20px;" class="style2">
                <asp:TextBox ID="txtFirstName" Width="40%" Text="First Name" runat="server"></asp:TextBox>
<br />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ErrorMessage="FirstName can not be empty" SetFocusOnError="true"
                                runat="server" ControlToValidate="txtFirstName" ValidationGroup="signUpValidation" ForeColor="Red"></asp:RequiredFieldValidator>

                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="FirstName should have 1-25 Alphabet"
                                ControlToValidate="txtFirstName" SetFocusOnError="true"
                                ValidationExpression="^[a-zA-Z]{1,25}$" ValidationGroup="signUpValidation" ForeColor="Red"></asp:RegularExpressionValidator>
 </td>
         </tr>
         <tr> 
               <td style="padding-left: 20px;">
                    <asp:TextBox ID="txtLastName" Width="40%" Text="Last Name" runat="server"></asp:TextBox>
                   <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" SetFocusOnError="true"
                                 ErrorMessage="LastName can not be empty" ControlToValidate="txtLastName"
                                 ForeColor="Red" ValidationGroup="signUpValidation"></asp:RequiredFieldValidator>
                             <br />
                             <asp:RegularExpressionValidator ValidationExpression="^[a-zA-z]{1,25}$" SetFocusOnError="true"
                                 ID="RegularExpressionValidator4" runat="server" ValidationGroup="signUpValidation"
                                 ForeColor="Red" ErrorMessage="LastName should have 1-25 Alphabet" ControlToValidate="txtLastName"></asp:RegularExpressionValidator>
                               
               </td>
        </tr>--%>
        <tr>
            <td style="padding-left: 20px;" class="style2">
                <asp:Label ID="Label6" runat="server" Text="Date Of Birth"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 20px;" class="style2">
                 <asp:TextBox ID="txtDOB" runat="server" Width="40%"></asp:TextBox>
                          <%--  <asp:CalendarExtender ID="CalendarExtender1" Enabled="true" runat="server" TargetControlID="txtDOB"></asp:CalendarExtender>--%>
                            <asp:ImageButton ID="imgBtnCalender" runat="server" AlternateText="click"  Height="20px" Width="20px" ImageUrl="~/icon/CalenderImageIcon.png" OnClick="imgBtnCalender_Click" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="notempty" ValidationGroup="signUpValidation" ControlToValidate="txtDOB"></asp:RequiredFieldValidator>
                            <asp:Panel ID="pnlCalender" runat="server" Height="165px">
                                 <table>
                                    <tr>
                                        <td >
                                            <asp:Button ID="btnPreYear" runat="server" Text="<< year" OnClick="btnPreYear_Click"  />
                                         </td>
                                        <td>
                                         <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" Height="105px" Width="210px" ShowDayHeader="False" TitleFormat="Month" ></asp:Calendar>
                                        </td>
                                        <td>

                                        <asp:Button ID="btnNextYear" runat="server" Text=">>Year " OnClick="btnNextYear_Click" />
                                            </td>
                                        <td>
                                             <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ErrorMessage="Date of birth should not greater then today" ControlToValidate="txtDOB" 
                                ValidationGroup="signUpValidation" ></asp:CustomValidator>
                                        </td>
                                    </tr>

                                </table>
                            </asp:Panel>
                    
           
        </tr>
        <tr>
            <td style="padding-left: 20px;" class="style2">
                <asp:Label ID="Label7" runat="server" Text="Gender"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-left: 20px;" class="style2">
                <asp:RadioButton ID="rbtnMale" Checked="true" Text="Male" GroupName="Gender" runat="server" />
                <asp:RadioButton ID="rbtnFemale" Text="Female" GroupName="Gender" runat="server" />
            </td>
        </tr>
        <tr>
                            <td style="padding-left: 20px;">
                                <asp:Label ID="Label17" runat="server" Text="Image"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 20px;">
                                <asp:Image ID="imgEditUser" runat="server" Height="62px" Width="62px" />
                                <asp:FileUpload ID="ImageUpload" runat="server" Width="257px"/>

                            </td>
                        </tr>
        <tr>
            <td style="padding-left: 20px;" class="style2">
                <asp:Label ID="Label8" runat="server" Text="Phone Number"></asp:Label>
                
            </td>
        </tr>
        <tr>
                        <td style="padding-left: 20px;">
                            <table>
                                <tr>
                                    <td align="right">
                                        <asp:TextBox ID="txtPhNumberPart1" Width="40" MaxLength="3" runat="server" Height="22px"></asp:TextBox>

                                    </td>
                                    <td align="center">
                                        <asp:Label ID="Label18" runat="server" Text="Label" Width="40"> - </asp:Label>
                                        <asp:TextBox ID="txtPhNumberPart2" Width="40" MaxLength="3" runat="server">  </asp:TextBox>
                                        <asp:Label ID="Label19" runat="server" Width="40" Text="Label"> - </asp:Label>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="txtPhNumberPart3" Width="40" MaxLength="4" runat="server"></asp:TextBox>

                                    </td>

                                </tr>

                            </table>
                        </td>
                    </tr>
                                <tr>
                                    <td style="padding-left: 20px;">
                                       

                                        <asp:CustomValidator ID="CustPhoneNumber" ValidationGroup="signUpValidation" runat="server"  ForeColor="Red" ErrorMessage="All Character are digit"></asp:CustomValidator>
                                       

                                    </td>
                                </tr>
      <%--  <tr>
            <td style="padding-left: 20px;" class="style2">
                <asp:TextBox ID="txtPhoneNumber" Width="80%" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPhoneNumber" SetFocusOnError="true"
                                ErrorMessage="Phone Number can not be empty" ValidationGroup="signUpValidation" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ForeColor="Red"
                                ErrorMessage="Please enter a correct Phone number" ValidationGroup="signUpValidation" ControlToValidate="txtPhoneNumber"
                                ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" SetFocusOnError="true"></asp:RegularExpressionValidator>


                <br/>
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="signUpValidation" runat="server"
                                                                    DisplayMode="BulletList" CssClass="validationSummary" ForeColor="Red"></asp:ValidationSummary>

            </td>
        </tr>--%>
        <tr>
            <td style="padding-left: 20px;" class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <br />
            </td>
        </tr>
        <tr>
            <td style="padding-left: 20px; margin-left: 40px;" class="style2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:Button ID="btnSave" runat="server"  ValidationGroup="signUpValidation"  Text="Save" OnClick="btnSave_Click" Width="60px" 
                   />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                    OnClick="btnCancel_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <br />
            </td>
        </tr>
    </table>
    </asp:Panel>
</asp:Content>
  