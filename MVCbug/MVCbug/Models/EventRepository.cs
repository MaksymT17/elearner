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
    public class EventRepository
    {
        private MVCbugDataContext _datacontext;

        public EventRepository(MVCbugDataContext datacontext)
        {
            _datacontext = datacontext;
        }
        public IEnumerable<Event> GetEvents()
        {
            return _datacontext.Events.OrderBy(e => e.Created);                          // get collection Events - all rows in table "Events"
        }
        public Event GetEvent(int eventId)
        {
            return _datacontext.Events.SingleOrDefault(e => e.EventId == eventId);       // get event by identifier
        }
        public Event GetEventByTitle(string title)
        {
            return _datacontext.Events.SingleOrDefault(e => e.Title == title);       // get event by identifier
        }
        public Event CreateEvent(string title, string text, string specificity)
        {
            Event ev = new Event { Title = title, Text = text, Specificity = specificity, StateId = 1, Created = System.DateTime.Now };
            _datacontext.Events.InsertOnSubmit(ev);
            _datacontext.SubmitChanges();
            return ev;
        }
        public void UpdateEvent(Event e, int id)
        {
            Event ev = GetEvent(id);    // "admin"  asserting event
            ev.Text = e.Text;
            ev.Title = e.Title;
            ev.StateId = e.StateId;
            ev.Created = e.Created;
            ev.Specificity = e.Specificity;
            _datacontext.SubmitChanges();
        }
        public void DeleteEvent(int eventId)
        {
            Event e = GetEvent(eventId);
            _datacontext.Events.DeleteOnSubmit(e);
            _datacontext.SubmitChanges();
        }


    }
}
