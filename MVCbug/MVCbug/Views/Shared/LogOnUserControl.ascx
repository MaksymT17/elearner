<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        <%=Resources.ResourceUA.welcom %> <b><%= Html.Encode(Page.User.Identity.Name) %></b>!
        [ <%= Html.ActionLink(Resources.ResourceUA.Exit, "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%= Html.ActionLink(Resources.ResourceUA.Authorization, "LogOn", "Account")%> ]
<%
    }
%>
