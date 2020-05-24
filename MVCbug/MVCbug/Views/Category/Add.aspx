<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Message>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.CreateMess %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%=Resources.ResourceUA.CreateMess %></h2>
    <%= Html.ValidationSummary(Resources.ResourceUA.EditWasUnsuccessful)%>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend>
            <%=Resources.ResourceUA.InsertColumnsForMess %></legend>
        <table>
            <tr>
                <td>
                    <label for="AnswerTo">
                        <%=Resources.ResourceUA.CreateMess %>:
                    </label>
                </td>
                <td>
                    <%= Html.TextBox("AnswerTo")%>
                </td>
                <%= Html.ValidationMessage("AnswerTo", "*")%>
            </tr>
            <tr>
                <td>
                    <label for="Text">
                        <%=Resources.ResourceUA.Mess %>:</label>
                </td>
                <td height="50" width="300">
                    <%= Html.TextBox("Text")%>
                </td>
                <%= Html.ValidationMessage("Text", "*")%>
            </tr>
        </table>
        <p>
            <input type="submit" value="Додати" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%=Html.ActionLink(Resources.ResourceUA.Back, "ForumList")%>
         
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
