using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using MVCbug.Models;
using System.Web.UI.WebControls;

namespace MVCbug.Controllers
{
    public class EventController : Controller
    {
        private DataManager _dataManager;

        public EventController(DataManager dataManager)
        {
            _dataManager = dataManager;
        }

        public EventController()
        {
        }

        private void SetEditLists(Event e)
        {
            ViewData["States"] = new SelectList(_dataManager.EventStates.GetEventStates(), "StateId", "Title", e.EventId);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Add()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Add(Event e)
        {            
             _dataManager.Events.CreateEvent(e.Title, e.Text, e.Specificity);
             Event createdEvent=   _dataManager.Events.GetEventByTitle(e.Title);
             MyContext.Current.eventId = createdEvent.EventId;
             return RedirectToAction("AddPicture");
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult AddPicture()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddPicture(Event e)
        {            
            return View();
        }

        public ActionResult EventList()
        {
            ViewData["Events"] = _dataManager.Events.GetEvents();           
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            Event e = _dataManager.Events.GetEvent(id);
            ViewData.Model = e;
            SetEditLists(e);
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(Event e,int eventId)
        {
            _dataManager.Events.UpdateEvent(e,eventId); 
                return RedirectToAction("EventList");
            
            SetEditLists(e);
            return View();
        }
    }
}
