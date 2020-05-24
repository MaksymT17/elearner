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

namespace MVCbug.Models
{
    public class InputMessageContext
    {
         private static InputMessageContext _context = null;

         private InputMessageContext()
        {

        }

         public static InputMessageContext Current
        {
            get
            {
                if (_context == null)
                    _context = new InputMessageContext();
                return _context;
            }
        }

         public Message CurrentMessage { get; set; }
    }
}
