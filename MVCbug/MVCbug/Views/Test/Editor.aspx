<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Question>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.QuestionEditor %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%=Resources.ResourceUA.QuestionEditor %></h2>
    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.")%>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend>
            <%=Resources.ResourceUA.InsertData %></legend>
        <table>
            <p>
                <tr>
                    <td>
                        <label for="CategoryName">
                            <%=Resources.ResourceUA.InsertData %>:</label>
                    </td>
                    <td>
                        <%= Html.TextBox("CategoryName")%>
                    </td>
                    <%= Html.ValidationMessage("CategoryName", "*")%>
                </tr>
            </p>
            <p>
                <tr>
                    <td>
                        <label for="Question1">
                            <%=Resources.ResourceUA.Question %>:</label>
                    </td>
                    <td>
                        <%= Html.TextBox("Question1")%>
                    </td>
                    <%= Html.ValidationMessage("Question1", "*")%>
                </tr>
            </p>
            <p>
                <tr>
                    <td>
                        <label for="Answer">
                            <%=Resources.ResourceUA.WrightAnswer %>:</label>
                    </td>
                    <td>
                        <%= Html.TextBox("Answer")%>
                    </td>
                    <%= Html.ValidationMessage("Answer", "*")%>
                </tr>
            </p>
            <p>
                <tr>
                    <td>
                        <label for="Answer1">
                            <%=Resources.ResourceUA.WrongAnswer1 %>:</label>
                    </td>
                    <td>
                        <%= Html.TextBox("Answer1")%>
                    </td>
                    <%= Html.ValidationMessage("Answer1", "*")%>
                </tr>
            </p>
            <p>
                <tr>
                    <td>
                        <label for="Answer2">
                            <%=Resources.ResourceUA.WrongAnswer2 %>:</label>
                    </td>
                    <td>
                        <%= Html.TextBox("Answer2")%>
                    </td>
                    <%= Html.ValidationMessage("Answer2", "*")%>
                </tr>
            </p>
            <p>
                <tr>
                    <td>
                        <label for="Answer3">
                            <%=Resources.ResourceUA.WrongAnswer3 %>:</label>
                    </td>
                    <td>
                        <%= Html.TextBox("Answer3")%>
                    </td>
                    <%= Html.ValidationMessage("Answer3", "*")%>
                </tr>
            </p>
        </table>
        <p>
            <input type="submit" value="ַבונודעט" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%=Html.ActionLink(Resources.ResourceUA.Back, "Index")%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
