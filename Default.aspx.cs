using System;
using System.Web.UI;
using System.DirectoryServices;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Claims;
using System.Linq;

namespace ProjectTrackerApp
{
    public partial class _Default : Page
    {
        string userRole = "";
        protected override void OnInit(EventArgs e)
        {
            //First get user claims    
            var claims = ClaimsPrincipal.Current.Identities.First().Claims.ToList();

            //Filter specific claim    
            userRole = claims?.FirstOrDefault(x => x.Type.Equals(System.Security.Claims.ClaimTypes.Role, StringComparison.OrdinalIgnoreCase))?.Value;

            if(userRole.Equals("Admin"))
            {
                TaskSqlDataSource.SelectCommand = TaskSqlDataSource.SelectCommand + " WHERE StatusName <> 'Closed' ";
            }
            else
            {
                TaskSqlDataSource.SelectCommand = TaskSqlDataSource.SelectCommand + " WHERE StatusName <> 'Closed' AND ResourceId = " + User.Identity.Name.Substring(5);
                ResourceSqlDataSource.SelectCommand = ResourceSqlDataSource.SelectCommand + " WHERE EmployeeNo = " + User.Identity.Name.Substring(5);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //private DataSet GetData(string query)
        //{
        //    string conString = ConfigurationManager.ConnectionStrings["ProjectTrackDBConnStr"].ConnectionString;
        //    SqlCommand cmd = new SqlCommand(query);
        //    using (SqlConnection con = new SqlConnection(conString))
        //    {
        //        using (SqlDataAdapter sda = new SqlDataAdapter())
        //        {
        //            cmd.Connection = con;
        //            sda.SelectCommand = cmd;
        //            using (DataSet ds = new DataSet())
        //            {
        //                sda.Fill(ds);
        //                return ds;
        //            }
        //        }
        //    }
        //}

        protected void TaskListView_ItemUpdating(object sender, System.Web.UI.WebControls.ListViewUpdateEventArgs e)
        {
            TaskSqlDataSource.UpdateParameters["ModifiedBy"].DefaultValue = User.Identity.Name.Substring(5);
        }

        protected void TaskListView_ItemInserting(object sender, System.Web.UI.WebControls.ListViewInsertEventArgs e)
        {
            TaskSqlDataSource.InsertParameters["CreatedBy"].DefaultValue = User.Identity.Name.Substring(5);
        }

        protected void TaskListView_ItemDataBound(object sender, System.Web.UI.WebControls.ListViewItemEventArgs e)
        {

        }
    }
}