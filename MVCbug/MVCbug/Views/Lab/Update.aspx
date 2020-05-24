<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Lab>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%=Resources.ResourceUA.UpdateLab %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=Resources.ResourceUA.UpdateLab %></h2>

    <%= Html.ValidationSummary(Resources.ResourceUA.EditWasUnsuccessful) %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="LabId">LabId:</label>
                <%= Html.TextBox("LabId", Model.LabId) %>
                <%= Html.ValidationMessage("LabId", "*") %>
            </p>
            <p>
                <label for="Title">Title:</label>
                <%= Html.TextBox("Title", Model.Title) %>
                <%= Html.ValidationMessage("Title", "*") %>
            </p>
            <p>
                <label for="Text">Text:</label>
                <%= Html.TextBox("Text", Model.Text) %>
                <%= Html.ValidationMessage("Text", "*") %>
            </p>
            <p>
                <label for="CreatedOn">CreatedOn:</label>
                <%= Html.TextBox("CreatedOn", String.Format("{0:g}", Model.CreatedOn)) %>
                <%= Html.ValidationMessage("CreatedOn", "*") %>
            </p>
            <p>
                <label for="CategoryId">CategoryId:</label>
                <%= Html.TextBox("CategoryId", Model.CategoryId) %>
                <%= Html.ValidationMessage("CategoryId", "*") %>
            </p>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink(Resources.ResourceUA.Back, "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>

