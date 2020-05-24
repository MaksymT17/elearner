<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.Main %>
</asp:Content>
<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%= Html.Encode(ViewData["Message"]) %></h2>
    <p>
        <h1>
            <%=Resources.ResourceUA.DistantLearning %></h1>
        <%=Resources.ResourceUA.DLText %>
    </p>
    <p>
        <%=Resources.ResourceUA.DLText1 %></p>
    <h2>
        <%=Resources.ResourceUA.DLIs %></h2>
    <ul>
        <li>
            <%=Resources.ResourceUA.DLIs1 %></li>
        <li>
            <%=Resources.ResourceUA.DLIs2 %></li>
    </ul>
    <h1><%=Resources.ResourceUA.OurNews %></h1>
     
     <%-- <%
          foreach (MVCbug.Models.Event e in (IEnumerable<MVCbug.Models.Event>)ViewData["EventsList"])
            {%> 
              <fieldset>
              <legend><h1> <%=e.Title %> </h1></legend> 
             
           <img   src="../../Images/Events/<%=e.EventId %>.jpg"  />   
           <h2><%=e.Text %></h2> 
                
          </fieldset>
        <%  }%>--%>
    
</asp:Content>
