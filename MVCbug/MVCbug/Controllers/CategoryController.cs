using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using MVCbug.Models;
using MVCbug.Core;

namespace MVCbug.Controllers
{
    public class CategoryController : Controller
    {
         private DataManager _dataManager;
        public CategoryController(DataManager dataManager)
        {
            _dataManager = dataManager;
        }

        public CategoryController()
        {
                
        }
        public ActionResult ListCategories()
        {
            ViewData["SelectCategory"] = Resources.ResourceUA.SelectCategory;
            ViewData["Categories"] = _dataManager.Categories.GetCategories();

            return View();
        }
        public ActionResult ForumList( int themeId)
        {
            Message mess=new Message();            
            ViewData["AllMessages"] = Resources.ResourceUA.AllMessages;
            ViewData["Messages"] = _dataManager.Messages.GetMessages(InputMessageContext.Current.CurrentMessage.CategoryName,themeId);
           
            InputMessageContext.Current.CurrentMessage.ThemeId = themeId;
            return View();
        }        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Add(string answerTo)
        {            
            InputMessageContext.Current.CurrentMessage.AnswerTo = answerTo;
        return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Add(string answerTo, string text)
        {
            if (ModelState.IsValid)
            {
                _dataManager.Messages.CreateMessage(answerTo, text);

                return RedirectToAction("ListCategories");
            }
            return View();
        }
        public ActionResult ViewQuery(string categoryName)
        {            
            return View();
        }
        public ActionResult Delete(int id)
        {
            _dataManager.Messages.DeleteMessage(id);
            return RedirectToAction("ListCategories");
        }
        public ActionResult DeleteTheme(int themeId)
        {
            _dataManager.Themes.DeleteTheme(themeId);
            return RedirectToAction("ListCategories");
        }
        public ActionResult ListThemes(int categoryId)
        {
            ViewData["Themes"] = _dataManager.Themes.GetThemes(categoryId);
            InputMessageContext.Current.CurrentMessage = new Message();
            Category c = _dataManager.Categories.GetCategory(categoryId);
            InputMessageContext.Current.CurrentMessage.CategoryName = c.CategoryName;    
            return View();
        }
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult CreateTheme()
        { 
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateTheme(string themeName)
        {
            string a = InputMessageContext.Current.CurrentMessage.CategoryName;
            int catId = _dataManager.Categories.GetCategoryIdByName(a);
            _dataManager.Themes.CreateTheme(catId, themeName);
            return RedirectToAction("ListCategories"); 
        }
    }
}
