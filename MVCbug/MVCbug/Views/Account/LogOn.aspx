<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.Authorization %>
</asp:Content>
<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
    <%=Resources.ResourceUA.InsertUsenamePassword %></h2>
    <%= Html.ValidationSummary(Resources.ResourceUA.ErrorsInData)%>
    <% using (Html.BeginForm())
       { %>
    <div>
        <fieldset>
            <legend>
                <%=Resources.ResourceUA.AuthorizationInfo %></legend>
            <tr>
            </tr>
            <p>
            </p>
            <table>
                <tr>
                    <td>
                        <label for="username">
                            <%=Resources.ResourceUA.UserName %>:</label>
                    </td>
                    <td>
                        <%= Html.TextBox("username") %>
                        <%= Html.CheckBox("rememberMe") %>
                        <label class="inline" for="rememberMe">
                            <%=Resources.ResourceUA.RememberMe %></label>
                    </td>
                    <%= Html.ValidationMessage("username") %>
                </tr>
                <tr>
                    <td>
                        <label for="password">
                            <%=Resources.ResourceUA.Password %>:</label>
                    </td>
                    <td>
                        <%= Html.Password("password") %>
                        <%=Html.ActionLink(Resources.ResourceUA.ChangePassword, "ChangePassword")%>
                    </td>
                    <%= Html.ValidationMessage("password") %>
                </tr>
            </table>
            <input type="submit" value="Вхід" />
        </fieldset>
        <h1>
            <%=Resources.ResourceUA.IfYouHaventAccount %>
            <%= Html.ActionLink(Resources.ResourceUA.ToRegister, "Register")%>
        . </h>
    </div>
    <% } %>
</asp:Content>
