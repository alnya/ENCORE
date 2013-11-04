using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EntityFramework;

namespace com.Encore.Web
{
    public class Audit
    {
        /// <summary>
        /// Create an audit of an event
        /// </summary>
        public static void Log(Entities ctx, AuditType type, string source, string message, int systemUserID)
        {
            var dataSource = new AUDITLOG()
            {
                AUDITTYPE = type.ToString(),
                DESCRIPTION = message,
                SOURCE = source,
                URL = HttpContext.Current.Request.AppRelativeCurrentExecutionFilePath,
                CREATEDON = DateTime.Now,
                DELETED = 0,
                SYSTEMUSERID = systemUserID
            };

            ctx.AddToAUDITLOGs(dataSource);
        }

        /// <summary>
        /// Create an audit of an event
        /// </summary>
        public static void Log(Entities ctx, AuditType type, string source, int systemUserID)
        {
            Log(ctx, type, source, string.Empty, systemUserID);
        }

        /// <summary>
        /// Create an audit of an event
        /// </summary>
        public static void Log(AuditType type, string source, string message, int systemUserID)
        {
            using (var ctx = new Entities())
            {
                try
                {
                    Log(ctx, type, source, message, systemUserID);
                }
                catch(Exception ex)
                {
                    ExceptionLog.WriteException("Audit Log", ex);
                }
            }
        }
    }
}