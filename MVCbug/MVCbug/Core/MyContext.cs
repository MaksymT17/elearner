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
    public class MyContext
    {
        private static MyContext _context = null;

        private MyContext()
        {

        }

        public static MyContext Current
        {
            get
            {
                if (_context == null)
                    _context = new MyContext();
                return _context;
            }
        }

        public Test CurrentTest { get; set; }
        public string password;
        public int studentId;
        public int eventId;

    }
}
