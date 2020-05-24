using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;

namespace MVCbug.Models
{
    public class ThemeRepository
    {
         private MVCbugDataContext _datacontext;

        public ThemeRepository(MVCbugDataContext datacontext)
        {
            _datacontext = datacontext;
        }

        public IEnumerable<Theme> GetThemes(int categoryId)
        {
            return _datacontext.Themes.Where(t=> t.CategoryId==categoryId);                    // gets all "Themes" in current "Category"
        }

        public Theme GetTheme(int themeId)
        {
            return _datacontext.Themes.SingleOrDefault(t => t.ThemeId == themeId);            // gets "theme" by identifier
        }
                
        public Theme CreateTheme(int categoryId, string themeName)
        {
            MembershipUser user = Membership.GetUser(HttpContext.Current.User.Identity.Name);   //  creating   "Theme" by user in current "Category"
            string userId = user.ToString();
            Guid userGuid = new Guid(user.ProviderUserKey.ToString());
            Theme t = new Theme {   ThemeName=themeName, CategoryId=categoryId , AssignedOn = userGuid, CreatedOn=System.DateTime.Now};
            _datacontext.Themes.InsertOnSubmit(t);
            _datacontext.SubmitChanges();
            return t;
        }
        public void DeleteTheme(int themeId)
        {
            Theme t = GetTheme(themeId);
            _datacontext.Themes.DeleteOnSubmit(t);
            _datacontext.SubmitChanges();
        }
    }
}
