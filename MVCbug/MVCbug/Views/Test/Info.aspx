<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.Test %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <%=Resources.ResourceUA.TitleTestInfo %></h1>
    <h2><%=Resources.ResourceUA.TextTestInfo %>
    </h2>
       <div align="center">
           <img src="../../Content/images/checklist.jpg" style="opacity:0.4;filter:alpha(opacity=20)"/>
     </div>
    
    <h1><%=Resources.ResourceUA.TitleTargetAudience %></h1>
    <h2><%=Resources.ResourceUA.TextTargetAudience %>
    </h2>
    <h1><%=Resources.ResourceUA.TitleAudience %> </h1>
    <ul>
    <li><%=Resources.ResourceUA.Audience1 %> </li>
    <li><%=Resources.ResourceUA.Audience2 %></li>
    <li><%=Resources.ResourceUA.Audience3 %></li>
    </ul>
    <h1>
        <%= Html.ActionLink(Resources.ResourceUA.StartTestop, "QuestionNext")%></h1>
        <h2><% =Html.ActionLink(Resources.ResourceUA.TestResults, "TestResults") %> </h2>
    <%if (HttpContext.Current.User.IsInRole("admin"))
      {%>
    <%=Html.ActionLink(Resources.ResourceUA.QuestionEditor, "Editor")%>
    <% } %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
