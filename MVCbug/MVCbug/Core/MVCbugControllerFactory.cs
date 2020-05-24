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
using System.Web.Mvc;
using MVCbug.Models;
using System.Web.Routing;

namespace MVCbug.Core
{
    public class MVCbugControllerFactory : DefaultControllerFactory
    {
   //     RequestContext requestContext = new RequestContext(null, null);
        protected override IController GetControllerInstance(RequestContext requestContext, Type controllerType)
        {
            string connectionString =ConfigurationManager.ConnectionStrings["ApplicationServices1"].ConnectionString;
            return Activator.CreateInstance(controllerType, new DataManager(connectionString)) as IController;
        }
        
    }
}
