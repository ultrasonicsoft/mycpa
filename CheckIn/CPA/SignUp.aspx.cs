using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Net.Configuration;
using System.Web.Configuration;

namespace CheckIn.Web_Pages
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlCalender.Visible = false;
                //UpdateCaptchaText();
                //Calendar1.Visible = false;
            }
        }

        //private void UpdateCaptchaText()
        //{
        //    txtCaptchaText.Text = string.Empty;
        //    lblStatus.Visible = false;
        //    Session["Captcha"] = Guid.NewGuid().ToString().Substring(0, 6);
        //    var string1 = Session["Captcha"];

        //}
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (!Isvalididate())
                return;
            if (!ValidationSummary1.ShowMessageBox)
            {
                Guid userGuid1 = Guid.NewGuid();
                String userGuid = userGuid1.ToString();
                if (!SendEmail1(userGuid))
                {
                    return;
                }
                CustomerDetails newCustomer = new CustomerDetails();
                //TODO: use calendar control
                newCustomer.DateOfBirth = DateTime.Parse(txtDOB.Text);
                newCustomer.Email = txtEmail.Text;
                newCustomer.FirstName = txtFirstName.Text;
                newCustomer.LastName = txtLastName.Text;
                newCustomer.Password = txtPassword.Text;
               // newCustomer.PhoneNumber = txtPhoneNumber.Text;
                newCustomer.PhoneNumber=txtPhNumberPart1.Text+'-'+txtPhNumberPart2.Text+'-'+txtPhNumberPart3.Text;
                newCustomer.Gender = rbtnMale.Checked ? "M" : "F";
                int len = ImageUpload.PostedFile.ContentLength;
                byte[] pic = new byte[len];
                ImageUpload.PostedFile.InputStream.Read(pic, 0, len);
                newCustomer.Image = pic;
                newCustomer.ActivationToken = userGuid.ToString();
                newCustomer.CreatedDate = DateTime.Now;
               

                
                bool result = BusinessLogic.CreateNewTempCustomer(newCustomer);
                if (result)
                {
                    //TODO: set login user name. FormsAuthentication.SetCookies
                    //string user;

                    //Session["roleID"] = 1;

                    //int userID = BusinessLogic.GetNewUserID();
                    //Session["userID"] = userID;
                    //if ((user = BusinessLogic.GetLoggedInUserName(txtEmail.Text, txtPassword.Text)) != null)
                    //{
                    //    Session["userName"] = user;
                        Response.Redirect("~/CPA/VerifyEmail.aspx?Email=" + txtEmail.Text);
                   


                }
            }

        }
        
        //private bool SendEmail1()// local host
        //{
        //    bool result;
        //    Guid userGuid = Guid.NewGuid();
           
        //    string FromAddress = "prit.khim@gmail.com";
        //    string sendtext = "To confirm <a href= http://localhost:7988/CPA/VerifyEmail.aspx?userGuid=" + userGuid + ">Verify your account<a>";
        //    string to = txtEmail.Text;
        //    string subject = "Verification";
        //    System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage(FromAddress, to, subject, sendtext);
        //    System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
            
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
        private bool SendEmail1(string  userGuid)
        {
            bool result;
            var result1 = BusinessLogic.GetEmailDetail("3");
            string FromAddress = result1.Tables[0].Rows[0]["EmailFromAddress"].ToString();

            string sendtext = result1.Tables[0].Rows[0]["EmailContent"].ToString();
            sendtext=sendtext.Replace("{UserName}", txtFirstName.Text.ToString());

            sendtext= sendtext.Replace("{Email}", txtEmail.Text);
            sendtext= sendtext.Replace("{Password}", txtPassword.Text);
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
           //private bool SendEmail()
           // { 
           //    bool result;
           //   Guid userGuid = Guid.NewGuid();
           //     string FromAddress = "prit.khim@gmail.com";
           //     string sendtext = "To confirm <a href= http://localhost:7988/CPA/VerifyEmail.aspx?userGuid=" + userGuid + ">Verify your account<a>";
           //       string to = txtEmail.Text;

           //     MailMessage mm = new MailMessage(new MailAddress(FromAddress), new MailAddress(to));
           //     mm.Subject = "Verification";
           //     mm.Body = sendtext;
           //     mm.IsBodyHtml = true;
           //     SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
           //     smtp.Credentials = new NetworkCredential(FromAddress, "password");
           //     smtp.EnableSsl = true;
           //     try
           //     {
           //         smtp.Send(mm);
           //         //Page.ClientScript.RegisterStartupScript(this.GetType(), "test", "alert('Message Sent ... ');", true);
           //         result = true;

           //     }
           //     catch (SmtpException se)
           //     {
                    
           //         CustomValidator2.IsValid = false;
           //         result = false;

           //         //Page.ClientScript.RegisterStartupScript(this.GetType(), "test", "alert('Message Sent ... ');", true);
           //         //Response.Write(se);
           //     }
           //    return result;
           // }


        private bool IsTermsAccepted()
        {
            valTermsConditions.IsValid = cbTermCondition.Checked;

            return valTermsConditions.IsValid;
        }
    protected bool Isvalididate()
    {
        bool result;
        int count = 0;
        valTermsConditions.IsValid = cbTermCondition.Checked;

        if (!valTermsConditions.IsValid)
        {
            count = count + 1;
        }
       
        if (CaptchaUserControl.Text==txtCaptchaText.Text)//txtCaptchaText.Text.ToString()))
        {
            lblStatus.Visible = true;
           
                lblStatus.Text = "Success";
                lblStatus.ForeColor = System.Drawing.Color.Green;
            result = true;
            }
            else
            {   lblStatus.Visible = true;
                lblStatus.Text = "Failure";
                lblStatus.ForeColor = System.Drawing.Color.Red;

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

        if (count == 0)
            return true;
        else
            return false;
    }
    //protected void checkCheckBox(object source, ServerValidateEventArgs args)
    //{
    //    if (cbTermCondition.Checked == true)
    //    {
    //        args.IsValid = true;
    //    }
    //    else
    //    {
    //        args.IsValid = false;
    //    }

    //}


        protected void cbTermCondition_CheckedChanged(object sender, EventArgs e)
        {
            Page.Validate("signUpValidation");

            if (!IsTermsAccepted())
                return;

            if (!ValidationSummary1.ShowMessageBox)
            {
                btnSignUp.Enabled = cbTermCondition.Checked;
                txtPassword.Focus();
            }
            txtPassword.Text = txtPassword.Text;
           
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (pnlCalender.Visible)
            {
                
                //Calendar1.Visible = true;
                Calendar1.SelectedDate = DateTime.Today;
                pnlCalender.Visible=false;
            }
            else
            {
                pnlCalender.Visible = true;
                Calendar1.SelectedDate = DateTime.Today;
                
            }
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
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
            txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
            Calendar1.VisibleDate = Calendar1.SelectedDate;
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


        protected void btnPreYear_Click(object sender, EventArgs e)
        {
            DateTime now = DateTime.Now;
            TimeSpan span = now.AddYears(1) - now;


            Calendar1.SelectedDate = Calendar1.SelectedDate.Subtract(span);

            txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
            Calendar1.VisibleDate = Calendar1.SelectedDate;
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

       
       
        //protected void DateOfBirthValidation(object source, ServerValidateEventArgs args)
        //{
        //    if ( DateTime.Compare(DateTime.Today, Calendar1.SelectedDate.Date)>=0)
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