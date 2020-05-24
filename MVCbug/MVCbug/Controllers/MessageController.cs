using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using MVCbug.Models;

namespace MVCbug.Controllers
{
    public class MessageController : Controller
    {
        private DataManager _dataManager;
        public MessageController(DataManager dataManager)
        {
            _dataManager = dataManager;
        }

        public MessageController()
        {

        }
    }
}
