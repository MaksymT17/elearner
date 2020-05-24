using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using MVCbug.Models;
using System.Web.Security;

namespace MVCbug.Controllers
{
    public class TaskController : Controller
    {
        private DataManager _dataManager;
        public TaskController(DataManager dataManager)
        {
            _dataManager = dataManager;
        }

        public TaskController()
        {
        }
        
        public ActionResult List()
        {
            ViewData["TaskList"] = Resources.ResourceUA.TaskList;
            ViewData["Tasks"] = _dataManager.Tasks.GetTasks();
            ViewData["States"] = _dataManager.States.GetStates();
            return View();
        }

        public ActionResult Task(int id)
        {
            ViewData.Model = _dataManager.Tasks.GetTask(id);
            return View();
        }

        public ActionResult State()
        {
            return View();
        }
        public ActionResult Event()
        {
            return View();
        }
        public ActionResult Delete(int id)
        {
            _dataManager.Tasks.DeleteTask(id);
            return RedirectToAction("List");
        }
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            Task t = _dataManager.Tasks.GetTask(id);
            ViewData.Model = t;
            SetEditLists(t);
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, Task t)
        {
            if (t.Title.Length < 3)
                ModelState.AddModelError("Title", Resources.ResourceUA.NameOfThemeTaskIsShort);

            if (ModelState.IsValid)
            {
                t.TaskId = id;
                _dataManager.Tasks.UpdateTask(t);

                if (Request.IsAjaxRequest())
                {
                    return Content("<b>Data saved:</b>" + DateTime.Now.ToLongTimeString());
                }

                return RedirectToAction("List");

            }
            SetEditLists(t);
            return View();

        }
        private void SetEditLists(Task t)
        {
            ViewData["States"] = new SelectList(_dataManager.States.GetStates(), "StateId", "Title", t.StateId);
            ViewData["Users"] = new SelectList(_dataManager.Membership.GetUsers(), "ProviderUserKey", "UserName", t.AssignedOn);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Add()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Add(string title, string text)
        {
            if (title.Length < 3)
                ModelState.AddModelError("Title", Resources.ResourceUA.NameOfThemeTaskIsShort);

            if (ModelState.IsValid)
            {
                _dataManager.Tasks.CreateTask(title, text);
                return RedirectToAction("List");
            }
            return View();
        }


    }
}
