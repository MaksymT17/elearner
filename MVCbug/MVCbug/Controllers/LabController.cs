using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using MVCbug.Models;


namespace MVCbug.Controllers
{
    public class LabController : Controller
    {
        private DataManager _dataManager;
        public LabController(DataManager dataManager)
        {
            _dataManager = dataManager;
        }

        public LabController()
        {

        }

        public ActionResult LabList()
        {
            ViewData["TitleLabList"] = Resources.ResourceUA.TitleLabList;
            ViewData["Labs"] = _dataManager.Labs.GetLabs();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Add()
        {
            return View();
        } 
 
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Add(string title, string text)
        {          
            if (ModelState.IsValid)
            {
                _dataManager.Labs.CreateLab(title, text);
                return RedirectToAction("LabList");
            }
            return View();
        }
        public ActionResult Delete(int Id)
        {
            _dataManager.Labs.Delete(Id);
            return RedirectToAction("LabList");
        }
    }
}