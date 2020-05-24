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

namespace MVCbug.Models
{
    public class CategoryRepository
    {
        private MVCbugDataContext _datacontext;
        public CategoryRepository(MVCbugDataContext dataСontext)
        {
            _datacontext = dataСontext;
        }

        public IEnumerable<Category> GetCategories()
        {
            return _datacontext.Categories.OrderBy(c => c.CategoryId);
        }

        public Category GetCategory(int catId)
        {
            return _datacontext.Categories.SingleOrDefault(c => c.CategoryId == catId);
        }
        public int GetCategoryIdByName(string categoryName)
        {
            Category c = new Category();
            c=_datacontext.Categories.SingleOrDefault(cat => cat.CategoryName == categoryName);
            return c.CategoryId;
        }

        public Category CreateCategory(string name, string text)
        {
            Category c = new Category { CategoryName = name, Text = text };
            _datacontext.Categories.InsertOnSubmit(c);
            _datacontext.SubmitChanges();
            return c;
        }

        public void UpdateCategory(Category c)
        {
            Category newCategory = GetCategory(c.CategoryId);
            newCategory.CategoryId = c.CategoryId;
            newCategory.Text = c.Text;
            newCategory.CategoryName = c.CategoryName;
            _datacontext.SubmitChanges();
        }

        public void DeleteCategory(int catId)
        {
            Category c = GetCategory(catId);
            _datacontext.Categories.DeleteOnSubmit(c);
            _datacontext.SubmitChanges();
        }
        public IEnumerable<Message> ShowCategory(string categoryName)
        {
            return _datacontext.Messages;
        }

        public Message CreateMessage(string answerTo, string text,int categoryId, string categoryName)
        {
            MembershipUser user = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            string userId = user.ToString();
            Guid userGuid = new Guid(user.ProviderUserKey.ToString());
            Message m = new Message { UserId = userGuid,AnswerTo=answerTo, Text=text, CategoryName=categoryName,DateTime=System.DateTime.Now };
            _datacontext.Messages.InsertOnSubmit(m);
            _datacontext.SubmitChanges();
            return m;
        }
    }
}