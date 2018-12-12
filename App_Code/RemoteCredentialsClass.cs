using System;
using System.Data;
using System.Configuration;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using System.Xml.Linq;
using System.Security.Principal;
using System.Runtime.InteropServices;

/// <summary>
/// Summary description for RemoteCredentialsClass
/// </summary>
public class RemoteCredentialsClass
{
    [DllImport("advapi32.dll", SetLastError = true)]
    private static extern bool LogonUser(string lpszUsername, string lpszDomain, string lpszPassword, int dwLogonType, int dwLogonProvider, ref IntPtr phToken);

    [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
    private static extern bool CloseHandle(IntPtr handle);

    // logon types
    const int LOGON32_LOGON_INTERACTIVE = 2;
    const int LOGON32_LOGON_NETWORK = 3;
    const int LOGON32_LOGON_NEW_CREDENTIALS = 9;

    // logon providers
    const int LOGON32_PROVIDER_DEFAULT = 0;
    const int LOGON32_PROVIDER_WINNT50 = 3;
    const int LOGON32_PROVIDER_WINNT40 = 2;
    const int LOGON32_PROVIDER_WINNT35 = 1;


    private static void RaiseLastError()
    {
        int errorCode = Marshal.GetLastWin32Error();
        string errorMessage = "IO Error: " + errorCode.ToString();

        throw new ApplicationException(errorMessage);
    }

    IntPtr token = IntPtr.Zero;
    WindowsImpersonationContext impersonatedUser = null;

    public RemoteCredentialsClass(string server, string user, string pwd)
    {
        if (user.IndexOf("\\") > 0)
        {
            server = user.Substring(0, user.IndexOf("\\"));
            if (user.Length > server.Length + 1) user = user.Substring(server.Length + 1);
        }
        bool isSuccess = LogonUser(user, server, pwd, LOGON32_LOGON_NEW_CREDENTIALS, LOGON32_PROVIDER_DEFAULT, ref token);
        if (!isSuccess)
        {
            RaiseLastError();
        }

        WindowsIdentity newIdentity = new WindowsIdentity(token);
        impersonatedUser = newIdentity.Impersonate();
    }

    public void CloseUNC()
    {
        if (impersonatedUser == null) return;
        impersonatedUser.Undo();

        bool isSuccess = CloseHandle(token);
        if (!isSuccess)
        {
            RaiseLastError();
        }
    }
}
