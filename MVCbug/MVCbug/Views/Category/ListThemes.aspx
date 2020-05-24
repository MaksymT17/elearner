<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MVCbug.Models.Theme>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%=Resources.ResourceUA.ListThemes %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h3><%=Resources.ResourceUA.ListThemes %> <%=MVCbug.Models.InputMessageContext.Current.CurrentMessage.CategoryName.ToString()%></h3>

<%if(HttpContext.Current.User.Identity.IsAuthenticated==false)
  {%>
<table>  
  <tr>
  <td style=" width:200px"><%=Resources.ResourceUA.Theme %></td>
  <td><%=Resources.ResourceUA.CreatedDate %></td>
  </tr>
     <%
    foreach (MVCbug.Models.Theme t in (IEnumerable<MVCbug.Models.Theme>)ViewData["Themes"])
    {%> 
            <tr>
        <td ><h2><%=Html.ActionLink(t.ThemeName, "ForumList", new { themeId = t.ThemeId })%></h2></td>
        <td><h1><%= t.CreatedOn%></h1></td>
            </tr>
          <%}%>
         </table>
<%} %>

<%if (HttpContext.Current.User.IsInRole("admin"))
  {%>
<table>  
  <tr>
  <td style=" width:200px"><%=Resources.ResourceUA.Theme %></td>
  <td><%=Resources.ResourceUA.CreatedDate %></td>
  </tr>
     <%
    foreach (MVCbug.Models.Theme t in (IEnumerable<MVCbug.Models.Theme>)ViewData["Themes"])
    {%>
            <tr>
        <td ><h2><%=Html.ActionLink(t.ThemeName, "ForumList", new { themeId = t.ThemeId })%></h2></td>
        <td><h1><%= t.CreatedOn%></h1></td>
           <td> <%=Html.ActionLink(Resources.ResourceUA.Delete, "DeleteTheme", new { themeId = t.ThemeId }, new { onclick = "return confirm('Ви впевнені ?');" })%></td>
            </tr>
          <%}%>
         </table>
         
    <p>
        <%= Html.ActionLink(Resources.ResourceUA.CreateTheme, "CreateTheme")%>
    </p>
<%} %>











<%if (User.Identity.IsAuthenticated && User.Identity.Name!="admin")
  {%>
<table>  
  <tr>
  <td style=" width:200px">Тема</td>
  <td><%=Resources.ResourceUA.CreatedDate %></td>
  </tr>
     <%
    foreach (MVCbug.Models.Theme t in (IEnumerable<MVCbug.Models.Theme>)ViewData["Themes"])
    {%>
            
            
            <tr>
        <td ><h2><%=Html.ActionLink(t.ThemeName, "ForumList", new { themeId = t.ThemeId })%></h2></td>
        <td><h1><%= t.CreatedOn%></h1></td>
            </tr>
           
           
          <%}%>
         </table>
         
    <p>
        <%= Html.ActionLink(Resources.ResourceUA.CreateTheme, "CreateTheme")%>
    </p>
<%} %>







</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>

