using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckIn.CPA
{
    public partial class UserProfile : System.Web.UI.Page
    {
        #region

        private string specialityID = string.Empty;
        private string zipCode = string.Empty;

        #endregion
        public string userID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack )
            {

                //if (Request.QueryString.Count == 1)
                //{
                //    specialityID = Request.QueryString["SpecialityID"];

                //}

                //if (Request.QueryString.Count == 2)
                //{
                //    specialityID = Request.QueryString["SpecialityID"];
                //    zipCode = Request.QueryString["ZipCode"];
                //}
                if (Request.QueryString["UserID"] != null)
                {
                    userID = Request.QueryString["UserID"];
                    Session["userID"] = userID;
                }
                else
                {
                    userID = Session["userID"].ToString();
                }
                 FillAllSpeciality();
                 RefreshUserProfile();
                // DisableTextBox();
                 pnlUserProfile.Visible = true;
                 pnlEditUserProfile.Visible = false;
                pnlCalender.Visible = false;
            
            }
        }
        private void RefreshUserProfile()
        {
           // var result = BusinessLogic.GetuserProfileDetail(int.Parse(Session["userID"].ToString()));
            var result = BusinessLogic.GetuserProfileDetail(int.Parse(Session["userID"].ToString()));
            //var result = BusinessLogic.GetuserProfileDetail(int.Parse("19"));
            //var result = BusinessLogic.GetuserProfileDetail(int.Parse("3"));
            if (result == null || result.Tables[0].Rows.Count == 0)
                return;
            lblEmail.Text = result.Tables[0].Rows[0]["Email"].ToString();
           
            lblFirstName.Text = result.Tables[0].Rows[0]["FirstName"].ToString();
            lblLastName.Text = result.Tables[0].Rows[0]["LastName"].ToString();
            lblDOB.Text = result.Tables[0].Rows[0]["Month"].ToString() + "/" + result.Tables[0].Rows[0]["Date"].ToString() + "/" + result.Tables[0].Rows[0]["Year"].ToString();
            if (result.Tables[0].Rows[0]["Gender"].ToString() == "M")
            {
                lblGender.Text = "Male";

            }
            else
            {
                lblGender.Text = "Female";
            }

            lblPhoneNumber.Text = result.Tables[0].Rows[0]["Phone"].ToString();
            imgUser.ImageUrl = "UserHandler.ashx?UserID=" + Session["userID"];
            
           
            // txtPassword.Text=re

        }
        //private void DisableTextBox()
        //{
        
        //    txtEmail.Enabled = false;
        //    txtPassword.Enabled = false;
        //    txtFirstName.Enabled = false;
        //    txtLastName.Enabled = false;
        //    txtDOB.Enabled = false;
        //    imgBtnCalender.Visible = false;
        //    rbtnMale.Enabled = false;
        //    rbtnFemale.Enabled = false;
        //    txtPhoneNumber.Enabled = false;
        //}

        //private void EnableTextBox()
        //{

        //    txtEmail.Enabled = true;
        //    txtPassword.Enabled = true;
        //    txtFirstName.Enabled = true;
        //    txtLastName.Enabled = true;
        //    txtDOB.Enabled = true;
        //    imgBtnCalender.Visible = true;
        //    rbtnMale.Enabled = true;
        //    rbtnFemale.Enabled = true;
        //    txtPhoneNumber.Enabled = true;
        //}

        private void FillAllSpeciality()
        {
            var result = BusinessLogic.GetAllSpecializationList();
            //ddlSpeciality.DataSource = result.Tables[0];
            //ddlSpeciality.DataTextField = result.Tables[0].Columns["Speciality"].ColumnName.ToString();
            //ddlSpeciality.DataValueField = result.Tables[0].Columns["ID"].ColumnName.ToString();
            //ddlSpeciality.DataBind();
        }

        private void UpdateUserProfile()
        {
            var result = BusinessLogic.GetuserProfileDetail(int.Parse(Session["userID"].ToString()));//(Session["userID"].ToString()));
           //var result = BusinessLogic.GetuserProfileDetail(int.Parse("19"));
           //var result = BusinessLogic.GetuserProfileDetail(int.Parse("3"));
            if (result == null || result.Tables[0].Rows.Count == 0)
                return;
            txtEmail.Text = result.Tables[0].Rows[0]["Email"].ToString();
            txtPassword.Text = result.Tables[0].Rows[0]["Password"].ToString();
            txtFirstName.Text = result.Tables[0].Rows[0]["FirstName"].ToString();
            txtLastName.Text = result.Tables[0].Rows[0]["LastName"].ToString();
            txtDOB.Text = result.Tables[0].Rows[0]["Month"].ToString() + "/" + result.Tables[0].Rows[0]["Date"].ToString() + "/" + result.Tables[0].Rows[0]["Year"].ToString();
            if (result.Tables[0].Rows[0]["Gender"].ToString() == "M")
            {
                rbtnMale.Checked = true;

            }
            else
            {
                rbtnFemale.Checked = true;
            }

            //txtPhoneNumber.Text = result.Tables[0].Rows[0]["Phone"].ToString();
            string phone = result.Tables[0].Rows[0]["Phone"].ToString();
            string[] ph = phone.Split('-');
            txtPhNumberPart1.Text = ph[0];
            txtPhNumberPart2.Text = ph[1];
            txtPhNumberPart3.Text = ph[2];


            imgEditUser.ImageUrl = "UserHandler.ashx?UserID=" + Session["userID"]; 
           // txtPassword.Text=re
          
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
           
            if (count == 0)
                return true;
            else
                return false;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Isvalididate())
                return;
            CustomerDetails customer = new CustomerDetails();
            //TODO: use calendar control
            customer.UserID = Session["userID"].ToString();
            //customer.UserID = "3";
            customer.Email = txtEmail.Text;
            customer.Password = txtPassword.Text;
            customer.FirstName = txtFirstName.Text;
            customer.LastName = txtLastName.Text;

            customer.DateOfBirth = DateTime.Parse(txtDOB.Text);
            customer.Gender = rbtnMale.Checked ? "M" : "F";
            customer.PhoneNumber = txtPhNumberPart1.Text + '-' + txtPhNumberPart2.Text + '-' + txtPhNumberPart3.Text;
            if (ImageUpload.HasFile)
            {
                int len = ImageUpload.PostedFile.ContentLength;
                byte[] pic = new byte[len];
                ImageUpload.PostedFile.InputStream.Read(pic, 0, len);
                customer.Image = pic;

            }
            else
            {
                customer.Image = BusinessLogic.GetUserImage(int.Parse(Session["userID"].ToString()));
            }

             bool result=BusinessLogic.UpdateCustomerDetails(customer);

             if (result)
             {
                Session["userName"] = txtFirstName.Text;
                System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Save Sucessful')</SCRIPT>");
                pnlEditUserProfile.Visible = false;
                RefreshUserProfile();
                pnlUserProfile.Visible = true;
             }
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            RefreshUserProfile();
            pnlEditUserProfile.Visible = false;
            pnlUserProfile.Visible = true;
        
        }

        #region Refine Search

        protected void btnRefineSearch_Click(object sender, EventArgs e)
        {
            GetCurrentSearchFilter();

            RefreshUserProfile();
        }

        private void GetCurrentSearchFilter()
        {
            //string specialityID = ddlSpeciality.SelectedItem.Value;
            //string zipCode = string.IsNullOrEmpty(txtZipCode.Text) || txtZipCode.Text.Equals(@"Enter Zip Code\City") ? string.Empty : txtZipCode.Text;

            //string redirectQuery = string.Format("~/CPA/DisplayAppointments.aspx?SpecialityID={0}&ZipCode={1}", specialityID, zipCode);
            //Response.Redirect(redirectQuery);
            string city = txtCity.Value;
            string zipCode = txtZipCode.Value;
            string redirectQuery = string.Format("~/CPA/DisplayAppointments.aspx?City={0}&ZipCode={1}", city, zipCode);
            Response.Redirect(redirectQuery);
        }

        #endregion

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            //EnableTextBox();
            UpdateUserProfile();
            //btnEdit.Visible = false;
            pnlEditUserProfile.Visible = true;
            pnlUserProfile.Visible = false;
        }

      

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            if (DateTime.Compare(DateTime.Today, Calendar1.SelectedDate.Date) >= 0)
            {
                txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
                Calendar1.Visible = false;
                CustomValidator1.IsValid = true;
            }

            else
            {
                txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
                Calendar1.Visible = false;
                CustomValidator1.IsValid = false;
            }
        }

        protected void imgBtnCalender_Click(object sender, ImageClickEventArgs e)
        {
            pnlCalender.Visible = true;
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
    }
}