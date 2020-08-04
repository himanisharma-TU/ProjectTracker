using System;

namespace ProjectTrackerApp.Admin
{
    public partial class Project : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemInserting(object sender, System.Web.UI.WebControls.ListViewInsertEventArgs e)
        {
            ProjectSqlDataSource.InsertParameters["CreatedBy"].DefaultValue = User.Identity.Name.Substring(5);
        }

        protected void ListView1_ItemUpdating(object sender, System.Web.UI.WebControls.ListViewUpdateEventArgs e)
        {
            ProjectSqlDataSource.UpdateParameters["ModifiedBy"].DefaultValue = User.Identity.Name.Substring(5);
        }
    }
}