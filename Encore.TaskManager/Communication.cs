using System;
using System.Configuration;
using System.Net;
using System.IO;
using System.Net.Mail;
using System.Collections;

namespace Encore.TaskManager
{
    /////////////////////////////////////////////////////////////////
    /// <summary>
    /// Send External communications (Email)
    /// </summary>
    ////////////////////////////////////////////////////////////////
    public class Communication
    {

        #region Send Email
        /////////////////////////////////////////////////////////////////
        /// <summary>
        /// Send an email
        /// </summary>
        /// <param name="from">from email address</param>
        /// <param name="to">to email address</param>
        /// <param name="subject">subject of the email</param>
        /// <param name="message">Body of email</param>
        /// <returns>Send successfully</returns>
        /////////////////////////////////////////////////////////////////
        public static bool SendEmail(string from, string to, string subject, string message)
        {
            try
            {
                if (!string.IsNullOrEmpty(ConfigurationSettings.AppSettings["SMTPServer"]))
                {

                    var Mail = new MailMessage(from, to, subject, message) {IsBodyHtml = false};

                    var smtp = new SmtpClient(ConfigurationSettings.AppSettings["SMTPServer"]);
                    smtp.Send(Mail);
                }

                return true;
            }
            catch(Exception ex)
            {
                Audit.Log(AuditType.TaskManager, "SendMail", ex.Message, 0);
                return false;
            }
        }
        #endregion
    }
}