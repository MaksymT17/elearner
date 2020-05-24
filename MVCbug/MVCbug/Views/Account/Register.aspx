<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
   <%= Resources.ResourceUA.CreatingAccount%>
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%= Resources.ResourceUA.CreatingAccount%></h2>
    <p>
        <%=Resources.ResourceUA.UseNextForms %>. 
    </p>
    
    <%= Html.ValidationSummary(Resources.ResourceUA.RegistrationFailed)%>

    <% using (Html.BeginForm())
       { %>
        <div>
            <fieldset>
                <legend><%=Resources.ResourceUA.RegistrationInformation %></legend>
                <table>
                <tr>
                   <td> <label for="username"><%=Resources.ResourceUA.UserName %>:</label></td>
                   <td>  <%= Html.TextBox("username")%></td>
                   <td> <%= Html.ValidationMessage("username")%></td>
                </tr>
               <tr>
                   <td>  <label for="email">Email:</label></td>
                  <td>   <%= Html.TextBox("email")%></td>
                   <td>  <%= Html.ValidationMessage("email")%></td>
                </tr>
                <tr>
                   <td> <label for="password"><%=Resources.ResourceUA.Password %>:</label></td>
                   <td> <%= Html.Password("password")%></td>
                    <td><%= Html.ValidationMessage("password")%></td>
               </tr>
               <tr>
                   <td> <label for="confirmPassword"><%=Resources.ResourceUA.ConfirmPassword %>:</label></td>
                   <td> <%= Html.Password("confirmPassword")%></td>
                   <td> <%= Html.ValidationMessage("confirmPassword")%></td>
               </tr>
                </table>
                <p>
                
                </p>
                    <input type="submit" value="Зареєструвати" />
                
            </fieldset>
        </div>
    <% } %>
</asp:Content>
