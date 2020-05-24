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
    public class EventSateRepository
    {
        private MVCbugDataContext _datacontext;
        public EventSateRepository(MVCbugDataContext datacontext)
        {
            _datacontext = datacontext;
        }

        public IEnumerable<EventState> GetEventStates()
        {
            return _datacontext.EventStates.OrderBy(e => e.Title);
        }
    }
}
