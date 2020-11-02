using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Exceptions;
using Models.General;

namespace REST
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAccess_Click(object sender, EventArgs e)
        {
            var _email = txtEmail.Text;
            var _hash = txtHash.Text;

            using (var _userOps = new CodeBehind.General.UserOperations(Models.Constants.SCOPE_FINNANCIAL))
            {
                try
                {
                    if (_userOps.doesMatch(_hash, _email))
                    {
                        pnlSuccessMessages.Visible = true;
                        pnlErrorsOrWarnings.Visible = false;
                        lblSuccessMessages.Text = "Login Successful!";
                        Session.Add("SESSION", new mdlSession(Guid.NewGuid().ToString(), _userOps.getSingle(_email)));
                    }
                    else 
                    {
                        pnlErrorsOrWarnings.Visible = true;
                        pnlSuccessMessages.Visible = false;
                        Session.Remove("SESSION");
                        lblErrorsOrWarnings.Text = "NOT FOUND/NO MATCH!"; 
                    }
                }
                catch (NotFoundException nfe)
                {
                    pnlErrorsOrWarnings.Visible = true;
                    pnlSuccessMessages.Visible = false;
                    Session.Remove("SESSION");
                    lblErrorsOrWarnings.Text = "NOT FOUND!";
                }
                catch (Exception ex)
                {
                    ///TODO: Implement UI level logging
                    pnlErrorsOrWarnings.Visible = true;
                    pnlSuccessMessages.Visible = false;
                    Session.Remove("SESSION");
                    lblErrorsOrWarnings.Text = "UNKNOW ERROR!"; 
                }
            }
        }
    }
}