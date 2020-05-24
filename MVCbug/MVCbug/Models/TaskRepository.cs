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
using MVCbug.Models;

namespace MVCbug.Models
{
    public class TaskRepository
    {
        private MVCbugDataContext _datacontext;

        public TaskRepository(MVCbugDataContext datacontext)
        {
            _datacontext = datacontext;
        }

        public IEnumerable<Task> GetTasks()
        {
            return _datacontext.Tasks.OrderBy(t => t.CreatedOn);    // get collection Task - all rows in table "Tasks"
        }

        public Task GetTask(int taskId)
        {
            return _datacontext.Tasks.SingleOrDefault(t => t.TaskId == taskId);  // get task by Identifier
        }

        public Task CreateTask(string title, string text)
        {
            MembershipUser user = Membership.GetUser(HttpContext.Current.User.Identity.Name); //  user add task himself
            string userId = user.ToString();
            Guid userGuid = new Guid(user.ProviderUserKey.ToString());
            Task t = new Task { Title = title, Text = text, AssignedOn = userGuid,CreatedOn=System.DateTime.Now,StateId=1};
            _datacontext.Tasks.InsertOnSubmit(t);
            _datacontext.SubmitChanges();
            return t;
        }

        public void UpdateTask(Task t)
        {
            Task dbTask = GetTask(t.TaskId);    // "admin"  asserting userTask 
            dbTask.AssignedOn = t.AssignedOn;
            dbTask.Title = t.Title;
            dbTask.Text = t.Text;
            dbTask.StateId = t.StateId;
            _datacontext.SubmitChanges();
        }

        public void DeleteTask(int taskId)
        {
            Task t = GetTask(taskId);
            _datacontext.Tasks.DeleteOnSubmit(t);
            _datacontext.SubmitChanges();
        }
    }
}
