<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="DisplayAppointments.aspx.cs" Inherits="CheckIn.Web_Pages.DisplayAppointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
        <ContentTemplate>
            <table width="100%" style="background-color: #e6e6f5" cellpadding="10px">
                <tr>
                    <td width="10%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/CompanyLogo.jpg" Height="40" />
                    </td>
                    <td width="15%">
                       <%-- <asp:DropDownList ID="ddlSpeciality" runat="server" Width="100%">
                        </asp:DropDownList>--%>
                        <input type="text" id="txtCity" runat="server" value="Enter City" onclick="if (this.value == 'Enter City') { this.value = '' }" 
                            onblur="if(this.value==''){this.value='Enter City'}">
                    </td>
                    <td width="25%">
                       <%-- <asp:TextBox ID="txtZipCode" runat="server" Width="160px" Text="Enter Zip Code\City"></asp:TextBox>--%>
                         <input type="text" id="txtZipCode" runat="server" value="Enter Zip Code" onclick="if (this.value == 'Enter Zip Code') { this.value = '' }" 
                            onblur="if(this.value==''){this.value='Enter Zip Code'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnRefineSearch" runat="server" Text="Refine Search" OnClick="btnRefineSearch_Click" />
                    </td>
                    <td width="25%">
                       <%-- <asp:Label ID="lblSerchCriteria" runat="server"></asp:Label>--%>
                    </td>
                    
                </tr>
                

            </table>
            <br />
            <table width="100%">
                <tr>
                    <td align="center">
                        <asp:Label ID="lblSerchCriteria" runat="server">text</asp:Label>
                    </td>
                </tr>
            </table>
             
            
            <%--<asp:Label ID="Label5" runat="server" Text="text" ></asp:Label>--%>
            <br />
            <br />
           
            <table width="100%" style="background-color: #e6e6f5" cellpadding="8px">
                <tr>
                    <td style="background-color: #000079">
                        <asp:Label ID="Label1" runat="server" Text="1. Select CPA Appointment" Font-Bold="true"
                            ForeColor="White"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="2. Appointment Information"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="3. Personal Information"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="4. Finished!"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gvCPASearchResult" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                PageSize="2" AllowSorting="True" OnPageIndexChanging="gvCPASearchResult_PageIndexChanging"
                OnSorting="gvCPASearchResult_Sorting" OnRowDataBound="gvCPASearchResult_RowDataBound"  ShowHeaderWhenEmpty="true"
                OnDataBound="gvCPASearchResult_DataBound" >
                <EmptyDataTemplate>
                    No CPA available in specified Zip Code or City
                </EmptyDataTemplate>
                <PagerSettings Mode="Numeric" Position="TopAndBottom" NextPageText="&gt;" PreviousPageText="&lt;">
                </PagerSettings>
                <PagerStyle BackColor="LightBlue" Height="30px" VerticalAlign="Bottom" HorizontalAlign="Center" />
                <Columns>
                    <asp:TemplateField HeaderText="Certified Public Accountant" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                         
                                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="true" Font-Size="Medium"
                                            Text='<%# Bind("CompanyName")%>' NavigateUrl='<%# "~/CPA/CPADetailsInfo.aspx?CPAID="+Eval("CPAID") %>'></asp:HyperLink>


                                        <asp:Label ID="lblCPAID" runat="server" Text='<%# Bind("CPAID")%>' Visible="false"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="3">    
                                        <a href='<%# "CPADetailsInfo.aspx?CPAID="+Eval("CPAID") %>'>
                                            <asp:Image ID="Image2" Height="150" Width="150" runat="server" ImageUrl='<%# Eval("CPAID", "ImageCSharp.aspx?QueryCPAID={0}")%>'>
                                            </asp:Image></a>
                                        <%--<a href='<%# "CPADetails.aspx" %>'> <asp:Image ID="Image1" Height="200" Width="250" runat="server" ImageUrl='<%# Eval("CPAID", "ImageCSharp.aspx?QueryCPAID={0}")%>'  ></asp:Image></a>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblAddress1" runat="server" Text='<%# Bind("Address1")%>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblAddress2" runat="server" Text='<%# Bind("Address2")%>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City")%>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblState" runat="server" Text='<%# Bind("State")%>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblZipCode" runat="server" Text='<%# Bind("ZipCode")%>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center" SortExpression="Make">
                        <HeaderTemplate>
                            <asp:Button ID="btnPrevWeek" runat="server" Text="<<" OnClick="btnPrevWeek_Click"  />
                        </HeaderTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center" SortExpression="Make">
                        <HeaderTemplate>
                            <asp:Label ID="Label6" runat="server" Text="Monday"></asp:Label>
                            <br />
                            <asp:Label ID="lblMondayDate" runat="server" Text="1/1/2011"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNoAppointment" runat="server" />
                            <asp:Repeater ID="rptMondayAppointments" runat="server">
                                <ItemTemplate>
                                    <a href='<%# "BookAppointment.aspx?CPAID="+Eval("CPAID") + "&ScheduledTime=" +Eval("Time") + "&ScheduledDate=" +Eval("DateOnly") + "&ID=" +Eval("ID") %>'>
                                        <%# Eval("Time")%></a>
                                 
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center" SortExpression="Make">
                        <HeaderTemplate>
                            <asp:Label ID="lblTuesdayCaption" runat="server" Text="Tuesday"></asp:Label>
                            <br />
                            <asp:Label ID="lblTuesdayDate" runat="server" Text="2/1/2011"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Repeater ID="rptTuesdayAppointments" runat="server">
                                <ItemTemplate>
                                    <a href='<%# "BookAppointment.aspx?CPAID="+Eval("CPAID") + "&ScheduledTime=" +Eval("Time") + "&ScheduledDate=" +Eval("DateOnly") + "&ID=" +Eval("ID")%>'>
                                        <%# Eval("Time")%></a>
                                    <br />
                                </ItemTemplate>
                                
                            </asp:Repeater>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center" SortExpression="Make">
                        <HeaderTemplate>
                            <asp:Label ID="lblWednesdayCaption" runat="server" Text="Wednesday"></asp:Label>
                            <br />
                            <asp:Label ID="lblWednesdayDate" runat="server" Text="3/1/2011"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Repeater ID="rptWednesdayAppointments" runat="server">
                                <ItemTemplate>
                                    <a href='<%# "BookAppointment.aspx?CPAID="+Eval("CPAID") + "&ScheduledTime=" +Eval("Time") + "&ScheduledDate=" +Eval("DateOnly") + "&ID=" +Eval("ID")%>'>
                                        <%# Eval("Time")%></a>
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center" SortExpression="Make">
                        <HeaderTemplate>
                            <asp:Label ID="lblThursdayCaption" runat="server" Text="Thursday"></asp:Label>
                            <br />
                            <asp:Label ID="lblThursdayDate" runat="server" Text="4/1/2011"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Repeater ID="rptThursdayAppointments" runat="server">
                                <ItemTemplate>
                                   <a href='<%# "BookAppointment.aspx?CPAID="+Eval("CPAID") + "&ScheduledTime=" +Eval("Time") + "&ScheduledDate=" +Eval("DateOnly") + "&ID=" +Eval("ID")%>'>
                                        <%# Eval("Time")%></a>
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center" SortExpression="Make">
                        <HeaderTemplate>
                            <asp:Label ID="lblFridayCaption" runat="server" Text="Friday"></asp:Label>
                            <br />
                            <asp:Label ID="lblFridayDate" runat="server" Text="5/1/2011"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Repeater ID="rptFridayAppointments" runat="server">
                                <ItemTemplate>
                                   <a href='<%# "BookAppointment.aspx?CPAID="+Eval("CPAID") + "&ScheduledTime=" +Eval("Time") + "&ScheduledDate=" +Eval("DateOnly") + "&ID=" +Eval("ID") %>'>
                                        <%# Eval("Time")%></a>
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center" SortExpression="Make">
                        <HeaderTemplate>
                            <asp:Label ID="lblSaturdayCaption" runat="server" Text="Saturday"></asp:Label>
                            <br />
                            <asp:Label ID="lblSaturdayDate" runat="server" Text="6/1/2011"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Repeater ID="rptSaturdayAppointments" runat="server">
                                <ItemTemplate>
                                    <a href='<%# "BookAppointment.aspx?CPAID="+Eval("CPAID") + "&ScheduledTime=" +Eval("Time") + "&ScheduledDate=" +Eval("DateOnly") + "&ID=" +Eval("ID") %>'>
                                        <%# Eval("Time")%></a>
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center" SortExpression="Make">
                        <HeaderTemplate>
                            <asp:Label ID="lblSundayCaption" runat="server" Text="Sunday"></asp:Label>
                            <br />
                            <asp:Label ID="lblSundayDate" runat="server" Text="6/1/2011"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Repeater ID="rptSundayAppointments" runat="server">
                                <ItemTemplate>
                                   <a href='<%# "BookAppointment.aspx?CPAID="+Eval("CPAID") + "&ScheduledTime=" +Eval("Time") + "&ScheduledDate=" +Eval("DateOnly") + "&ID=" +Eval("ID") %>'>
                                        <%# Eval("Time")%></a>
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center" SortExpression="Make">
                        <HeaderTemplate>
                            <asp:Button ID="btnNextWeek" runat="server" Text=">>" OnClick="btnNextWeek_Click" />
                        </HeaderTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
