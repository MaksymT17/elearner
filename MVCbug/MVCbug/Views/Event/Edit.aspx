<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Event>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>
     <fieldset>
            <legend><%=Model.Title %></legend>            
            <tr>
            <img width="500px" ID="Image1" src="../../Images/Events/<%= Model.EventId %>.jpg"  "/>
            </tr>            
           <table> 
            <tr>
                <label for="Title">Title:</label>
                <%= Html.TextArea("Title", Model.Title) %>
                <%= Html.ValidationMessage("Title", "*") %>
            </tr>
            <tr>
                <label for="Text">Text:</label>
                <%= Html.TextArea("Text", Model.Text) %>
                <%= Html.ValidationMessage("Text", "*") %>
            </tr>
            <tr>
            <label for="StateId">
                <%=Resources.ResourceUA.State %>:</label>
            <%= Html.DropDownList("StateId",(IEnumerable<SelectListItem>)ViewData["States"]) %>
            <%= Html.ValidationMessage("StateId", "*") %>
            </tr>
            <tr>
                <label for="Specificity">Specificity:</label>
                <%= Html.TextBox("Specificity", Model.Specificity) %>
                <%= Html.ValidationMessage("Specificity", "*") %>
            </tr>            
           </table>
        </fieldset>
<input type="submit" value="Save" />
    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>

