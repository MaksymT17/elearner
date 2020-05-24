<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= ViewData["Title"]%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%=  ViewData["AllMessages"]%></h2>
    
    
      <%if (User.Identity.IsAuthenticated==false)
           {
      { %>
      
        <%
        foreach (MVCbug.Models.Message m in (IEnumerable<MVCbug.Models.Message>)ViewData["Messages"])
        {%>
        <fieldset>
        <legend><%= m.aspnet_User.UserName%> </legend> 
            <table bgcolor="#0066ff"">          
            <tr>            
            <tr><td><%=m.AnswerTo%> </td> </tr>
            <tr><td><%=m.Text%></td> </tr>
            <tr><td><%=m.DateTime%></td></tr>            
         </table>
         </fieldset>
         <p>            
            </p>

        <%  }%>
        
        <%  }%>
        <%  }%>
    
         <%if (User.IsInRole("admin"))
           {
      { %>
      
        <%
        foreach (MVCbug.Models.Message m in (IEnumerable<MVCbug.Models.Message>)ViewData["Messages"])
        {%>
        <fieldset>
        <legend><%= m.aspnet_User.UserName%> </legend> 
            <table bgcolor="#0066ff">           
            <tr>            
            <tr><td><%=m.AnswerTo%> <%= Html.ActionLink(Resources.ResourceUA.CreateMess, "Add", new { m.AnswerTo, m.CategoryName })%></td> </tr>
            <tr><td><%=m.Text%></td> </tr>
            <tr><td><%=m.DateTime%></td></tr>
            <tr> <%=Html.ActionLink( Resources.ResourceUA.Delete, "Delete", new { id = m.MessageId }, new { onclick="return confirm('Ви впевнені ?');"})%> </tr>
         </table>
         </fieldset>
         <p>            
            </p>
        <%  }%>
        <%{
              MVCbug.Models.Message m =new MVCbug.Models.Message(); %>
        <%= Html.ActionLink(Resources.ResourceUA.Question_answer, "Add", new { m.CategoryName })%>
        <% }%>
        <%  }%>
        
        
    <%  }%>
 
    
    <% if (User.Identity.IsAuthenticated == true && User.Identity.Name != "admin")
      { %>
      
        <%
        foreach (MVCbug.Models.Message m in (IEnumerable<MVCbug.Models.Message>)ViewData["Messages"])
        {%>
        <fieldset>
        <legend><%= m.aspnet_User.UserName%> </legend> 
            <table bgcolor="#0066ff" >    
         
            <tr>
            
            <tr><td><%=m.AnswerTo%> <%= Html.ActionLink(Resources.ResourceUA.Question_answer, "Add", new { m.AnswerTo, m.CategoryName })%></td> </tr>
            <tr><td><%=m.Text%></td> </tr>
            <tr><td><%=m.DateTime%></td></tr>
            
         </table>
         </fieldset>
         <p>
            
            </p>

        <%  }%>
        <%{
              MVCbug.Models.Message m =new MVCbug.Models.Message(); %>
        <%= Html.ActionLink(Resources.ResourceUA.Question_answer, "Add", new { m.AnswerTo, m.CategoryName })%>
        <% }%>
        <%  }%>
      
      
      
        
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
