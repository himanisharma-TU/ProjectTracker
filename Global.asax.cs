using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

using System.DirectoryServices;

namespace ProjectTrackerApp
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        public void WindowsAuthentication_OnAuthenticate(object sender, WindowsAuthenticationEventArgs args)
        {
            if (args.Identity.IsAuthenticated)
            {
                using (var adsEntry = new DirectoryEntry($"LDAP://TU", "svc.isbi", "TaskUs@2019!"))
                using (var adsSearcher = new DirectorySearcher(adsEntry))
                {
                    adsSearcher.Filter = "(sAMAccountName=" + args.Identity.Name.Substring(3) + ")";
                    adsSearcher.PropertiesToLoad.Add("employeeID");
                    adsSearcher.PropertiesToLoad.Add("givenName");
                    adsSearcher.PropertiesToLoad.Add("sn");
                    adsSearcher.PropertiesToLoad.Add("mail");
                    adsSearcher.PropertiesToLoad.Add("sAMAccountName");
                    adsSearcher.PropertiesToLoad.Add("title");
                    adsSearcher.PropertiesToLoad.Add("physicalDeliveryOfficeName");
                    adsSearcher.PropertiesToLoad.Add("department");
                    SearchResult adsSearchResult = adsSearcher.FindOne();

                    if (adsSearchResult.Properties.Count > 0)
                    {
                        var employee = new
                        {
                            Id = adsSearchResult.Properties.Contains("employeeID") ? adsSearchResult.Properties["employeeID"][0].ToString() : null,
                            FirstName = adsSearchResult.Properties.Contains("givenName") ? adsSearchResult.Properties["givenName"][0].ToString() : null,
                            LastName = adsSearchResult.Properties.Contains("sn") ? adsSearchResult.Properties["sn"][0].ToString() : null,
                            Email = adsSearchResult.Properties.Contains("mail") ? adsSearchResult.Properties["mail"][0].ToString() : null,
                            NT = adsSearchResult.Properties.Contains("sAMAccountName") ? adsSearchResult.Properties["sAMAccountName"][0].ToString() : null,
                            Position = adsSearchResult.Properties.Contains("title") ? adsSearchResult.Properties["title"][0].ToString() : null,
                            Site = adsSearchResult.Properties.Contains("physicalDeliveryOfficeName") ? adsSearchResult.Properties["physicalDeliveryOfficeName"][0].ToString() : null,
                            Department = adsSearchResult.Properties.Contains("department") ? adsSearchResult.Properties["department"][0].ToString() : null
                        };
                        if (employee != null && employee.Department.Equals("Corporate Applications", StringComparison.CurrentCultureIgnoreCase))
                        {
                            if (employee.Position.StartsWith("VP ", StringComparison.OrdinalIgnoreCase) || employee.Position.StartsWith("Director ", StringComparison.OrdinalIgnoreCase))
                            {
                                args.Identity.AddClaim(new System.Security.Claims.Claim(System.Security.Claims.ClaimTypes.Role, "Admin"));
                            }
                            else
                            {
                                args.Identity.AddClaim(new System.Security.Claims.Claim(System.Security.Claims.ClaimTypes.Role, "Developer"));
                                if(Request.Url.AbsolutePath.StartsWith("/Admin"))
                                {
                                    Response.ClearContent();
                                    Response.StatusCode = 401;
                                    Response.End();
                                }
                            }
                            args.Identity.AddClaim(new System.Security.Claims.Claim("employeeID", employee.Id));
                            args.Identity.AddClaim(new System.Security.Claims.Claim("FirstName", employee.FirstName));
                            args.Identity.AddClaim(new System.Security.Claims.Claim("LastName", employee.LastName));
                            args.Identity.AddClaim(new System.Security.Claims.Claim("Email", employee.Email));
                            args.Identity.AddClaim(new System.Security.Claims.Claim("Department", employee.Department));
                            args.Identity.AddClaim(new System.Security.Claims.Claim("Position", employee.Position));
                        }
                        else
                        {
                            Response.ClearContent();
                            Response.StatusCode = 401;
                            Response.End();
                        }
                    }
                }
            }
            //if (!args.Identity.IsAnonymous)
            //{
            //    args.User = new Samples.AspNet.Security.MyPrincipal(args.Identity);
            //}
        }
    }
}