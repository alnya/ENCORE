using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using EntityFramework;


namespace com.Encore.Web
{
    /////////////////////////////////////////////////////////////////
    /// <summary>
    /// BasePage containing useful objects
    /// </summary>
    /////////////////////////////////////////////////////////////////
    public class BasePage : System.Web.UI.Page
    {
        /// <summary>
        /// The Current Logged In User
        /// </summary>
        public SYSTEMUSER LoggedInUser
        {
            get
            {
                if (HttpContext.Current.Session["user"] != null)
                    return (SYSTEMUSER) HttpContext.Current.Session["user"];
                return null;
            }
            set { HttpContext.Current.Session["user"] = value; }
        }

        #region Messages
        public void ShowExceptionMessage()
        {
            ShowMessage(MessageType.Error, "A serious error has occured.  Please contact your system administrator", true);
        }

        public void ShowMessage(MessageType type, string message)
        {
            ShowMessage(type, message, false);
        }

        public void ShowMessage(MessageType type, string message, bool sticky)
        {
            Page.RegisterStartupScript("messageScript" + DateTime.Now.ToString("HHmmss"),
                string.Format("<script language=JavaScript>Encore.show{0}Toast('{1}','{2}');</script>",
                sticky? "Sticky" : "", type.ToString(), message));
        }
        #endregion  
    }
}
