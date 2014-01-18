using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckIn.Web_Pages
{
    public partial class CPASignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               

                FillAllState();
                
                txtSpeciality.Visible=false;
                FillSpeciality();
                pnlCalender.Visible = false;
            }
             if (Session["FileUpload"] == null && ImageUpload.HasFile)
            {
                Session["FileUpload"] = ImageUpload;
                lblFile.Text = ImageUpload.FileName;
            }
            // Next time submit and Session has values but FileUpload is Blank 
            // Return the values from session to FileUpload 
            else if (Session["FileUpload"] != null && (!ImageUpload.HasFile))
            {
                ImageUpload = (FileUpload)Session["FileUpload"];
                lblFile.Text = ImageUpload.FileName;
            }
            // Now there could be another sictution when Session has File but user want to change the file 
            // In this case we have to change the file in session object 
            else if (ImageUpload.HasFile)
            {
                Session["FileUpload"] = ImageUpload;
                lblFile.Text = ImageUpload.FileName;
            }
        }
        
        private void FillAllState()
        {
            


            var result = BusinessLogic.GetAllStateList();
            ddlState.DataSource = result.Tables[0];
            ddlState.Items.Clear();
            ddlState.Items.Add("--Please Select State--");

            ddlState.DataTextField = result.Tables[0].Columns["StateName"].ColumnName.ToString();
            ddlState.DataValueField = result.Tables[0].Columns["State_Code"].ColumnName.ToString();
            ddlState.DataBind();

        }
        private void FillSpeciality()
        {
            var result = BusinessLogic.GetAllSpecializationList();
            ddlSpeciality.DataSource = result.Tables[0];
            ddlSpeciality.Items.Clear();
            ddlSpeciality.Items.Add("--Please Select Speciality--");
            ddlSpeciality.DataTextField = result.Tables[0].Columns["Speciality"].ColumnName.ToString();
            ddlSpeciality.DataValueField = result.Tables[0].Columns["ID"].ColumnName.ToString();


            ddlSpeciality.DataBind();

            int last = ddlSpeciality.Items.Count;
            ddlSpeciality.Items.Insert(last, "Other");

            ddlSpeciality.Items.FindByValue("Other").Text = "Other";
            ddlSpeciality.Items.FindByValue("Other").Value = (BusinessLogic.GetNewSpecialityID()).ToString();


            //var result = BusinessLogic.GetAllStateList();
            //ddlState.DataSource = result.Tables[0];
            //ddlState.Items.Clear();
            //ddlState.Items.Add("--Please Select State--");

            //ddlState.DataTextField = result.Tables[0].Columns["StateName"].ColumnName.ToString();
            //ddlState.DataValueField = result.Tables[0].Columns["State_Code"].ColumnName.ToString();
            //ddlState.DataBind();

        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {

            if (!Isvalididate())
                return;
            Guid userGuid1 = Guid.NewGuid();
            string userGuid = userGuid1.ToString();
            if (!SendEmail1(userGuid))
            {
                return;
            }
            if (Page.IsValid)
            {
                CPADetails newCPA = new CPADetails();
                //TODO: use calendar control
                newCPA.CompanyName = txtCompanyName.Text;
                newCPA.DateOfBirth = DateTime.Parse(txtDOB.Text);
                newCPA.Email = txtEmail.Text;
                newCPA.FirstName = txtFirstName.Text;
                newCPA.LastName = txtLastName.Text;
                newCPA.Password = txtPassword.Text;
                newCPA.PhoneNumber = txtPhNumberPart1.Text + '-' + txtPhNumberPart2.Text + '-' + txtPhNumberPart3.Text;
                newCPA.Gender = rbtnMale.Checked ? "M" : "F";

                newCPA.Address1 = txtOfficeAddress1.Text;
                newCPA.Address2 = txtOfficeAddress2.Text;
                newCPA.ZipCode = txtZipCode.Text;
                newCPA.State = ddlState.SelectedItem.Text;
                newCPA.City = ddlCity.SelectedItem.Text;
               
                //TODO: check how to handle speciality
               // newCPA.SpecialityID = ddlSpeciality.SelectedValue;
                newCPA.Speciality = txtSpeciality.Text ;

                int len = ImageUpload.PostedFile.ContentLength;
                byte[] pic = new byte[len];
                ImageUpload.PostedFile.InputStream.Read(pic, 0, len);
                newCPA.Image = pic;
          
                newCPA.ActivationToken = userGuid.ToString();
                newCPA.CreatedDate = DateTime.Now;

                bool result = BusinessLogic.CreateNewTempCPA(newCPA);
                //if (result)
                //{
                //    //TODO: set login user name. FormsAuthentication.SetCookies
                //    Session["roleID"] = 2;

                //    string user;

                //    if ((user = BusinessLogic.GetLoggedInCPAName(txtEmail.Text, txtPassword.Text)) != null)
                //    {
                //        Session["userName"] = user;
                //    }
                //    int userID = BusinessLogic.GetNewUserID();
                //    Session["userID"] = userID;
                //    Response.Redirect("~/CPA/ManageAppointment.aspx");
                //}
                if (result)
                {

                    Response.Redirect("~/CPA/VerifyEmail.aspx?Email=" + txtEmail.Text);
                }
            }
        }
        private bool SendEmail1(string userGuid)
        {
            bool result;
            var result1 = BusinessLogic.GetEmailDetail("4");
            string FromAddress = result1.Tables[0].Rows[0]["EmailFromAddress"].ToString();

            string sendtext = result1.Tables[0].Rows[0]["EmailContent"].ToString();
            sendtext = sendtext.Replace("{UserName}", txtFirstName.Text);

            sendtext = sendtext.Replace("{Email}", txtEmail.Text);
            sendtext = sendtext.Replace("{Password}", txtPassword.Text);
            sendtext = sendtext.Replace("{userGuid}", userGuid.ToString());


            string to = txtEmail.Text;
            string subject = result1.Tables[0].Rows[0]["EmailSubject"].ToString();

            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage(FromAddress, to, subject, sendtext);
            if (result1.Tables[0].Rows[0]["EmailContentType"].ToString() == "H")
            {
                mail.IsBodyHtml = true;
            }
            System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient(result1.Tables[0].Rows[0]["EmailServerHost"].ToString(), int.Parse(result1.Tables[0].Rows[0]["EmailServerPort"].ToString()));
            client.Credentials = new NetworkCredential(FromAddress, result1.Tables[0].Rows[0]["EmailPassword"].ToString());
            client.EnableSsl = true;
            try
            {
                client.Send(mail);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "test", "alert('Message Sent ... ');", true);
                result = true;

            }
            catch (SmtpException se)
            {

                CustomValidator2.IsValid = false;
                result = false;

                //Page.ClientScript.RegisterStartupScript(this.GetType(), "test", "alert('Message Sent ... ');", true);
                //Response.Write(se);
            }
            return result;
        }
        //private bool SendEmail1(Guid userGuid)
        //{
        //    bool result;
        //    //Guid userGuid = Guid.NewGuid();
        //    SmtpSection cfg = NetSectionGroup.GetSectionGroup(WebConfigurationManager.OpenWebConfiguration("~/web.config")).MailSettings.Smtp;

        //    string FromAddress = cfg.From;
        //    string sendtext = "To confirm CPA <a href= http://localhost:7988/CPA/ValidatedUser1.aspx?Token=" + userGuid + ">Verify your account<a>";
        //    string to = txtEmail.Text;
        //    string subject = "Verification";

        //    System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage(FromAddress, to, subject, sendtext);
        //    mail.IsBodyHtml = true;
        //    System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient(cfg.Network.Host, cfg.Network.Port);
        //    client.Credentials = new NetworkCredential(FromAddress, cfg.Network.Password);
        //    client.EnableSsl = true;
        //    try
        //    {
        //        client.Send(mail);
        //        //Page.ClientScript.RegisterStartupScript(this.GetType(), "test", "alert('Message Sent ... ');", true);
        //        result = true;

        //    }
        //    catch (SmtpException se)
        //    {

        //        CustomValidator2.IsValid = false;
        //        result = false;

        //        //Page.ClientScript.RegisterStartupScript(this.GetType(), "test", "alert('Message Sent ... ');", true);
        //        //Response.Write(se);
        //    }
        //    return result;
        //}
        private bool IsTermsAccepted()
        {
            valTermsConditions.IsValid = cbTermCondition.Checked;

            return valTermsConditions.IsValid;
        }
        protected bool Isvalididate()
        {
            bool result;
            int count = 0;

            if (string.IsNullOrWhiteSpace(txtFirstName.Text) || txtFirstName.Text.Contains(' '))
            {
                CustValFisrtName.IsValid = false;
                CustValFisrtName.ErrorMessage = "First name should not contain spaces";
                result = false;
                count = count + 1;
            }

            else if (System.Text.RegularExpressions.Regex.IsMatch(txtFirstName.Text, @"^[a-zA-Z]{1,25}$"))
            {
                CustValFisrtName.IsValid = true;
                result = true;
            }
            else
            {
                CustValFisrtName.IsValid = false;
                CustValFisrtName.ErrorMessage = "Only Alphabet allowed here";
                result = false;
                count = count + 1;
            }

            if (CaptchaUserControl.Text == txtCaptchaText.Text)//txtCaptchaText.Text.ToString()))
            {
                lblStatus.Visible = true;

                lblStatus.Text = "Success";
                lblStatus.ForeColor = System.Drawing.Color.Green;
                result = true;
            }
            else
            {
                lblStatus.Visible = true;
                lblStatus.Text = "Failure";
                lblStatus.ForeColor = System.Drawing.Color.Red;

                result = false;
                count = count + 1;
            }
            if (string.IsNullOrWhiteSpace(txtLastName.Text) || txtLastName.Text.Contains(' '))
            {
                CustValLastName.IsValid = false;
                CustValLastName.ErrorMessage = "Last name should not contain spaces";
                result = false;
                count = count + 1;
            }

            else if (System.Text.RegularExpressions.Regex.IsMatch(txtLastName.Text, @"^[a-zA-Z]{1,25}$"))
            {
                CustValLastName.IsValid = true;
                result = true;
            }
            else
            {
                CustValFisrtName.IsValid = false;
                CustValFisrtName.ErrorMessage = "Only Alphabet allowed here";
                result = false;
                count = count + 1;
            }


            if (System.Text.RegularExpressions.Regex.IsMatch(txtPhNumberPart1.Text + "-" + txtPhNumberPart2.Text + "-" + txtPhNumberPart3.Text, @"^[2-9]\d{2}-\d{3}-\d{4}$"))
            {
                CustPhoneNumber.IsValid = true;
                result = true;
            }
            else
            {
                CustPhoneNumber.IsValid = false;
                count = count + 1;
            }
            if (cbTermCondition.Checked)
            {
                valTermsConditions.IsValid = cbTermCondition.Checked;
                result = true;
            }
            else
            {
                valTermsConditions.IsValid = false;
                count = count + 1;
                result = false;
            }
            if (count == 0)
                return true;
            else
                return false;
        }
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {

            string stateCode = ddlState.SelectedItem.Value.ToString();

            var result = BusinessLogic.GetAllCityList(stateCode);
            ddlCity.DataSource = result.Tables[0];
            ddlCity.Items.Clear();
            ddlCity.Items.Add("--Please Select City--");
            ddlCity.DataTextField = result.Tables[0].Columns["CityName"].ColumnName.ToString();
            ddlCity.DataValueField = result.Tables[0].Columns["CityID"].ColumnName.ToString();
            ddlCity.DataBind();
            //if (ddlState.Text!= "--Please Select State--")
            //{
            //    CompareddlState.IsValid = true;
            //}
            //if (ddlState.Text == "--Please Select State--")
            //{
            //    CompareddlState.IsValid = false;
            //}
        
        }

        protected void imgBtnCalender_Click(object sender, ImageClickEventArgs e)
        {
            if (pnlCalender.Visible)
            {

                //Calendar1.Visible = true;
                Calendar1.SelectedDate = DateTime.Today;
                pnlCalender.Visible = false;
            }
            else
            {
                pnlCalender.Visible = true;
                Calendar1.SelectedDate = DateTime.Today;

            }
      
        }


        protected bool ValidDate()
        {
            if (DateTime.Compare(DateTime.Today, Calendar1.SelectedDate.Date) >= 0)
            {
                txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
                //Calendar1.Visible = false;
                CustomValidator1.IsValid = true;
                
            }
            else
            {
                txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
                //Calendar1.Visible = false;
                CustomValidator1.IsValid = false;
            }
            return CustomValidator1.IsValid;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

            if (DateTime.Compare(DateTime.Today, Calendar1.SelectedDate.Date) >= 0)
            {
                txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
               // Calendar1.Visible = false;
                CustomValidator1.IsValid = true;
            }

            else
            {
                txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
               // Calendar1.Visible = false;
                CustomValidator1.IsValid = false;
            }
        }

        protected void ddlSpeciality_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSpeciality.SelectedItem.Text == "Other")
            {

                txtSpeciality.Visible = true;
                txtSpeciality.Text = "";

            }
            else
            {
                txtSpeciality.Visible = false;

                txtSpeciality.Text = ddlSpeciality.SelectedItem.Text;
            }
        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (ddlCity.Text != "--Please Select city--")
            //{
            //    CompareddlCity.IsValid = true;
            //}
            //if(ddlCity.Text=="--Please Select city--")
            //{
            //    CompareddlCity.IsValid = false;
            //}

        }

        protected void btnPreYear_Click(object sender, EventArgs e)
        {

            DateTime now = DateTime.Now;
            TimeSpan span = now.AddYears(1) - now;


            Calendar1.SelectedDate = Calendar1.SelectedDate.Subtract(span);
            Calendar1.VisibleDate = Calendar1.SelectedDate;
            txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();

            if (DateTime.Compare(DateTime.Today, Calendar1.SelectedDate.Date) >= 0)
            {
                txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
                //Calendar1.Visible = false;

                CustomValidator1.IsValid = true;
                // pnlCalender.Visible = false;
            }

            else
            {
                txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
                //Calendar1.Visible = false;
                CustomValidator1.IsValid = false;

            }
        }

        protected void btnNextYear_Click(object sender, EventArgs e)
        {

            Calendar1.Visible = false;
            Calendar1.SelectedDate = Calendar1.SelectedDate.AddYears(1);
            Calendar1.Visible = true;
            Calendar1.VisibleDate = Calendar1.SelectedDate;
            txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
            if (DateTime.Compare(DateTime.Today, Calendar1.SelectedDate.Date) >= 0)
            {
                txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
                //Calendar1.Visible = false;

                CustomValidator1.IsValid = true;
                // pnlCalender.Visible = false;
            }

            else
            {
                txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
                //Calendar1.Visible = false;
                CustomValidator1.IsValid = false;

            }
        }
        //protected void checkCheckBox1(object source, ServerValidateEventArgs args)
        //{
        //    if (cbTermCondition1.Checked == true)
        //    {
        //        args.IsValid = true;
        //    }
        //    else
        //    {
        //        args.IsValid = false;
        //    }
        //}

        
    }
}