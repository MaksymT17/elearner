<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Event>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%= Resources.ResourceUA.AddEvent %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%= Resources.ResourceUA.AddEvent %></h2>
    <form id="form1" runat="server">
        <fieldset>
            <legend><%= Resources.ResourceUA.AddEvent %></legend>
          <table>            
              <tr><td>  <label for="Title" id="titleTextbox"><%= Resources.ResourceUA.Theme %>:</label></td>
              <td>  <%= Html.TextBox("Title")%></td>  <td><%= Html.ValidationMessage("Title", "*")%></td></tr>
           
               <tr><td><label for="Text"><%= Resources.ResourceUA.LittleText %>:</label></td>
                <td><%= Html.TextBox("Text")%></td>   <td> <%= Html.ValidationMessage("Text", "*")%></td></tr>
            
                <tr><td><label for="Specificity"><%= Resources.ResourceUA.Specificity %>:</label>
               <td> <%= Html.TextBox("Specificity")%> </td>   <td> <%= Html.ValidationMessage("Specificity", "*")%></td></tr>            
            </table> 
            <p>
                <input type="submit" value="Далі" />
            </p>
        </fieldset>
        </form>
    <div>
        <%=Html.ActionLink("Back to List", "Index")%>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>

