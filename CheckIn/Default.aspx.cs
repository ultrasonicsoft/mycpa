using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckIn
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillAllSpeciality();
            }
           // RegZipCode.ValidationExpression=
        }

        private void FillAllSpeciality()
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
           
        }
        protected bool validateZipCode()
        { CustomValidator1.IsValid=false;

            if (txtZipCode.Value.Equals("Enter Zip Code"))
            {
                CustomValidator1.IsValid = true;

            }
            else
            {
               if( System.Text.RegularExpressions.Regex.IsMatch(txtZipCode.Value,@"^(\d{5}-\d{4}|\d{5}|\d{9})$"))
               {
                   CustomValidator1.IsValid=true;
               }
            
            }
            return CustomValidator1.IsValid;
        }
        protected void btnSearchCPA_Click(object sender, EventArgs e)
        {
            bool isCityOrZipProvided = true;
           
            if(!validateZipCode())
                return;
           
            if (string.IsNullOrEmpty(txtZipCode.Value) && string.IsNullOrEmpty(ddlCity.DataTextField))
            {

                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
         "err_msg",
         "alert('Please enter zip code or city to search CPA!');",
         true);
                return;
            }
            if (txtZipCode.Value.Equals("Enter Zip Code") && string.IsNullOrEmpty(ddlCity.DataTextField))
            {

                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
         "err_msg",
         "alert('Please enter zip code or city to search CPA!');",
         true);
                return;
            }
            if (txtZipCode.Value.Equals("Enter Zip Code") && ddlCity.SelectedItem.Text.Equals("--Please Select city--"))
            {
                 ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
          "err_msg",
          "alert('Please enter zip code or city to search CPA!');",
          true);
                return;
            }

            string zipCode = txtZipCode.Value;
            string city = string.Empty;

            if (ddlCity.SelectedItem != null)
            {
                city = ddlCity.SelectedItem.Text;
            } 

            string redirectQuery = string.Format("~/CPA/DisplayAppointments.aspx?City={0}&ZipCode={1}", city, zipCode);
            Response.Redirect(redirectQuery);
            //Response.Redirect("~/Default.aspx");
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            string stateCode = ddlState.SelectedItem.Value.ToString();

            var result = BusinessLogic.GetAllCityList(stateCode);
            ddlCity.DataSource = result.Tables[0];
            ddlCity.Items.Clear();
            ddlCity.Items.Add("--Please Select city--");
            ddlCity.DataTextField = result.Tables[0].Columns["CityName"].ColumnName.ToString();
            ddlCity.DataValueField = result.Tables[0].Columns["CityID"].ColumnName.ToString();
            ddlCity.DataBind();
        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {

            Session["city"] = ddlCity.SelectedItem.Text;

            
        }
    }
}