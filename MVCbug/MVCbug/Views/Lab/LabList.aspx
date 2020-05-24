<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%=Resources.ResourceUA.LabList %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     
<link href="../../Content/TestStyle.css" rel="stylesheet" type="text/css" />
    <h2><%=ViewData["TitleLabList"]%></h2>   
        
        <%
            foreach(MVCbug.Models.Lab l in(IEnumerable<MVCbug.Models.Lab>) ViewData["Labs"])     
            {%>
           <fieldset >
          <legend><%=l.Title %> </legend>
        
        
        <h2><%= l.Text %></h2>
        <p><%=Resources.ResourceUA.CreatedDate %>: <%=l.CreatedOn%></p>
        <% if (HttpContext.Current.User.IsInRole("admin"))
           { %>
        <%= Html.ActionLink(Resources.ResourceUA.Delete, "Delete", new { id = l.LabId }, new { onclick = "return confirm('Ви впевнені ?');" })%> 
        
        <%} %>
        <p>        
        
        
        </p>
             </fieldset>  
          <%}%>              
        
        <% if (HttpContext.Current.User.IsInRole("admin"))
           { %>
        <%= Html.ActionLink(Resources.ResourceUA.AddNewLab, "Add")%> 
        <%} %>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
