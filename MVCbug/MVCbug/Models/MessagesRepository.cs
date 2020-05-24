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
using System.Collections;
using System.Collections.Generic;

namespace MVCbug.Models
{
    public class MessagesRepository
    {
        private MVCbugDataContext _datacontext;       

        public MessagesRepository(MVCbugDataContext dataСontext)
        {
            _datacontext = dataСontext;
        }

        public IEnumerable<Message> GetMessages(string categoryName, int themeId)
        {
            List<Message> messageArray = _datacontext.Messages.ToList();         //gets collection of "Messages"  in current "Category" and "Theme"
            List<Message> messArray = new List<Message>();
            int j = 0;
            for (int i = 0; i < messageArray.Count(); i++)
            {
                if (messageArray[i].CategoryName == categoryName&&messageArray[i].ThemeId==themeId)
                { 
                messArray.Add(messageArray[i]);
                j++;
                }
            }
            return messArray;
        }
        
        public Message GetMessage(int messageId)
        {
            return _datacontext.Messages.SingleOrDefault(m => m.MessageId == messageId);   // gets "Message" by identifier
        }
        
        public Message CreateMessage(string answerTo,string text)
        {
            MembershipUser user = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            string userId = user.ToString();
            Guid userGuid = new Guid(user.ProviderUserKey.ToString());
            string catName=InputMessageContext.Current.CurrentMessage.CategoryName;
            int thId=int.Parse( InputMessageContext.Current.CurrentMessage.ThemeId.ToString());
            Message m = new Message { AnswerTo = answerTo, UserId = userGuid, CategoryName=catName, Text=text, DateTime=System.DateTime.Now, ThemeId=thId};
            _datacontext.Messages.InsertOnSubmit(m);
            _datacontext.SubmitChanges();
            return m;
        }

        public void UpdateMessage(Message m)
        {
            Message newMess = GetMessage(m.MessageId);           
            newMess.Text = m.Text;
            newMess.AnswerTo = m.AnswerTo;            
            _datacontext.SubmitChanges();
        }

        public void DeleteMessage(int messId)
        {
            Message m = GetMessage(messId);
            _datacontext.Messages.DeleteOnSubmit(m);
            _datacontext.SubmitChanges();
        }        
    }
}
