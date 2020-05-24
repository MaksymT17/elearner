<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.Forum %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="color:Maroon">
        <link href="../../Content/TestStyle.css" rel="stylesheet" type="text/css" />
        <%=  ViewData["SelectCategory"]%></h2>    
    <table>
        <tr style="color:Maroon">
            <td ><% =Resources.ResourceUA.Category %>
            </td>
            <td><%= Resources.ResourceUA.LittleText %>
            </td>
        </tr>
        <%
            foreach (MVCbug.Models.Category c in (IEnumerable<MVCbug.Models.Category>)ViewData["Categories"])
            {%>             
        <tr>                  
              <td> <h1> <%= Html.ActionLink(c.CategoryName, "ListThemes", new { categoryId = c.CategoryId })%></h1>
              </td>            
              <td style="color:Navy"><%=c.Text %></td>              
        </tr> 
        <%  }%>        
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
