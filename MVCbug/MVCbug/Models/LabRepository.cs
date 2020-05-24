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
    public class LabRepository
    {
         private MVCbugDataContext _datacontext;

        public LabRepository(MVCbugDataContext datacontext)
        {
            _datacontext = datacontext;
        }
         public IEnumerable<Lab> GetLabs()
        {
            return _datacontext.Labs.OrderBy(l=>l.CreatedOn);
        }

        public Lab CreateLab(string title, string text)
        {                
            Lab l = new Lab();
            l.Title = title;
            l.Text = text;
            l.CreatedOn = DateTime.Now;
            _datacontext.Labs.InsertOnSubmit(l);
            _datacontext.SubmitChanges();
            return l;
        }

        public Lab GetLab(int labId)
        {
            return _datacontext.Labs.SingleOrDefault(l =>l.LabId == labId);  // get task by Identifier
        }

        public void Delete(int id)
        {
            Lab lab = GetLab(id);
            _datacontext.Labs.DeleteOnSubmit(lab);
            _datacontext.SubmitChanges();        
        }
    }
}
