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
using System.DirectoryServices;
using System.Collections.Generic;

/// <summary>
/// Summary description for AuthenticateUser
/// </summary>
public class AuthenticateUser
{
    public AuthenticateUser()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    private string _path;
    public string path
    {
        get { return _path; }
        set { _path = value; }
    }
    private string _filterAttribute;

    public AuthenticateUser(string path)
    {
        _path = path;
    }
    public bool IsAuthenticated(string domain, string username, string pwd)
    {
        string domainAndUsername = domain + @"\" + username;
        DirectoryEntry entry = new DirectoryEntry(_path, domainAndUsername, pwd);

        try
        {
            //Bind to the native AdsObject to force authentication.
            object obj = entry.NativeObject;

            DirectorySearcher search = new DirectorySearcher(entry);

            search.Filter = "(SAMAccountName=" + username + ")";
            search.PropertiesToLoad.Add("cn");
            SearchResult result = search.FindOne();

            if (null == result)
            {
                return false;
            }

            //Update the new path to the user in the directory.
            _path = result.Path;
            _filterAttribute = (string)result.Properties["cn"][0];

        }
        catch (Exception ex)
        {
            //throw new Exception("Error authenticating user. " + ex.Message);
            return false;
        }

        return true;
    }

}
