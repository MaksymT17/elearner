<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.TaskList %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Content/TestStyle.css" rel="stylesheet" type="text/css" />
    
    
    <h2>
        <%=  ViewData["Title"]%></h2><%=Html.ActionLink("Home","Index", "Home")%>
    <table>
        <tr>
            <td>
                <%=Resources.ResourceUA.Action %>
            </td>
            <td>
                <%=Resources.ResourceUA.Theme %>
            </td>
            <td>
                <%=Resources.ResourceUA.State%>
            </td>
            <td>
                <%=Resources.ResourceUA.CreatedDate %>
            </td>
        </tr>
        <%
            foreach (MVCbug.Models.Task t in (IEnumerable<MVCbug.Models.Task>)ViewData["Tasks"])
            {%>
        <tr style="color: Silver;">
            <td>
                <%= Html.ActionLink(Resources.ResourceUA.More, "Task", new {  id=t.TaskId})%>
            </td>
            <td>
                <%=t.Title %>
            </td>
            <td>
                <%= t.State.Title %>
            </td>
            <td>
                <%=t.CreatedOn.ToLongDateString()%>
            </td>
        </tr>
        <%}%>
    </table>
    <p>
    </p>
    <%= Html.ActionLink(Resources.ResourceUA.AddTaskMyself, "Add")%>
    <p>
    </p>
    <table>
        <tr>
            <td style="color: Green">
                <%= Html.ActionLink(Resources.ResourceUA.GoToLabList ,"LabList","LabController") %>
            </td>
            <td>
                <%= Html.ActionLink(Resources.ResourceUA.GoToProgressList, "TestResults", "TestController")%>
            </td>
        </tr>
    </table>
</asp:Content>
