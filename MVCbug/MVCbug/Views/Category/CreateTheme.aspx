<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Theme>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%=Resources.ResourceUA.NewTheme %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2><%=Resources.ResourceUA.Category %> <%= MVCbug.Models.InputMessageContext.Current.CurrentMessage.CategoryName %></h2>
    

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend><%=Resources.ResourceUA.CreateTheme %></legend>
           
            <p>
                <label for="ThemeName"><%=Resources.ResourceUA.NameTheme %>:</label>
                <%= Html.TextBox("ThemeName") %>
                <%= Html.ValidationMessage("ThemeName", "*") %>
            </p>
           
            <p>
                <input type="submit" value="Додати" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink(Resources.ResourceUA.Back, "ThemeList") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>

