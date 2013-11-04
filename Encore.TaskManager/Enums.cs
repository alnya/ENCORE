namespace Encore.TaskManager
{
    public enum RequestStatus
    {
        New,
        Pending,
        InProgress,
        Failed,
        Complete
    }

    public enum AuditType
    {
        Login,
        ForgottenPassword,
        Add,
        Edit,
        Delete,
        Logout,
        TaskManager
    }
}