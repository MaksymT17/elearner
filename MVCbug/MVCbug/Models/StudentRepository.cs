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
using System.Collections;

namespace MVCbug.Models
{
    public class StudentRepository
    {
        private MVCbugDataContext _datacontext;

        public StudentRepository(MVCbugDataContext datacontext)
        {
            _datacontext = datacontext;
        }
        public StudentRepository()
        {

        }

        public IEnumerable<Student> GetStudents()
        {
            return _datacontext.Students.OrderBy(s => s.StudentId);              // get all students
        }

        public Student GetStudent(int studentId)
        {
            return _datacontext.Students.SingleOrDefault(s => s.StudentId == studentId);
        }
        public LabResult GetLabResultByStudentId(int studentId)
        {
            return _datacontext.LabResults.SingleOrDefault(l => l.StudentId == studentId);
        }
        public Student GetStudentByUserId(Guid userGuid)
        {
            return _datacontext.Students.SingleOrDefault(s => s.UserId == userGuid);
        }

        public Student CreateStudent(Student s)
        {
            MembershipUser user = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            string userId = user.ToString();
            Guid userGuid = new Guid(user.ProviderUserKey.ToString());
            s.UserId = userGuid;
            s.Created = System.DateTime.Now;
            _datacontext.Students.InsertOnSubmit(s);
            _datacontext.SubmitChanges();          
                LabResult lr = new LabResult();
                lr.StudentId = s.StudentId;
                lr.Lab1 = "-";
                lr.Lab2 = "-";
                lr.Lab3 = "-";
                _datacontext.LabResults.InsertOnSubmit(lr);
                _datacontext.SubmitChanges();            
                return s;
        }
        public void DeleteStudent(int id)
        {
        Student std = GetStudent(id);
        LabResult lr = GetLabResultByStudentId(id);
        _datacontext.LabResults.DeleteOnSubmit(lr);
        _datacontext.Students.DeleteOnSubmit(std);
        _datacontext.SubmitChanges();
        }
        public IEnumerable<LabResult> GetLabResults()
        {
            return _datacontext.LabResults.OrderBy(r => r.StudentId);          //get all results
        }

        public LabResult GetStudentResult(int resultId)
        {           
            return _datacontext.LabResults.SingleOrDefault(r => r.ResultLabId == resultId);
        }

        public LabResult GetStudentResultByStudent(int studentId)
        {
            return _datacontext.LabResults.SingleOrDefault(r => r.StudentId == studentId);
        }
        public void PutMarks(int studentId, char lab1, char lab2, char lab3)
        {
              LabResult lr =  GetStudentResultByStudent(studentId);     // "admin" insert marks for "Student"
              lr.Lab1 = lab1.ToString();
              lr.Lab2 = lab2.ToString();
              lr.Lab3 = lab3.ToString();
              _datacontext.SubmitChanges();                        
        }

    }
}
