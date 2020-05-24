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

namespace MVCbug.Models
{
    public class DataManager
    {
        private MVCbugDataContext _datacontext;
        public DataManager(string connectionstring)
        {
            _datacontext = new MVCbugDataContext(connectionstring);
        }
        private MembershipRepository _membershipRepository;
        public MembershipRepository Membership
        {
            get
            {
                if (_membershipRepository == null)
                    _membershipRepository = new MembershipRepository();

                return _membershipRepository;
            }
        }

        private TaskRepository _taskRepository;
        public TaskRepository Tasks
        {
            get
            {
                if (_taskRepository == null)
                    _taskRepository = new TaskRepository(_datacontext);

                return _taskRepository;
            }
        }

        private StateRepository _stateRepository;
        public StateRepository States
        {
            get
            {
                if (_stateRepository == null)
                    _stateRepository = new StateRepository(_datacontext);

                return _stateRepository;
            }
        }

        private MessagesRepository _messRepository;
        public MessagesRepository Messages
        {
            get
            {
                if (_messRepository == null)
                    _messRepository = new MessagesRepository(_datacontext);

                return _messRepository;
            }
        }

        private CategoryRepository _categoryRepository;
        public CategoryRepository Categories
        {
            get
            {
                if (_categoryRepository == null)
                    _categoryRepository = new CategoryRepository(_datacontext);

                return _categoryRepository;
            }
        }

        private QuestionRepository _questionRepository;
        public QuestionRepository Questions
        {
            get
            {
                if (_questionRepository == null)
                    _questionRepository = new QuestionRepository(_datacontext);

                return _questionRepository;
            }
        }

        private TestRepository _testRepository;
        public TestRepository Tests
        {
            get
            {
                if (_testRepository == null)
                    _testRepository = new TestRepository(_datacontext);

                return _testRepository;
            }
        }

        private LabRepository _labRepository;
        public LabRepository Labs
        {
            get
            {
                if (_labRepository == null)
                    _labRepository = new LabRepository(_datacontext);

                return _labRepository;
            }
        }

        private ThemeRepository _themeRepository;
        public ThemeRepository Themes
        {
            get
            {
                if (_themeRepository == null)
                    _themeRepository = new ThemeRepository(_datacontext);

                return _themeRepository;
            }
        }

        private StudentRepository _studentRepository;
        public StudentRepository Students
        {
            get
            {
                if (_studentRepository == null)
                    _studentRepository = new StudentRepository(_datacontext);

                return _studentRepository;
            }
        }

        private EventRepository _eventRepository;
        public EventRepository Events
        {
            get
            {
                if (_eventRepository == null)
                    _eventRepository = new EventRepository(_datacontext);

                return _eventRepository;
            }
        }

        private EventSateRepository _eventStateRepository;
        public EventSateRepository EventStates
        {
            get
            {
                if (_eventStateRepository == null)
                    _eventStateRepository = new EventSateRepository(_datacontext);

                return _eventStateRepository;
            }
        }




    }
}
