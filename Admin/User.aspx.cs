using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectTrackerApp.Admin
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UserListView_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            UserSqlDataSource.InsertParameters["CreatedBy"].DefaultValue = User.Identity.Name.Substring(5);
        }

        protected void UserListView_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            UserSqlDataSource.UpdateParameters["ModifiedBy"].DefaultValue = User.Identity.Name.Substring(5);
        }
    }
}