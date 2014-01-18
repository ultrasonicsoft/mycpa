using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckIn.CPA
{
    public partial class CPAProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                //pnlCPAProfile.Visible = true;
                RefreshUserDetails();
                pnlEditCPAProfile.Visible = false;
               // pnlCPAProfile.Visible = true;
                pnlCalender.Visible = false;
                txtSpeciality.Visible = false;
            }
            
        }
        private void RefreshUserDetails()
        {
            var result = BusinessLogic.GetCPAProfileDetail(int.Parse(Session["userID"].ToString()));
            //var result = BusinessLogic.GetuserProfileDetail(int.Parse("3"));
            if (result == null || result.Tables[0].Rows.Count == 0)
                return;
            lblCompanyName.Text = result.Tables[0].Rows[0]["CompanyName"].ToString();
            lblOfficeAddress1.Text = result.Tables[0].Rows[0]["Address1"].ToString();
            lblOfficeAddress2.Text = result.Tables[0].Rows[0]["Address2"].ToString();
            lblPractingCity.Text = result.Tables[0].Rows[0]["City"].ToString();
            lblPractingState.Text = result.Tables[0].Rows[0]["State"].ToString();
            lblZipCode.Text = result.Tables[0].Rows[0]["ZipCode"].ToString();
            lblEmail.Text = result.Tables[0].Rows[0]["Email"].ToString();

            lblName.Text = result.Tables[0].Rows[0]["FirstName"].ToString() + " " + result.Tables[0].Rows[0]["LastName"].ToString();
            //string str = string.Format("~/Doc/ImageCSharp.aspx?CPAID={0}", Session["userID"]);
            imgCPA.ImageUrl = "Handler.ashx?QueryCPAID=" + Session["userID"];
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
            lblSpeciality.Text = BusinessLogic.GetSpeciatityByID(result.Tables[0].Rows[0]["SpecialityID"].ToString()); 


        }
        private void EditUserDetails()
        {
            var result = BusinessLogic.GetCPAProfileDetail(int.Parse(Session["userID"].ToString()));
           //var result = BusinessLogic.GetuserProfileDetail(int.Parse("3"));
            if (result == null || result.Tables[0].Rows.Count == 0)
                return;
            txtCompanyName.Text = result.Tables[0].Rows[0]["CompanyName"].ToString();
            txtOfficeAddress1.Text = result.Tables[0].Rows[0]["Address1"].ToString();
            txtOfficeAddress2.Text = result.Tables[0].Rows[0]["Address2"].ToString();
            string PractingState = result.Tables[0].Rows[0]["State"].ToString();
            FillState(PractingState);
            string Practingcity = result.Tables[0].Rows[0]["City"].ToString();
            
            FillCity(Practingcity);
           
            txtZipCode.Text = result.Tables[0].Rows[0]["ZipCode"].ToString();
            txtEmail.Text = result.Tables[0].Rows[0]["Email"].ToString();
            txtPassword.Text = result.Tables[0].Rows[0]["Password"].ToString();
            txtFirstName.Text = result.Tables[0].Rows[0]["FirstName"].ToString();
            txtLastName.Text = result.Tables[0].Rows[0]["LastName"].ToString();
            //string str = string.Format("~/Doc/ImageCSharp.aspx?CPAID={0}", Session["userID"]);
            imgEditCPA.ImageUrl = "Handler.ashx?QueryCPAID=" + Session["userID"];
            
            txtDOB.Text=result.Tables[0].Rows[0]["Month"].ToString() + "/" + result.Tables[0].Rows[0]["Date"].ToString() + "/" + result.Tables[0].Rows[0]["Year"].ToString();
            if (result.Tables[0].Rows[0]["Gender"].ToString() == "M")
            {
                rbtnMale.Checked = true;

            }
            else
            {
                rbtnFemale.Checked = true;
            }

          //txtPhoneNumber.Text = result.Tables[0].Rows[0]["Phone"].ToString()
            string phone = result.Tables[0].Rows[0]["Phone"].ToString();
            string[] ph=phone.Split('-');
            txtPhNumberPart1.Text=ph[0];
            txtPhNumberPart2.Text = ph[1];
            txtPhNumberPart3.Text = ph[2];

           // txtSpeciality.Text =BusinessLogic.GetSpeciatityByID( result.Tables[0].Rows[0]["SpecialityID"].ToString());
           string speciality =BusinessLogic.GetSpeciatityByID( result.Tables[0].Rows[0]["SpecialityID"].ToString());
           txtSpeciality.Text = speciality;
            FillSpeciality(speciality);
           //int len = ImageUpload.PostedFile.ContentLength;
            //byte[] pic = new byte[len];
            //ImageUpload.PostedFile.InputStream.Read(pic, 0, len);
            //for (int i = 0, count = 0; i < len; i++)
            //{
            //    if (pic[i] == null)
            //    { }

            //}

            // byte[] j= pic;

          
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
           
            CPADetails CPAUser =new CPADetails();
            //TODO: use calendar control
            CPAUser.UserID = Session["userID"].ToString();
            //customer.UserID = "3";
            CPAUser.CompanyName=txtCompanyName.Text;
            CPAUser.Address1=txtOfficeAddress1.Text;
            CPAUser.Address2=txtOfficeAddress2.Text;
            CPAUser.City = ddlCity.SelectedItem.Text;
            CPAUser.State = ddlState.SelectedItem.Text;
            CPAUser.ZipCode=txtZipCode.Text;
            CPAUser.PhoneNumber = txtPhNumberPart1.Text + "-" + txtPhNumberPart2.Text + "-" + txtPhNumberPart3.Text;
            CPAUser.FirstName = txtFirstName.Text;
            CPAUser.LastName = txtLastName.Text;
          //  CPAUser.Image=
           // string str = txtDD.Text + "/" + txtMM.Text + "/" + txtYYYY.Text;
            CPAUser.DateOfBirth = DateTime.Parse(txtDOB.Text);
            CPAUser.Gender = rbtnMale.Checked ? "M" : "F";
            //if (ddlSpeciality.SelectedValue == "Other")
            //{
            //    CPAUser.Speciality = BusinessLogic.GetNewSpecialityID().ToString();
            //}
            //else
            //{
            //    CPAUser.Speciality = ddlSpeciality.SelectedValue;
            //}
            CPAUser.SpecialityID = ddlSpeciality.SelectedValue;
            CPAUser.Speciality = txtSpeciality.Text;
            CPAUser.Email = txtEmail.Text;
            CPAUser.Password = txtPassword.Text;

            //Session["Image"] = "Handler.ashx?QueryCPAID=" + Session["userID"];
            if (ImageUpload.HasFile)
            {
                int len = ImageUpload.PostedFile.ContentLength;
                byte[] pic = new byte[len];
                ImageUpload.PostedFile.InputStream.Read(pic, 0, len);
                CPAUser.Image = pic;

            }
            else
            {
                CPAUser.Image=BusinessLogic.GetCPAImage(int.Parse(Session["userID"].ToString()));
            }
            //CPAUser.DateOfBirth = DateTime.Parse(txtDD.Text + "/" + txtMM.Text + "/" + txtYYYY.Text);
          

             bool result=BusinessLogic.UpdateCPADetails(CPAUser);

             if (result)
             {
                 Session["userName"] = txtFirstName.Text;
                System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Save Sucessful')</SCRIPT>");
                RefreshUserDetails();
                pnlEditCPAProfile.Visible = false;
                pnlCPAProfile.Visible = true; 
             }

           
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlEditCPAProfile.Visible = false;
            pnlCPAProfile.Visible = true;
            
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            //FillState();
            //FillCity();
            EditUserDetails();
            pnlEditCPAProfile.Visible = true;
            pnlCPAProfile.Visible = false;
            
           
        }
        private void FillState(string PractingState)
        {
            //var result = BusinessLogic.GetAllSpecializationList();
            //ddlSpeciality.DataSource = result.Tables[0];
            //ddlSpeciality.DataTextField = result.Tables[0].Columns["Speciality"].ColumnName.ToString();
            //ddlSpeciality.DataValueField = result.Tables[0].Columns["ID"].ColumnName.ToString();
            //ddlSpeciality.DataBind();


            var result = BusinessLogic.GetAllStateList();
            ddlState.DataSource = result.Tables[0];
            ddlState.Items.Clear();
            ddlState.Items.Add("--Please Select State--");

            ddlState.DataTextField = result.Tables[0].Columns["StateName"].ColumnName.ToString();
            ddlState.DataValueField = result.Tables[0].Columns["State_Code"].ColumnName.ToString();
            ddlState.DataBind();
            for(int i=0;i<result.Tables[0].Rows.Count;i++)
            {
                DataRow dr = result.Tables[0].Rows[i];
                if (dr["StateName"].ToString() == PractingState)
                {
                    ddlState.SelectedValue = dr["State_Code"].ToString();
                }
              

            }
            
        }
        private void FillSpeciality(string Speciality)
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



            for (int i = 0; i < result.Tables[0].Rows.Count; i++)
            {
                DataRow dr = result.Tables[0].Rows[i];
                if (dr["Speciality"].ToString() == Speciality)
                {
                    ddlSpeciality.SelectedValue = dr["ID"].ToString();
                }


            }

        }
        private void FillCity(string PractingCity)
        {

             string stateCode = ddlState.SelectedItem.Value.ToString();
            var result = BusinessLogic.GetAllCityList(stateCode);
            ddlCity.DataSource = result.Tables[0];
            ddlCity.Items.Clear();
            ddlCity.Items.Add("--Please Select City--");
            ddlCity.DataTextField = result.Tables[0].Columns["CityName"].ColumnName.ToString();
            ddlCity.DataValueField = result.Tables[0].Columns["CityID"].ColumnName.ToString();
            ddlCity.DataBind(); 
            for (int i = 0; i < result.Tables[0].Rows.Count; i++)
            {
                DataRow dr = result.Tables[0].Rows[i];
                if (dr["CityName"].ToString() == PractingCity)
                {
                    ddlCity.SelectedValue = dr["CityID"].ToString();
                }


            }
            
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
            //for (int i = 0; i < result.Tables[0].Rows.Count; i++)
            //{
            //    DataRow dr = result.Tables[0].Rows[i];
            //    if (dr["CityName"].ToString() == lblPractingCity.Text)
            //    {
            //        ddlState.SelectedValue = dr["State_Code"].ToString();
            //    }


            //}
            //txtPractingState.Text = ddlState.SelectedItem.Text;

        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
           // txtPractingCity.Text = ddlCity.SelectedItem.Text;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
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
               // Calendar1.Visible = false;
                CustomValidator1.IsValid = false;
            }
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
    }
 }
    
