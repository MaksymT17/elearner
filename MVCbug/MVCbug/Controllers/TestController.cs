using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using MVCbug.Models;

namespace MVCbug.Controllers
{
    public class TestController : Controller
    {

        private DataManager _dataManager;

        public TestController(DataManager dataManager)
        {
            _dataManager = dataManager;
        }
        public ActionResult Info()
        {
            
            return View();
        }
        public ActionResult QuestionNext()
        {             
            Test test = _dataManager.Tests.CreateTest();
            MyContext.Current.CurrentTest = test;
            ViewData.Model = _dataManager.Questions.GetRandomQuestion();
            ViewData["stringCategoryOop"] = Resources.ResourceUA.stringCategoryOop;
            return View();
        }

        public ActionResult QuestionCycle(int id, string answer)
        {
            ViewData["stringCategoryOop"] = Resources.ResourceUA.stringCategoryOop;
            bool lastResult = _dataManager.Questions.MarkQuestion(answer, id);
            if (lastResult == true)
            {
                MyContext.Current.CurrentTest.AnswersCorrectly++;
            }
            MyContext.Current.CurrentTest.AnswersAll++;
            if (MyContext.Current.CurrentTest.AnswersAll == 10)
            {                
                return RedirectToAction("TestResult");
            }
            ViewData.Model = _dataManager.Questions.GetRandomQuestion();            
            return View();
        }
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult TestAjax()
        {
            Test test = _dataManager.Tests.CreateTest();
            MyContext.Current.CurrentTest = test;
            ViewData.Model = _dataManager.Questions.GetRandomQuestion();
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult TestAjax( int id, string answer)
        {
            bool lastResult = _dataManager.Questions.MarkQuestion(answer, id);
            if (lastResult == true)
            {
                MyContext.Current.CurrentTest.AnswersCorrectly++;
            }
            MyContext.Current.CurrentTest.AnswersAll++;
            if (MyContext.Current.CurrentTest.AnswersAll == 10)
            {
                return RedirectToAction("TestResult");
            }
            ViewData.Model = _dataManager.Questions.GetRandomQuestion();            
            return View();        
        }
        public ActionResult TestAjaxFC(int id, string answer)
        {
            bool lastResult = _dataManager.Questions.MarkQuestion(answer, id);
            if (lastResult == true)
            {
                MyContext.Current.CurrentTest.AnswersCorrectly++;
            }
            MyContext.Current.CurrentTest.AnswersAll++;
            if (MyContext.Current.CurrentTest.AnswersAll == 10)
            {
                return RedirectToAction("TestResult");
            }
            ViewData.Model = _dataManager.Questions.GetRandomQuestion();
            return RedirectToAction("TestAjax",AcceptVerbsAttribute(HttpVerbs.Post));
        }

        private string AcceptVerbsAttribute(HttpVerbs httpVerbs)
        {
            throw new NotImplementedException();
        }
        
        public ActionResult TestResult()
        {
            Test t = MyContext.Current.CurrentTest;
            ViewData.Model = t;
            _dataManager.Tests.UpdateTest();
            if (MyContext.Current.CurrentTest.AnswersCorrectly >= 6)
            {
                ViewData["YourMark"] = Resources.ResourceUA._3;
            }
            if (MyContext.Current.CurrentTest.AnswersCorrectly >= 7)
            {
                ViewData["YourMark"] = Resources.ResourceUA._4;
            }
            if (MyContext.Current.CurrentTest.AnswersCorrectly >= 9)
            {
                ViewData["YourMark"] = Resources.ResourceUA._5;
            }
            if (MyContext.Current.CurrentTest.AnswersCorrectly <= 5)
            {
                ViewData["YourMark"] = Resources.ResourceUA._2;
            }
            
                return View();
        }
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Editor()
        {
            Question q = new Question();
            ViewData.Model = q;
            
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editor(Question q)
        {
            _dataManager.Questions.CreateQuestion(q);
            return View();
        }

        public ActionResult TestResults()
        {
            ViewData["Tests"] = _dataManager.Tests.GetTestsResults();
            return View();
        }
    }
}
