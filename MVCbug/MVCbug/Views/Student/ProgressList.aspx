<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ProgressList
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%=Resources.ResourceUA.StudentProgressList %></h2>
    <table style="color: Navy;">
        <td>
            <%=Resources.ResourceUA.Name %>
        </td>
        <td>
             <%=Resources.ResourceUA.SecondName %>
        </td>
        <td>
             <%=Resources.ResourceUA.MiddleName %>
        </td>
        <td>
            <%=Resources.ResourceUA.Lab1 %>
        </td>
        <td>
             <%=Resources.ResourceUA.Lab2 %>
        </td>
        <td>
            <%=Resources.ResourceUA.Lab3 %>
        </td>
        <td>
             <%=Resources.ResourceUA.Test %>
        </td>
        <%
            List<int> maxMarks = new List<int>();
            int index = 0;
            foreach (int currentMark in (IEnumerable<int>)ViewData["Marks"])
            {              
                maxMarks.Add(currentMark);
            }  
                foreach (MVCbug.Models.Student s in (IEnumerable<MVCbug.Models.Student>)ViewData["Students"])
                {
                    foreach (MVCbug.Models.LabResult r in (IEnumerable<MVCbug.Models.LabResult>)ViewData["StudentsResults"])
                    {
        %>
        <%if (s.StudentId == r.StudentId)
          { %>
        <tr>
            <td>
                <%=s.Name%>
            </td>
            <td>
                <%=s.SecondName%>
            </td>
            <td>
                <%=s.MiddleName%>
            </td>
            <td>
                <%=r.Lab1%>
            </td>
            <td>
                <%=r.Lab2%>
            </td>
            <td>
                <%=r.Lab3%>
            </td>
            <td>
                <%=maxMarks[index] %>
            </td>
            <% if (User.IsInRole("admin"))
               { %>
            <td>
                <%=Html.ActionLink( Resources.ResourceUA.InsertMarks , "InsertMarks", new { studentId = r.StudentId })%>
            </td>
        </tr>
        <%   }
          }
                    }
                    index++;
                }
            %>
    </table>
</asp:Content>
