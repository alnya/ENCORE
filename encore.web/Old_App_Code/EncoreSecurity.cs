using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Encore.TaskManager;
using EntityFramework;

namespace com.Encore.Web
{
    public class EncoreSecurity
    {
        public static string CookieName = "ENCOREUser";

        /// <summary>
        /// The current user
        /// </summary>
        public static SYSTEMUSER LoggedInUser
        {
            get
            {
                if (HttpContext.Current.Session[CookieName] != null)
                    return (SYSTEMUSER)HttpContext.Current.Session[CookieName];
                if (HttpContext.Current.Request.Cookies[CookieName] != null)
                {
                    var userId = 0;
                    int.TryParse(HttpContext.Current.Request.Cookies[CookieName].Value, out userId);
                    var security = new EncoreSecurity();
                    if (security.Login(userId))
                    {
                        return (SYSTEMUSER)HttpContext.Current.Session[CookieName];
                    }
                }
                return null;
            }

            set
            {
                if (value != null)
                {
                    HttpContext.Current.Session[CookieName] = value;
                    var cookie = new HttpCookie(CookieName, value.ID.ToString())
                    {
                        Expires = DateTime.Now.AddDays(30)
                    };
                    HttpContext.Current.Response.Cookies.Add(cookie);
                }
                else
                {
                    HttpContext.Current.Session.Remove(CookieName);
                    HttpContext.Current.Request.Cookies.Remove(CookieName);
                }
            }
        }

        /// <summary>
        /// LOgin with username and password
        /// </summary>
        /// <param name="username">email address</param>
        /// <param name="password">password</param>
        /// <returns>success or failure</returns>
        public bool Login(string username, string password)
        {
            using (var ctx = new Entities())
            {
                var user =
                    ctx.SYSTEMUSERs.FirstOrDefault(u => u.DELETED == 0 && u.EMAIL == username & u.PASSWORD == password);

                if (user == null)
                {
                    return false;
                }

                user.LASTLOGGEDON = DateTime.Now;

                // audit
                Audit.Log(ctx, AuditType.Login, "Security", user.ID);

                ctx.SaveChanges();

                // save to session
                LoggedInUser = user;

                return true;
            }
        }

        /// <summary>
        /// Login using just the ID (internal use only)
        /// </summary>
        /// <param name="id">user id</param>
        /// <returns>success or failure</returns>
        public bool Login(int id)
        {
            using (var ctx = new Entities())
            {
                var user =
                    ctx.SYSTEMUSERs.FirstOrDefault(u => u.DELETED == 0 && u.ID == id);

                if (user == null)
                {
                    return false;
                }

                user.LASTLOGGEDON = DateTime.Now;

                // audit
                Audit.Log(ctx, AuditType.Login, "Security", user.ID);

                ctx.SaveChanges();

                // save to session
                LoggedInUser = user;

                return true;
            }
        }

        /// <summary>
        /// Clear the current user
        /// </summary>
        public void Logout()
        {
            LoggedInUser = null;
        }
    }
}