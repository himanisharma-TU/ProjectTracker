using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Claims;
using System.Web.UI;

namespace ProjectTrackerApp
{
    public partial class SiteMaster : MasterPage
    {
        protected override void OnInit(EventArgs e)
        {
            //First get user claims    
            var claims = ClaimsPrincipal.Current.Identities.First().Claims.ToList();

            try
            {
                string sqlStr = ResourceSqlDataSource.SelectCommand + " WHERE EmployeeNo = " + claims?.FirstOrDefault(x => x.Type.Equals("employeeID", StringComparison.OrdinalIgnoreCase))?.Value;
                if (this.GetData(sqlStr).Tables[0].Rows.Count == 0)
                {
                    ResourceSqlDataSource.InsertParameters["EmployeeNo"].DefaultValue = claims?.FirstOrDefault(x => x.Type.Equals("employeeID", StringComparison.OrdinalIgnoreCase))?.Value;
                    ResourceSqlDataSource.InsertParameters["FirstName"].DefaultValue = claims?.FirstOrDefault(x => x.Type.Equals("FirstName", StringComparison.OrdinalIgnoreCase))?.Value;
                    ResourceSqlDataSource.InsertParameters["LastName"].DefaultValue = claims?.FirstOrDefault(x => x.Type.Equals("LastName", StringComparison.OrdinalIgnoreCase))?.Value;
                    ResourceSqlDataSource.InsertParameters["BusinessTitle"].DefaultValue = claims?.FirstOrDefault(x => x.Type.Equals("Position", StringComparison.OrdinalIgnoreCase))?.Value;
                    ResourceSqlDataSource.InsertParameters["Active"].DefaultValue = "true";
                    ResourceSqlDataSource.InsertParameters["CreatedBy"].DefaultValue = claims?.FirstOrDefault(x => x.Type.Equals("employeeID", StringComparison.OrdinalIgnoreCase))?.Value;
                    ResourceSqlDataSource.InsertParameters["EmailId"].DefaultValue = claims?.FirstOrDefault(x => x.Type.Equals("Email", StringComparison.OrdinalIgnoreCase))?.Value;
                    ResourceSqlDataSource.Insert();
                }
                else
                {
                    ResourceSqlDataSource.UpdateParameters["EmployeeNo"].DefaultValue = claims?.FirstOrDefault(x => x.Type.Equals("employeeID", StringComparison.OrdinalIgnoreCase))?.Value;
                    ResourceSqlDataSource.UpdateParameters["FirstName"].DefaultValue = claims?.FirstOrDefault(x => x.Type.Equals("FirstName", StringComparison.OrdinalIgnoreCase))?.Value;
                    ResourceSqlDataSource.UpdateParameters["LastName"].DefaultValue = claims?.FirstOrDefault(x => x.Type.Equals("LastName", StringComparison.OrdinalIgnoreCase))?.Value;
                    ResourceSqlDataSource.UpdateParameters["BusinessTitle"].DefaultValue = claims?.FirstOrDefault(x => x.Type.Equals("Position", StringComparison.OrdinalIgnoreCase))?.Value;
                    ResourceSqlDataSource.UpdateParameters["Active"].DefaultValue = "true";
                    ResourceSqlDataSource.UpdateParameters["ModifiedBy"].DefaultValue = claims?.FirstOrDefault(x => x.Type.Equals("employeeID", StringComparison.OrdinalIgnoreCase))?.Value;
                    ResourceSqlDataSource.UpdateParameters["EmailId"].DefaultValue = claims?.FirstOrDefault(x => x.Type.Equals("Email", StringComparison.OrdinalIgnoreCase))?.Value;
                    ResourceSqlDataSource.Update();
                }
            }
            catch(Exception ex)
            {
                
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private DataSet GetData(string query)
        {
            string conString = ConfigurationManager.ConnectionStrings["ProjectTrackDBConnStr"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);
                        return ds;
                    }
                }
            }
        }
    }
}