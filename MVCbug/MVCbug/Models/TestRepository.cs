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
    public class TestRepository
    {
          private MVCbugDataContext _datacontext;
          public TestRepository()
          {

          }
        public TestRepository(MVCbugDataContext datacontext)
        {
            _datacontext = datacontext;
        }
        
        public Test GetTest(int testId)
        {
            return _datacontext.Tests.SingleOrDefault(t => t.TestId == testId);
        }
        public Test CreateTest()
        {
            MembershipUser user = Membership.GetUser(HttpContext.Current.User.Identity.Name);     // start test for current user
            string userId = user.ToString();
            Guid userGuid = new Guid(user.ProviderUserKey.ToString());
            Test newTest = new Test { UserId = userGuid, UserName = HttpContext.Current.User.Identity.Name, AnswersAll=0, AnswersCorrectly=0, CategoryName="Об'єктно-орієнтоване програмування", Began=System.DateTime.Now };
            _datacontext.Tests.InsertOnSubmit(newTest);
            _datacontext.SubmitChanges();
            return newTest;
        }
        public void UpdateTest()
        {
            Test test = GetTest(MyContext.Current.CurrentTest.TestId); //check answer - coorectly/wrong    and   save  result in  "MyContext"
            test.AnswersAll = MyContext.Current.CurrentTest.AnswersAll;
            test.AnswersCorrectly = MyContext.Current.CurrentTest.AnswersCorrectly;
            test.Finished = System.DateTime.Now;
            _datacontext.SubmitChanges();
        }
        public  IEnumerable<Test> GetTestsResults()
        {
            return _datacontext.Tests.OrderBy(t=>t.UserId);
        }
    }
}
