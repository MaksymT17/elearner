<%@Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.ChangePassword %>
</asp:Content>

<asp:Content ID="changePasswordSuccessContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%=Resources.ResourceUA.ChangePassword %></h2>
    <p>
        <%=Resources.ResourceUA.PasswordAreChanged %>
    </p>
</asp:Content>
