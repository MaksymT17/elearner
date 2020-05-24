<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.AddTaskMyself %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%=Resources.ResourceUA.AddTaskMyself %></h2>
   <%  using (Html.BeginForm())
       {%>
       
       
       <p><%= Html.ValidationSummary()%></p>
    <p>
        <%=Resources.ResourceUA.Theme %>:
        <%=Html.TextBox("Title")%> <%= Html.ValidationMessage("Title")%></p>
    <p>
        <%=Resources.ResourceUA.LittleInfo %>:
        <%=Html.TextArea("Text")%> <%= Html.ValidationMessage("Text")%></p>    
    
    <p>
        <input type="submit" value="Додати" /></p>
    <%
           } %>
</asp:Content>
