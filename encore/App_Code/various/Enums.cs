using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace com.Encore.Web
{
    public enum FieldSize
    {
        Tiny,
        Small,
        Medium,
        Large
    }

    public enum DataType
    {
        String,
        Number,
        DateTime
    }

    public enum TextBoxDataType
    {
        String,
        Int,
        Decimal,
        EmailAddress,
        DateTime
    }

    public enum MessageType
    {
        Error,
        Warning,
        Notice,
        Success
    }

    public enum AuditType
    {
        Login,
        ForgottenPassword,
        Add,
        Edit,
        Delete,
        Logout
    }

    public enum RequestStatus
    {
        New,
        Pending,
        InProgress,
        Failed,
        Complete
    }
}