using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using MVCbug.Models;

namespace MVCbug.Controllers
{
    public class QuestionController : Controller
    {
        private DataManager _dataManager;
        public QuestionController(DataManager dataManager)
        {
            _dataManager = dataManager;
        }
    }
}
