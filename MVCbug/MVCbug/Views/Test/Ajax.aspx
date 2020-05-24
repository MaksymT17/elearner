<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Question>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Ajax
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Ajax</h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="QuestionId">QuestionId:</label>
                <%= Html.TextBox("QuestionId", Model.QuestionId) %>
                <%= Html.ValidationMessage("QuestionId", "*") %>
            </p>
            <p>
                <label for="CategoryName">CategoryName:</label>
                <%= Html.TextBox("CategoryName", Model.CategoryName) %>
                <%= Html.ValidationMessage("CategoryName", "*") %>
            </p>
            <p>
                <label for="Question1">Question1:</label>
                <%= Html.TextBox("Question1", Model.Question1) %>
                <%= Html.ValidationMessage("Question1", "*") %>
            </p>
            <p>
                <label for="Answer">Answer:</label>
                <%= Html.TextBox("Answer", Model.Answer) %>
                <%= Html.ValidationMessage("Answer", "*") %>
            </p>
            <p>
                <label for="Answer1">Answer1:</label>
                <%= Html.TextBox("Answer1", Model.Answer1) %>
                <%= Html.ValidationMessage("Answer1", "*") %>
            </p>
            <p>
                <label for="Answer2">Answer2:</label>
                <%= Html.TextBox("Answer2", Model.Answer2) %>
                <%= Html.ValidationMessage("Answer2", "*") %>
            </p>
            <p>
                <label for="Answer3">Answer3:</label>
                <%= Html.TextBox("Answer3", Model.Answer3) %>
                <%= Html.ValidationMessage("Answer3", "*") %>
            </p>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>

