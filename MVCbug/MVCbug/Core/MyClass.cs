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

namespace MVCbug.Core
{
    public class MyClass
    {
        public MyClass()
        {

        }

        public List<int> SortQuestionNumbers()
        {
            List<int> numbers = new List<int>();            
            List<int> intArray = new List<int>();
            intArray.Add(1);
            intArray.Add(1);
            intArray.Add(1);
            intArray.Add(1);

            Random rn = new Random();
            intArray[0] = rn.Next(0, 4);
            for (int i = 0; i < 10000000; i++)
            {
                intArray[1] = rn.Next(0, 4);
                intArray[2] = rn.Next(0, 4);
                intArray[3] = rn.Next(0, 4);
                if (intArray[0] != intArray[1])
                {
                    if (intArray[0] != intArray[2])
                    {
                        if (intArray[0] != intArray[3])
                        {
                            if (intArray[1] != intArray[2])
                            {
                                if (intArray[1] != intArray[3])
                                {
                                    if (intArray[2] != intArray[3])
                                    {
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
            }           
                return intArray;
            }
        }
    }

