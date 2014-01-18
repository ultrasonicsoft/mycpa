﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CPASignUp.aspx.cs" Inherits="CheckIn.Web_Pages.CPASignUp" %>

<%@ Register src="../CaptchaUserControl.ascx" tagname="CaptchaUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%" style="background-color: #e6e6f5">
        <tr align="center">
            <td align="left" width="50%">
                <table style="background-color: #e6e6f5" width="100%" cellpadding-left="10">
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label4" runat="server" Text="Create an account!" Font-Bold="True"></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label1" runat="server" Text="Company Name"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:TextBox ID="txtCompanyName" Width="80%" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="signUpValidation"
                                ErrorMessage="CompanyName can not be empty" ForeColor="Red" ControlToValidate="txtCompanyName"></asp:RequiredFieldValidator>
                        
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:TextBox ID="txtEmail" Width="80%" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ValidationGroup="signUpValidation"
                                ErrorMessage="Email can not be empty" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email Address " ControlToValidate="txtEmail"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ValidationGroup="signUpValidation" ForeColor="Red"></asp:RegularExpressionValidator>
    
                      <asp:CustomValidator  ID="CustomValidator2" runat="server" ForeColor="Red" ErrorMessage="Email not Exist"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label3" runat="server" Text="Generate Password"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:TextBox ID="txtPassword" TextMode="Password" Width="80%" runat="server"></asp:TextBox>
                            <br />
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Password can not be empty" SetFocusOnError="true"
                                ControlToValidate="txtPassword"  ValidationGroup="signUpValidation" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ControlToValidate="txtPassword"
                                ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$"  ValidationGroup="signUpValidation" SetFocusOnError="true"
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
                                        <asp:Label ID="Label15" runat="server" Text="Last Name"></asp:Label>
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
                   <%-- <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label5" runat="server" Text="Name"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:TextBox ID="txtFirstName" Width="40%" Text="First Name" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="FirstName can not be empty" SetFocusOnError="true"
                                runat="server" ControlToValidate="txtFirstName"  ValidationGroup="signUpValidation" ForeColor="Red"></asp:RequiredFieldValidator>

                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="FirstName should have 1-25 Alphabet"
                                ControlToValidate="txtFirstName" SetFocusOnError="true"
                                ValidationExpression="^[a-zA-Z]{1,25}$"  ValidationGroup="signUpValidation" ForeColor="Red">

                            </asp:RegularExpressionValidator>
                            </td>
                     
                    </tr>
                    <tr>
                       <td  style="padding-left: 20px;">
                            <asp:TextBox ID="txtLastName" Width="40%" Text="Last Name" runat="server"></asp:TextBox>
                            <br />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true"
                                 ErrorMessage="LastName can not be empty" ControlToValidate="txtLastName"
                                 ForeColor="Red"  ValidationGroup="signUpValidation"></asp:RequiredFieldValidator>
                             <br />
                             <asp:RegularExpressionValidator ValidationExpression="^[a-zA-z]{1,25}$" SetFocusOnError="true"
                                 ID="RegularExpressionValidator4" runat="server"  ValidationGroup="signUpValidation"
                                 ForeColor="Red" ErrorMessage="LastName should have 1-25 Alphabet" ControlToValidate="txtLastName"></asp:RegularExpressionValidator>
                        </td>
                    </tr>--%>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label6" runat="server" Text="Date Of Birth"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            
                                <asp:TextBox ID="txtDOB" runat="server" Width="40%"></asp:TextBox>
                          <%--  <asp:CalendarExtender ID="CalendarExtender1" Enabled="true" runat="server" TargetControlID="txtDOB"></asp:CalendarExtender>--%>
                            <asp:ImageButton ID="imgBtnCalender" runat="server" AlternateText="click"  Height="20px" Width="20px" ImageUrl="~/icon/CalenderImageIcon.png" OnClick="imgBtnCalender_Click" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="Date Of Birth not empty"  ValidationGroup="signUpValidation" ControlToValidate="txtDOB"></asp:RequiredFieldValidator>
                            <asp:Panel ID="pnlCalender" runat="server" Height="160px">
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
                            </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label7" runat="server" Text="Gender"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:RadioButton ID="rbtnMale" Checked="true" Text="Male" GroupName="Gender" runat="server" />
                            <asp:RadioButton ID="rbtnFemale" Text="Female" GroupName="Gender" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label14" runat="server" Text="Image"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:FileUpload ID="ImageUpload"   runat="server" Width="319px" />
                           <asp:Label ID="lblFile" runat="server" Visible="false"></asp:Label>
                        </td>
                    </tr>
                   
                    
                  
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
            <td align="left" width="50%">
                <table style="background-color: #e6e6f5" width="100%" cellpadding-left="10">
                    
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label8" runat="server" Text="Phone Number"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                                    <td style="padding-left: 20px;">
                                        <table>
                                           <tr>
                                               <td align="right" >
                                                   <asp:TextBox ID="txtPhNumberPart1" Width="40" MaxLength="3" runat="server" Height="22px"></asp:TextBox>
                                                   
                                               </td>
                                               <td align="center" >
                                                   <asp:Label ID="Label16" runat="server" Text="Label" Width="40"> - </asp:Label>
                                                   <asp:TextBox ID="txtPhNumberPart2" Width="40"  MaxLength="3" runat="server">  </asp:TextBox>
                                                    <asp:Label ID="Label18" runat="server" Width="40" Text="Label"> - </asp:Label>
                                               </td>
                                               <td align="center" >
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
                   <%-- <tr>
                        <td style="padding-left: 20px;">
                            <asp:TextBox ID="txtPhoneNumber" Width="80%" runat="server"></asp:TextBox>
                            <br />
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPhoneNumber" SetFocusOnError="true"
                                ErrorMessage="Phone Number can not be empty"  ValidationGroup="signUpValidation" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ForeColor="Red"
                                ErrorMessage="Please enter a correct Phone number"  ValidationGroup="signUpValidation" ControlToValidate="txtPhoneNumber"
                                ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" SetFocusOnError="true"></asp:RegularExpressionValidator>


                        </td>
                    </tr>--%><tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label11" runat="server" Text="Practicing Zip Code"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:TextBox ID="txtZipCode" Width="80%" runat="server"></asp:TextBox>
                             <br />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red"
                                    ErrorMessage="ZipCod can not be empty" ControlToValidate="txtZipCode"  ValidationGroup="signUpValidation"></asp:RequiredFieldValidator>
                                <br />
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ForeColor="Red"
                                ErrorMessage="Zipcode contain 5 or 9 numeric characters "  ValidationGroup="signUpValidation" ControlToValidate="txtZipCode"
                                ValidationExpression="^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$" SetFocusOnError="true"></asp:RegularExpressionValidator>
                            </td>
                    </tr>
                   <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label9" runat="server" Text="Office Address Line 1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:TextBox ID="txtOfficeAddress1" Width="80%" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label10" runat="server" Text="Office Address Line 2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:TextBox ID="txtOfficeAddress2" Width="80%" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                   
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label12" runat="server"  Text="Practing State"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                             <asp:DropDownList ID="ddlState" runat="server" Width="50%"  AutoPostBack="true" CausesValidation="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AppendDataBoundItems="true">
                                </asp:DropDownList>
                            <br />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please Select State" ControlToValidate="ddlState" 
                                 ValidationGroup="signUpValidation"   ForeColor="Red" InitialValue="--Please Select State--" Display="Dynamic"></asp:RequiredFieldValidator>
                           
                            <%--<asp:CompareValidator ID="CompareddlState" runat="server" ErrorMessage="Please Select State"  ControlToValidate="ddlState"  c
                                 Type="String" ValidationGroup="signUpValidation" ></asp:CompareValidator>--%>
                        </td>
                    </tr>
                     <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label13" runat="server" Text="Practing City"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:DropDownList ID="ddlCity" runat="server" Width="50%" 
                                      AppendDataBoundItems="true"  OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" CausesValidation="true">
                                </asp:DropDownList><br />

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="signUpValidation" runat="server" ErrorMessage="Please Select City" 
                                ControlToValidate="ddlCity" InitialValue="--Please Select City--" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            
                    </tr>
                     <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label17" runat="server"  Text="Speciality"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                             <asp:TextBox ID="txtSpeciality" Width="40%" runat="server" ></asp:TextBox>
                                <asp:DropDownList ID="ddlSpeciality" runat="server" Width="40%" AutoPostBack="true" OnSelectedIndexChanged="ddlSpeciality_SelectedIndexChanged" 
                                    AppendDataBoundItems="True" Display="Dynamic" style="margin-bottom: 0px" >
                                </asp:DropDownList>
                            <br />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"  ForeColor="Red" ValidationGroup="signUpValidation"
                                ErrorMessage="Please select Speciality" ControlToValidate="ddlSpeciality" InitialValue="--Please Select Speciality--"></asp:RequiredFieldValidator>
                           <%-- <asp:CompareValidator ID="compareSpeciality" runat="server" ErrorMessage="Please Select Speciality"
                                ControlToValidate="ddlSpeciality" Type="String" ValidationGroup="signUpValidation" ></asp:CompareValidator>--%>

                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"  ForeColor="Red" ValidationGroup="signUpValidation"
                                ErrorMessage="Speciality Can not be empty" ControlToValidate="txtSpeciality"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     <tr>
                        <td style="padding-left: 20px;"> 
                             
                           
                         
                           
                            <uc1:CaptchaUserControl ID="CaptchaUserControl" runat="server" />
                             
                           
                         
                           
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            
                            <asp:TextBox ID="txtCaptchaText" runat="server" Width="250px" Height="28px" ></asp:TextBox>
                            
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            
                            <asp:Label ID="lblStatus" runat="server" ></asp:Label>
                            
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                              <asp:CheckBox ID="cbTermCondition" Text="I accept Terms and Conditions" runat="server" CausesValidation="true"
                                   /><asp:CustomValidator ID="valTermsConditions" ControlToValidate="cbTermCondition" runat="server" ForeColor="Red" ErrorMessage="Please accept Terms And Condition!"
                                ValidationGroup="signUpValidation" Visible="false"></asp:CustomValidator>
                           </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            
                            <br />
                             <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="signUpValidation" runat="server"
                                                                    DisplayMode="BulletList" CssClass="validationSummary" ForeColor="Red"></asp:ValidationSummary>
                        </td>
                    
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                      
                            <asp:Button ID="btnSignUpCPA" runat="server" ValidationGroup="signUpValidation" Text="Sign Up" OnClick="btnSignUp_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
