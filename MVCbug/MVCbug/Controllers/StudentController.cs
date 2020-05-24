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
    public class StudentController : Controller
    {
        private DataManager _dataManager;
        public StudentController(DataManager datamanager)
        {
            _dataManager = datamanager;
        }

        public StudentController()
        {

        }

        public ActionResult StudentList()
        {            
            ViewData["StudentList"] = Resources.ResourceUA.StudentList;
            ViewData["Students"] = _dataManager.Students.GetStudents();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Add()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Add(string name, string secondName, string middleName, int year, string profession, string position, string country, string town, int phoneNumber, string education, string password)
        {
            if (ModelState.IsValid && password == Resources.ResourceUA.RegistrationUserPassword)
            {
                Student std = new Student();
                std.Name = name;
                std.SecondName = secondName;
                std.MiddleName = middleName;
                std.BornYear = year;
                std.Profession = profession;
                std.Position = position;
                std.Country = country;
                std.Town = town;
                std.PhoneNumber = phoneNumber;
                std.EducationType = education;
                _dataManager.Students.CreateStudent(std);
                MyContext.Current.studentId = std.StudentId;
                return RedirectToAction("AddPhoto");
            }
            return View();
        }

        public ActionResult Delete(int id)
        {
            _dataManager.Students.DeleteStudent(id);
            return RedirectToAction("StudentList");
        }

        public ActionResult ProgressList()
        {
            ViewData["Students"] = _dataManager.Students.GetStudents();         // searching max.  result  for any registerred user 
            ViewData["StudentsResults"] = _dataManager.Students.GetLabResults();
            ViewData["TestsList"] = _dataManager.Tests.GetTestsResults();
            List<int> maxMarks = new List<int>();
            List<int> numbers = new List<int>();
            foreach (MVCbug.Models.Student s in (IEnumerable<MVCbug.Models.Student>)ViewData["Students"])
            {
                foreach (MVCbug.Models.Test t in (IEnumerable<MVCbug.Models.Test>)ViewData["TestsList"])
                {
                    if (s.UserId == t.UserId)
                    {
                        numbers.Add(t.AnswersCorrectly);
                    }
                }
                int maxValue = 0;
                numbers.Add(0);
                if (numbers != null)
                {
                    maxValue = numbers.Max();
                }
                numbers = new List<int>();
                maxMarks.Add(maxValue);
            }
            ViewData["Marks"] = maxMarks;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult InsertMarks(int studentId)
        {
            ViewData.Model = _dataManager.Students.GetStudent(studentId);
            MyContext.Current.studentId = studentId;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult InsertMarks(char lab1, char lab2, char lab3)
        {
            if (ModelState.IsValid)
            {
                _dataManager.Students.PutMarks(MyContext.Current.studentId, lab1, lab2, lab3);
                return RedirectToAction("ProgressList");
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult AddPhoto()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddPhoto(string name)
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Create()
        {
            ViewData["Status"] = Resources.ResourceUA.Status_EnterData;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(Student std, string password )
        {
            int passWord = password.GetHashCode();            
            if (ModelState.IsValid && passWord.ToString() == Resources.ResourceUA.PasswordOOP)
            {
                _dataManager.Students.CreateStudent(std);
                MyContext.Current.studentId = std.StudentId;
                return RedirectToAction("StudentList");
            }
            ViewData["Status"] = Resources.ResourceUA.Status_Error;
            return View();            
        }
    }
}
