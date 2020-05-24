<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.Events %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <%=Resources.ResourceUA.Events %></h1>
    <% foreach (MVCbug.Models.Event e in (IEnumerable<MVCbug.Models.Event>)ViewData["Events"])
       {%>
    <fieldset>
        <legend>
            <h2>
                <%=e.Title %>
            </h2>
        </legend>
        <img height="350px" src="../../Images/Events/<%=e.EventId %>.jpg" />
        <h2>
            <%=e.Text %></h2>
        <% if (HttpContext.Current.User.IsInRole("admin"))
           { %>
        <%= Html.ActionLink(Resources.ResourceUA.Edit, "Edit", new { id=e.EventId })%>
        <%  }%>
    </fieldset>
    <%  }%>
    <%if (HttpContext.Current.User.IsInRole("admin"))
      {  %>
      <%=Html.ActionLink(Resources.ResourceUA.Add, "Add")%>
      <%} %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
