using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;
using Models.General;


namespace REST
{
    public partial class newUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ///TODO: Background validations must be performed
            ///TODO: Ensure Entity Framework are preventing SQL injection
            using (var _userOps = new CodeBehind.General.UserOperations(Constants.SCOPE_FINNANCIAL))
            {
                ;
                try
                {
                    var _created = _userOps.newUser(new mdlUser()
                                                                {
                                                                    Comments = txtComments.Text,
                                                                    Email = txtEmail.Text,
                                                                    Mobile = txtMobile.Text,
                                                                    Name = txtName.Text,
                                                                    Session = Guid.NewGuid(),
                                                                    Provider = "WEBFORMS_UI",
                                                                    Token = txtHash.Text
                                                                });
                    if (_created != null)
                    {
                        pnlSuccessMessages.Visible = true;
                        lblSuccessMessages.Text = string.Format("User {0} added successfuly. Please navigate to Login screen to login.", _created.Email);
                    }
                } catch 
                {
                    ///TODO: Add UI level logging
                    pnlErrorsOrWarnings.Visible = true;
                    lblErrorsOrWarnings.Text = "An issue happened while adding the User. Please report the issue to postmaster@agenda.pub informing code EC#001 and the time of the event!";
                }
            }
        }
    }
}