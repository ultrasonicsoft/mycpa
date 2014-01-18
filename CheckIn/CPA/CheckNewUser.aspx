<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CheckNewUser.aspx.cs" Inherits="CheckIn.CPA.CheckNewUser" %>

<%@ Register Src="~/CaptchaUserControl.ascx" TagPrefix="uc1" TagName="CaptchaUserControl" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    --%>

    <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">--%>
    <%--  <ContentTemplate>--%>
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
            <td width="25%"></td>
        </tr>
    </table>
    <br />
    <table width="100%" style="background-color: #e6e6f5" cellpadding="8px">
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="1. Select CPA Appointment"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" Text="2. Appointment Information" Font-Bold="true"></asp:Label>
            </td>
            <td style="background-color: #000079">
                <asp:Label ID="Label5" runat="server" ForeColor="White" Text="3. Personal Information"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" Text="4. Finished!"></asp:Label>
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td width="70%">
                <asp:Panel ID="pnlLoggedIn" runat="server" Visible="False">
                    <table cellpadding="5px" width="100%">
                        <tr>
                            <td>
                                <asp:Label ID="lblUserName" runat="server" Text="LoggedIn User" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Button ID="btnContinue" runat="server" Text="Continue" OnClick="btnContinue_Click" />
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lnkBtnLoggedOut" runat="server" OnClick="lnkBtnLoggedOut_Click"></asp:LinkButton>
                            </td>

                        </tr>

                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlNotLoggedIn" runat="server">
                    <table cellpadding="5px" width="100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Have you visited this site before?" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnNewUser" runat="server" Text="I am new to this site" OnClick="btnNewUser_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnRegisteredUser" runat="server" Text="I have used this site before"
                                    OnClick="btnRegisteredUser_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnBack" runat="server" Text="<< Back"
                                    OnClick="btnBack_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>


                                <asp:Panel ID="pnlNewUser" runat="server" Visible="false">
                                    <table style="background-color: #e6e6f5" width="100%" cellpadding-left="10">
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <asp:Label ID="Label2" runat="server" Text="Create an account!" Font-Bold="True"></asp:Label>
                                                <asp:Label ID="Label9" runat="server" Text="It only takes few minutes" Font-Bold="True"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <asp:Label ID="Label10" runat="server" Text="Email"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <asp:TextBox ID="txtEmail" Width="70%" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email can not be empty" SetFocusOnError="true"
                                                    ControlToValidate="txtEmail" ValidationGroup="signUpValidation" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email Address " ControlToValidate="txtEmail"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="signUpValidation" ForeColor="Red"></asp:RegularExpressionValidator>

                                                <asp:CustomValidator ID="CustomValidator2" runat="server" ForeColor="Red" ErrorMessage="Email not Exist"></asp:CustomValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <asp:Label ID="Label11" runat="server" Text="Generate a Password"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <asp:TextBox ID="txtPassword" TextMode="Password" Width="70%" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password can not be empty" SetFocusOnError="true"
                                                    ControlToValidate="txtPassword" ValidationGroup="signUpValidation" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ControlToValidate="txtPassword"
                                                    ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" ValidationGroup="signUpValidation" SetFocusOnError="true"
                                                    ErrorMessage="Contain 8 to 10 characters, one digit and one alphabetic character and must not contain special characters."></asp:RegularExpressionValidator>
                                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password can not be empty"
                                                                    ControlToValidate="txtPassword" ValidationGroup="signUpValidation" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <asp:Label ID="Label12" runat="server" Text="FirstName"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <%--  <table width="80%">
                                                            <tr>
                                                                <td align="left" width="50%">--%>
                                                <asp:TextBox ID="txtFirstName" Width="40%" Text="FirstName" runat="server"></asp:TextBox>
                                                <asp:CustomValidator ID="CustValFisrtName" runat="server" ValidationGroup="signUpValidation" ForeColor="Red" ControlToValidate="txtFirstName"></asp:CustomValidator>

                                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ErrorMessage="FirstName can not be empty" SetFocusOnError="true"
                                                            runat="server" ControlToValidate="txtFirstName" ValidationGroup="signUpValidation" ForeColor="Red"></asp:RequiredFieldValidator>

                                                        <br />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="FirstName should have 1-25 Alphabet"
                                                            ControlToValidate="txtFirstName" SetFocusOnError="true"
                                                            ValidationExpression="^[a-zA-Z]{1,25}$" ValidationGroup="signUpValidation" ForeColor="Red"></asp:RegularExpressionValidator>

                                                --%>   <%--  </td>--%>
                                                <%--<td align="left" width="50%">
                                                                <asp:TextBox ID="txtLastName" Width="100%" Text="Last Name" runat="server"></asp:TextBox>
                                                                 <asp:RegularExpressionValidator ValidationExpression="^[a-zA-z]{1,25}$"
                                                                    ID="RegularExpressionValidator4" runat="server" ValidationGroup="signUpValidation" 
                                                                    ForeColor="Red" ErrorMessage="Allow Only 1-25 Alphabet" ControlToValidate="txtLastName"></asp:RegularExpressionValidator></td>
                            
                                                         
                                                                <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                                    ErrorMessage="LastName can not be empty" ControlToValidate="txtLastName"
                                                                    ForeColor="Red" ValidationGroup="signUpValidation" ></asp:RequiredFieldValidator>
                                                                  </td>--%>
                                                <%-- </tr>
                                                        </table>--%>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <asp:Label ID="Label20" runat="server" Text="LastName"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <%-- <table width="80%">
                                                            <tr>
                                                                
                                                                <td align="left" width="50%">--%>
                                                <asp:TextBox ID="txtLastName" Width="40%" Text="Last Name" runat="server"></asp:TextBox>
                                                <asp:CustomValidator ID="CustValLastName" ValidationGroup="signUpValidation" runat="server" ForeColor="Red" ControlToValidate="txtLastName"></asp:CustomValidator>

                                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" SetFocusOnError="true"
                                                            ErrorMessage="LastName can not be empty" ControlToValidate="txtLastName"
                                                            ForeColor="Red" ValidationGroup="signUpValidation"></asp:RequiredFieldValidator>


                                                        <br />
                                                        <asp:RegularExpressionValidator ValidationExpression="^[a-zA-z]{1,25}$" SetFocusOnError="true"
                                                            ID="RegularExpressionValidator4" runat="server" ValidationGroup="signUpValidation"
                                                            ForeColor="Red" ErrorMessage="LastName should have 1-25 Alphabet" ControlToValidate="txtLastName"></asp:RegularExpressionValidator>--%>

                                                <%--</td>--%>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <asp:Label ID="Label13" runat="server" Text="Date of Birth"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <table width="80%">
                                                    <tr>
                                                        <td align="left" width="50%">
                                                            <asp:TextBox ID="txtDOB" runat="server" Width="40%"></asp:TextBox>
                                                            <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="click" OnClick="ImageButton1_Click" ImageUrl="~/icon/CalenderImageIcon.png" Height="20px" Width="20px" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red" ErrorMessage="notempty" ValidationGroup="signUpValidation" ControlToValidate="txtDOB"></asp:RequiredFieldValidator>
                                                            <asp:Panel ID="pnlCalender" runat="server" Height="194px">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Button ID="btnPreYear" runat="server" Text="<< year" OnClick="btnPreYear_Click" />
                                                                        </td>
                                                                        <td>
                                                                            <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" Height="105px" Width="210px" ShowDayHeader="False" TitleFormat="Month"></asp:Calendar>
                                                                        </td>
                                                                        <td>

                                                                            <asp:Button ID="btnNextYear" runat="server" Text=">>Year " OnClick="btnNextYear_Click" />
                                                                        </td>
                                                                        <td>
                                                                            <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ErrorMessage="Date of birth should not greater then today" ControlToValidate="txtDOB"
                                                                                ValidationGroup="signUpValidation"></asp:CustomValidator>
                                                                        </td>
                                                                    </tr>

                                                                </table>
                                                            </asp:Panel>

                                                            <%-- <asp:TextBox ID="txtMM" Text="MM" runat="server" Width="40%"></asp:TextBox>
                                                                &nbsp;
                                                                <asp:TextBox ID="txtDD" Text="DD" runat="server" Width="40%"></asp:TextBox>
                                                            </td>
                                                            <td align="left" width="50%">
                                                                <asp:TextBox ID="txtYYYY" Text="YYYY" runat="server"></asp:TextBox>--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <asp:Label ID="Label14" runat="server" Text="Gender"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <table width="90%">
                                                    <tr>
                                                        <td align="left" width="50%">
                                                            <asp:RadioButton ID="rbtnMale" Checked="true" GroupName="rgrpGendar" runat="server" Text="Male" />
                                                            &nbsp;&nbsp;
                                                                <asp:RadioButton ID="rbtnFemale" GroupName="rgrpGendar" runat="server" Text="Female" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <asp:Label ID="Label21" runat="server" Text="Image"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <table width="90%">
                                                    <tr>
                                                        <td align="left" width="50%">


                                                            <asp:FileUpload ID="ImageUpload" runat="server" Width="325px" />

                                                            <asp:Label ID="lblFile" runat="server" Visible="false"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <asp:Label ID="Label15" runat="server" Text="Phone Number"></asp:Label>
                                            </td>
                                        </tr>
                                        <%--<tr>
                                                    <td style="padding-left: 20px;">
                                                        <table width="80%">
                                                            <tr>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtPhoneNumber" Width="40%" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPhoneNumber" SetFocusOnError="true"
                                                                        ErrorMessage="Phone Number can not be empty" ValidationGroup="signUpValidation" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                    <br />
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ForeColor="Red"
                                                                        ErrorMessage="Please enter a correct Phone number" ValidationGroup="signUpValidation" ControlToValidate="txtPhoneNumber"
                                                                        ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" SetFocusOnError="true"></asp:RegularExpressionValidator>


                                                                </td>
                                                                <%-- <td align="left" width="50%">
                                                            </td>--%>
                                        <%--</tr>
                                                        </table>
                                                    </td>
                                                </tr>--%>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <table>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:TextBox ID="txtPhNumberPart1" Width="40" MaxLength="3" runat="server" Height="22px"></asp:TextBox>

                                                        </td>
                                                        <td align="center">
                                                            <asp:Label ID="Label22" runat="server" Text="Label" Width="40"> - </asp:Label>
                                                            <asp:TextBox ID="txtPhNumberPart2" Width="40" MaxLength="3" runat="server">  </asp:TextBox>
                                                            <asp:Label ID="Label23" runat="server" Width="40" Text="Label"> - </asp:Label>
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


                                                <asp:CustomValidator ID="CustPhoneNumber" runat="server" ForeColor="Red" ValidationGroup="signUpValidation" ErrorMessage="All Character are digit"></asp:CustomValidator>


                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">

                                                <%--<asp:Image  ImageUrl="~/CPA/GenerateCaptcha.ashx"  runat="server"/>
                            <asp:Button ID="btnReGenerate" runat="server"
                                text=" Regenrate captch" OnClick="btnReGenerate_Click" />--%>
                                                <uc1:CaptchaUserControl runat="server" ID="CaptchaUserControl" />

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">

                                                <asp:TextBox ID="txtCaptchaText" runat="server" Width="250px" Height="28px"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">

                                                <asp:Label ID="lblStatus" runat="server"></asp:Label>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <asp:CheckBox ID="cbAcceptTerms" runat="server" Text="I accept Terms and Conditions" ValidationGroup="signUpValidation" />
                                                <br />
                                                <asp:CustomValidator ID="valTermsConditions" runat="server" ForeColor="Red" ErrorMessage="Please accept Terms And Condition!"
                                                    ValidationGroup="signUpValidation" Visible="false"></asp:CustomValidator>
                                                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="signUpValidation" runat="server"
                                                    DisplayMode="BulletList" CssClass="validationSummary" ForeColor="Red"></asp:ValidationSummary>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 20px;">
                                                <asp:Button ID="btnSignUp" runat="server" Text="Sign Up"
                                                    OnClick="btnSignUp_Click" ValidationGroup="signUpValidation" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="pnlRegisteredUser" runat="server" Visible="false">
                                    <table width="100%">
                                        <tr>
                                            <td align="left">
                                                <table style="background-color: #e6e6f5" width="100%" cellpadding-left="10">
                                                    <tr>
                                                        <td style="padding-left: 20px;">
                                                            <asp:Label ID="Label16" runat="server" Text="Sign In" Font-Bold="True"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 20px;">
                                                            <asp:Label ID="Label17" runat="server" Text="Email"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 20px;">
                                                            <asp:TextBox ID="txtLoginEmail" Width="70%" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email can not be empty" SetFocusOnError="true"
                                                                ControlToValidate="txtLoginEmail" ForeColor="Red" ValidationGroup="loginControl"></asp:RequiredFieldValidator>
                                                            <br />
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Invalid Email Address "
                                                                SetFocusOnError="true" ControlToValidate="txtLoginEmail" ValidationGroup="loginControl"
                                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 20px;">
                                                            <asp:Label ID="Label18" runat="server" Text="Password"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 20px;">
                                                            <asp:TextBox ID="txtLoginPassword" TextMode="Password" Width="70%" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password can not be empty"
                                                                ControlToValidate="txtLoginPassword" ForeColor="Red" ValidationGroup="loginControl" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            <br />
                                                            <%--  <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ForeColor="Red" ControlToValidate="txtLoginPassword"
                                                                      ErrorMessage="Contain 8 to 10 characters, one digit and one alphabetic character, and must not contain special characters."
                                                                     ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" ValidationGroup="loginControl" SetFocusOnError="true">
                                                                 </asp:RegularExpressionValidator>
                                                            --%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 20px;">
                                                            <asp:Label ID="Label19" runat="server" Text="Forgot your password?"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:CustomValidator ID="loginValidation" runat="server" ForeColor="Red" ErrorMessage="Login failed. Please check your username and password."
                                                                ValidationGroup="loginControl" Visible="false" SetFocusOnError="true"></asp:CustomValidator>
                                                            <asp:ValidationSummary ID="ValidationSummary" ValidationGroup="loginControl" runat="server"
                                                                DisplayMode="BulletList" CssClass="validationSummary" ForeColor="Red"></asp:ValidationSummary>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 20px;">
                                                            <asp:Button ID="btnSignIn" runat="server" Text="Sign In" OnClick="btnSignIn_Click" ValidationGroup="loginControl" />
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
                            </td>
                        </tr>

                    </table>
                </asp:Panel>
            </td>
            <td valign="top">
                <table width="100%">
                    <tr>
                        <td width="30%">
                            <a href="CPADetailsInfo.aspx">
                                <asp:Image ID="imgCPA" Height="150" Width="150" runat="server"></asp:Image></a>
                        </td>
                        <td>
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
            </td>
        </tr>
    </table>
    <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
