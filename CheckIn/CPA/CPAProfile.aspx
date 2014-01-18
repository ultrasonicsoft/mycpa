<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CPAProfile.aspx.cs" Inherits="CheckIn.CPA.CPAProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlCPAProfile" runat="server">
    <table style="background-color: #e6e6f5" width="100%" cellpadding-left="10">
                    <tr>
                        <td style="padding-left: 20px;" width="18%">
                            <asp:Label ID="Label15" runat="server" Text="CPA Information" Font-Bold="True"></asp:Label>
                            <br /></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;" >
                            <asp:Label ID="Label16" runat="server" Text="Company Name"></asp:Label>
                        </td>
                   
                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Label ID="lblCompanyName" Width="80%" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label18" runat="server" Text="Email"></asp:Label>
                        </td>
                  
                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Label ID="lblEmail" Width="80%" runat="server"></asp:Label>
                             </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label19" runat="server" Text="Name"></asp:Label>
                        </td>
                    

                        <td style="padding-left: 20px;" class="auto-style1"  >
                            <asp:Label ID="lblName" Width="40%" Text="First Name" runat="server"></asp:Label>
                            
                            
                        </td>
                   
                     

                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label20" runat="server" Text="Date Of Birth"></asp:Label>
                        </td>
                  
                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Label ID="lblDOB" Width="20%" Text="DOF" runat="server"></asp:Label>
                           
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label21" runat="server" Text="Gender"></asp:Label>
                        </td>
                  

                        <td style="padding-left: 20px;" class="auto-style1">
                           
                            <asp:Label ID="lblGender" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label22" runat="server" Text="Image"></asp:Label>
                        </td>
                  

                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Image ID="imgCPA" runat="server" Height="62px" Width="62px" />
                            <%--<asp:FileUpload ID="ImageUpload"   runat="server" Width="257px" />--%>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label23" runat="server" Text="Phone Number"></asp:Label>
                        </td>
                   
                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Label ID="lblPhoneNumber" Width="80%" runat="server"></asp:Label>
                            
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label24" runat="server" Text="Practicing Zip Code"></asp:Label>
                        </td>
                   
                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Label ID="lblZipCode" Width="80%" runat="server"></asp:Label>
                           
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label25" runat="server" Text="Office Address Line 1"></asp:Label>
                        </td>
                    
                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Label ID="lblOfficeAddress1" Width="80%" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label26" runat="server" Text="Office Address Line 2"></asp:Label>
                        </td>
                    
                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Label ID="lblOfficeAddress2" Width="80%" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label27" runat="server" Text="Practing City"></asp:Label>
                        </td>
                    
                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Label ID="lblPractingCity" Width="80%" runat="server"></asp:Label>
                                </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label28" runat="server"  Text="Practing State"></asp:Label>
                        </td>
                   
                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Label ID="lblPractingState" Width="80%"  runat="server"></asp:Label>
                           

                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">
                            <asp:Label ID="Label29" runat="server"  Text="Speciality"></asp:Label>
                        </td>
                    
                        <td style="padding-left: 20px;" class="auto-style1">
                            <asp:Label ID="lblSpeciality" Width="80%"  runat="server"></asp:Label>
                            <br />
                            

                        </td>
                    </tr>
                        
        <td>

        </td>
                    <tr>
                        <td>

                        </td>
                        <td style="padding-left: 20px;">
                            <asp:Button runat="server" Text="Edit" ID="btnEdit" OnClick="btnEdit_Click" Width="60px"></asp:Button>
                        </td>
                    </tr>
                </table>
        </asp:Panel>
    <asp:Panel ID="pnlEditCPAProfile" runat="server">
        <table width="100%">
            <tr align="center">
                <td align="left" width="50%">
                    <table style="background-color: #e6e6f5" width="100%" cellpadding-left="10">
                        <tr>
                            <td style="padding-left: 20px;">
                                <asp:Label ID="Label4" runat="server" Text="Account Information" Font-Bold="True"></asp:Label>
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="EditValidation"
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
                                <asp:TextBox ID="txtEmail" Width="80%" runat="server" Enabled="false"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email can not be empty" SetFocusOnError="true"
                                ControlToValidate="txtEmail" ValidationGroup="EditValidation" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email Address " ControlToValidate="txtEmail"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="EditValidation" ForeColor="Red"></asp:RegularExpressionValidator>
    
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
                                ControlToValidate="txtPassword" ValidationGroup="EditValidation" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ControlToValidate="txtPassword"
                                ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" ValidationGroup="EditValidation" SetFocusOnError="true"
                                ErrorMessage="Contain 8 and 10 characters, one digit and one alphabetic character, and must not contain special characters."></asp:RegularExpressionValidator>
     
                              

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
                                <br />
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="FirstName can not be empty" SetFocusOnError="true"
                                runat="server" ControlToValidate="txtFirstName" ValidationGroup="EditValidation" ForeColor="Red"></asp:RequiredFieldValidator>

                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="FirstName should have 1-25 Alphabet"
                                ControlToValidate="txtFirstName" SetFocusOnError="true"
                                ValidationExpression="^[a-zA-Z]{1,25}$" ValidationGroup="EditValidation" ForeColor="Red"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 20px;">
                                <asp:TextBox ID="txtLastName" Width="40%" Text="Last Name" runat="server"></asp:TextBox>
                                <br />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true"
                                 ErrorMessage="LastName can not be empty" ControlToValidate="txtLastName"
                                 ForeColor="Red" ValidationGroup="EditValidation"></asp:RequiredFieldValidator>
                             <br />
                             <asp:RegularExpressionValidator ValidationExpression="^[a-zA-z]{1,25}$" SetFocusOnError="true"
                                 ID="RegularExpressionValidator4" runat="server" ValidationGroup="EditValidation"
                                 ForeColor="Red" ErrorMessage="LastName should have 1-25 Alphabet" ControlToValidate="txtLastName"></asp:RegularExpressionValidator>
                    </td>
                        </tr>--%>
                         <tr>
                                    <td style="padding-left: 20px;">
                                        <asp:Label ID="Label5" runat="server" Text="First Name"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">
                                        <asp:TextBox ID="txtFirstName" Text="First Name" runat="server" Width="230px"   ></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="FirstName not Empty"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Allow Only 1-25 Alphabet " ControlToValidate="txtFirstName"
                                            ValidationExpression="^[a-zA-Z]{1,25}$"  ForeColor="Red"></asp:RegularExpressionValidator>--%>
                                        <asp:CustomValidator ID="CustValFisrtName" runat="server"  ForeColor="Red" ControlToValidate="txtFirstName"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">
                                        <asp:Label ID="Label30" runat="server" Text="Last Name"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">
                                        <asp:TextBox ID="txtLastName" Text="Last Name" runat="server" Width="230px" ></asp:TextBox>
                                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="LastName Not Empty"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ValidationExpression="^[a-zA-z]{1,25}$"
                                            ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ErrorMessage="Allow Only 1-25 Alphabet" ControlToValidate="txtLastName"></asp:RegularExpressionValidator></td>--%>
                                <asp:CustomValidator ID="CustValLastName" runat="server"  ForeColor="Red" ControlToValidate="txtLastName"></asp:CustomValidator>
                                </tr>
                        <tr>
                            <td style="padding-left: 20px;">
                                <asp:Label ID="Label6" runat="server" Text="Date Of Birth"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 20px;">
                                
                                <asp:TextBox ID="txtDOB" runat="server" Width="40%"></asp:TextBox>
                          <%--  <asp:CalendarExtender ID="CalendarExtender1" Enabled="true" runat="server" TargetControlID="txtDOB"></asp:CalendarExtender>--%>
                            <asp:ImageButton ID="imgBtnCalender" runat="server" AlternateText="click"  Height="25px" Width="25px" ImageUrl="~/icon/CalenderImageIcon.png" OnClick="imgBtnCalender_Click" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="Date Of Birth can not be empty " ValidationGroup="EditValidation" ControlToValidate="txtDOB"></asp:RequiredFieldValidator>
                            <asp:Panel ID="pnlCalender" runat="server" Height="194px">
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
                                <asp:Image ID="imgEditCPA" runat="server" Height="62px" Width="62px" />
                                <asp:FileUpload ID="ImageUpload" runat="server" Width="257px"/>

                            </td>
                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                    <%--</table>
                </td>
                <td align="left" width="50%">
                    <table style="background-color: #e6e6f5" width="100%" cellpadding-left="10">--%>

                        <tr>
                            <td style="padding-left: 20px;">
                                <asp:Label ID="Label8" runat="server" Text="Phone Number"></asp:Label>
                            </td>
                        </tr>
                        <%--<tr>
                            <td style="padding-left: 20px;">
                                <asp:TextBox ID="txtPhoneNumber" Width="40%" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPhoneNumber" SetFocusOnError="true"
                                ErrorMessage="Phone Number can not be empty" ValidationGroup="EditValidation" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ForeColor="Red"
                                ErrorMessage="Please enter a correct Phone number" ValidationGroup="EditValidation" ControlToValidate="txtPhoneNumber"
                                ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" SetFocusOnError="true"></asp:RegularExpressionValidator>


                            </td>
                        </tr>--%>
                         <tr>
                                    <td style="padding-left: 20px;">
                                        <table>
                                           <tr>
                                               <td align="right" >
                                                   <asp:TextBox ID="txtPhNumberPart1" Width="40px" MaxLength="3" runat="server" Height="23px"></asp:TextBox>
                                                   
                                               </td>
                                               <td align="center" >
                                                   <asp:Label ID="Label31" runat="server" Text="Label" Width="40" Height="23px"> - </asp:Label>
                                                   <asp:TextBox ID="txtPhNumberPart2" Width="40px"  MaxLength="3" runat="server" Height="23px"></asp:TextBox>
                                                    <asp:Label ID="Label32" runat="server" Width="40" Text="Label" Height="23px"> - </asp:Label>
                                               </td>
                                               <td align="center" >
                                                   <asp:TextBox ID="txtPhNumberPart3" Width="40px" MaxLength="4" runat="server" Height="23px"></asp:TextBox>

                                               </td>

                                           </tr> 
                                                                           
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">
                                        <asp:CustomValidator ID="CustPhoneNumber" runat="server"  ForeColor="Red" ErrorMessage="All Character are digit"></asp:CustomValidator>
                                    </td>
                                </tr>
                        <tr>
                            <td style="padding-left: 20px;">
                                <asp:Label ID="Label11" runat="server" Text="Practicing Zip Code"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 20px;">
                                <asp:TextBox ID="txtZipCode" Width="40%" runat="server"></asp:TextBox>
                               
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red"
                                    ErrorMessage="ZipCod can not be empty" ControlToValidate="txtZipCode" ValidationGroup="EditValidation"></asp:RequiredFieldValidator>
                                <br />
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ForeColor="Red"
                                ErrorMessage="Zipcode contain 5 or 9 numeric characters " ValidationGroup="EditValidation" ControlToValidate="txtZipCode"
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
                                <asp:Label ID="Label13" runat="server" Text="Practing City"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 20px;">
                              <asp:DropDownList ID="ddlCity" runat="server" Width="40%" AutoPostBack="true"
                                      AppendDataBoundItems="true"  OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" CausesValidation="true">
                                </asp:DropDownList><br />

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="EditValidation" runat="server" ErrorMessage="Please Select PractingCity" 
                                ControlToValidate="ddlCity" InitialValue="--Please Select City--" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 20px;">
                                <asp:Label ID="Label12" runat="server" Text="Practing State"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            

                              <td style="padding-left: 20px;">
                             <asp:DropDownList ID="ddlState" runat="server" Width="40%"  AutoPostBack="true" CausesValidation="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AppendDataBoundItems="true">
                                </asp:DropDownList>
                            <br />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please Select PractingState" ControlToValidate="ddlState" 
                                 ValidationGroup="EditValidation"   ForeColor="Red" InitialValue="--Please Select State--" Display="Dynamic"></asp:RequiredFieldValidator>
                         
                        </td>
                                <caption>
                                    <br />
                                    <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="EditValidation"  runat="server" ForeColor="Red"
                                    ErrorMessage="PractingState can not be empty" ControlToValidate="txtPractingState"></asp:RequiredFieldValidator>--%>
                              </caption>
                            </td>
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
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"  ForeColor="Red" ValidationGroup="EditValidation"
                                ErrorMessage="Please select Speciality" ControlToValidate="ddlSpeciality" InitialValue="--Please Select Speciality--"></asp:RequiredFieldValidator>

                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtSpeciality" ValidationGroup="EditValidation" runat="server" ForeColor="Red"
                                    ErrorMessage="Speciality Can not be empty" ControlToValidate="txtSpeciality"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 20px;">
                                <%--<asp:CustomValidator ID="CustomValidator1" runat="server"  ControlToValidate="cbTermCondition" 

                                ErrorMessage="Accept terms and condition" OnServerValidate="checkCheckBox"></asp:CustomValidator>
                        </td>--%><asp:ValidationSummary ID="ValidationSummary1"  ValidationGroup="EditValidation" runat="server"
                                                                    DisplayMode="BulletList" CssClass="validationSummary" ForeColor="Red" />
                        </tr>

                        <tr>
                            <td style="padding-left: 20px;">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Width="60px"  ValidationGroup="EditValidation"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                    OnClick="btnCancel_Click" />
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
    </asp:Panel>
</asp:Content>
