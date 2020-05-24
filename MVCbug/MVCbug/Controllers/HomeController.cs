using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using MVCbug.Models;
//E-mail using
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Threading;
using System.Globalization;

namespace MVCbug.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        private DataManager _datamanager;

        public HomeController(DataManager datamanager)
        {
            _datamanager = datamanager;
        }

        public ActionResult Index()
        {
            ViewData["Welcome"] = Resources.ResourceUA.Welcome;
            ViewData["EventsList"] = _datamanager.Events.GetEvents();
            return View();
        }

        public ActionResult About()
        {
            return View();
        }
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Feedback()
        {
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Feedback(string text, string eMail, string fileName)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo("ru-RU");
            ////Авторизация на SMTP сервере
            SmtpClient Smtp = new SmtpClient("smtp.mail.ru", 25);
            Smtp.Credentials = new NetworkCredential("mailstudy", "password");
            Smtp.EnableSsl = false;

            ////Формирование письма
            MailMessage Message = new MailMessage();
            Message.From = new MailAddress("almaxpost@mail.ru");
            Message.To.Add(new MailAddress("almaxpost@mail.ru"));
            Message.Subject = "head";
            Message.Body = "message";
            ////Прикрепляем файл

            string file = "C:\\DatabaseCourse.bak";
            Attachment attach = new Attachment(file, MediaTypeNames.Application.Octet);

            //// Добавляем информацию для файла
            ContentDisposition disposition = attach.ContentDisposition;
            disposition.CreationDate = System.IO.File.GetCreationTime(file);
            disposition.ModificationDate = System.IO.File.GetLastWriteTime(file);
            disposition.ReadDate = System.IO.File.GetLastAccessTime(file);
            Message.Attachments.Add(attach);
            Smtp.Send(Message);
            return View();
        }
        ActionResult SendMessage(string textMessage, string eMail, string fileDirectory)
        {
            return View();
        }
    }
}
