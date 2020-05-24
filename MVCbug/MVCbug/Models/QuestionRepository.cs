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
using MVCbug.Models;
using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace MVCbug.Models
{
    public class QuestionRepository
    {
        private MVCbugDataContext _datacontext;
        public QuestionRepository(MVCbugDataContext datacontext)
        {
            _datacontext = datacontext;
        }
        public Question GetRandomQuestion()
        {
            List <Question> questionCollection= _datacontext.Questions.ToList();    // get collection for Questions - all rows in table "Questions"
            Random rnd10 = new Random();
            int countQuest = _datacontext.Questions.Count();                                // count questions in database
            int number = rnd10.Next(1, countQuest);                                         // generation random question from database
            return questionCollection[number];
        }

        public Question GetQuestion(int id)
        {
            return _datacontext.Questions.SingleOrDefault(q => q.QuestionId == id);
        }

        public bool MarkQuestion(string answer, int qId)
        {
            Question q = GetQuestion(qId);
            if (q.Answer == answer)                                                             // check answer - coorectly/wrong
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public void CreateQuestion(Question q)
        {
            _datacontext.Questions.InsertOnSubmit(q);                                            //  add new question to database (only "admin")
            _datacontext.SubmitChanges();
        }
    }
}
