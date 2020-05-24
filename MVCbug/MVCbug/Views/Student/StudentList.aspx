<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.StudentList %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Content/TestStyle.css" rel="stylesheet" type="text/css" />
    <h2>
        <% =ViewData["Title"]%></h2>
    <table>
        <tr>
            <td>               <%=Resources.ResourceUA.Name %>                  </td>
            <td>               <%=Resources.ResourceUA.SecondName %>            </td>
            <td>               <%=Resources.ResourceUA.MiddleName %>            </td>
            <td>               <%=Resources.ResourceUA.Year %>                  </td>
            <td>               <%=Resources.ResourceUA.Country %>               </td>
            <td>               <%=Resources.ResourceUA.Town %>                  </td>
        </tr>
        <tr>
        </tr>
        <%
            foreach (MVCbug.Models.Student s in (IEnumerable<MVCbug.Models.Student>)ViewData["Students"])
            {%>
        <tr style="color: Navy;">
               
            <td>
                <%=s.Name %>
            </td>
            <td>
                <%= s.SecondName%>
            </td>
            <td>
                <%=s.Profession%>
            </td>
            <td>
                <%=s.BornYear%>
            </td>
            <td>
                <%=s.Country %>
            </td>
            <td>
                <%=s.Town %>
            </td>
            <%if (User.IsInRole("admin"))
              { %>
            <td>
                <%=Html.ActionLink(Resources.ResourceUA.DeleteStudent, "Delete", new { id = s.StudentId })%>
            </td>
            <%} %>
        </tr>
        <tr>
        </tr>
        <%}%>
    </table>
    <p>
        <%= Html.ActionLink(Resources.ResourceUA.AddMyself, "Create") %>
    </p>
    <p>
        <%= Html.ActionLink(Resources.ResourceUA.ViewProgressList, "ProgressList") %>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>