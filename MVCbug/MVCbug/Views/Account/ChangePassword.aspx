<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.ChangePassword %>
</asp:Content>
<asp:Content ID="changePasswordContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%=Resources.ResourceUA.ChangePassword %></h2>
    <p>
        <%=Resources.ResourceUA.UseChangePasswordForm %>.
    </p>
    <p>
        <%=Resources.ResourceUA.TheLenghtOfPAssword %>
        <%=Html.Encode(ViewData["PasswordLength"])%>
        <%=Resources.ResourceUA.InLenght %>
    </p>
    <%= Html.ValidationSummary(Resources.ResourceUA.ChangePasswordFailed)%>
    <% using (Html.BeginForm())
       { %>
    <div>
        <fieldset>
            <legend>
                <%=Resources.ResourceUA.RegistrationInformation %></legend>
            <table>
                <tr>
                    <td>
                        <label for="currentPassword">
                            <%=Resources.ResourceUA.PasswordOld %>:</label>
                    </td>
                    <td>
                        <%= Html.Password("currentPassword")%>
                    </td>
                    <%= Html.ValidationMessage("currentPassword")%>
                </tr>
                <tr>
                    <td>
                        <label for="newPassword">
                            <%=Resources.ResourceUA.PasswordNew %>:</label>
                    </td>
                    <td>
                        <%= Html.Password("newPassword")%>
                    </td>
                    <%= Html.ValidationMessage("newPassword")%>
                </tr>
                <tr>
                    <td>
                        <label for="confirmPassword">
                            <%=Resources.ResourceUA.ConfirmNewPassword %>:</label>
                    </td>
                    <td>
                        <%= Html.Password("confirmPassword")%>
                    </td>
                    <%= Html.ValidationMessage("confirmPassword")%>
                </tr>
                <tr>
                <p>
                    <input type="submit" value="Змінити пароль" />
                </p></tr>
            </table>
        </fieldset>
    </div>
    <% } %>
</asp:Content>
