<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Lab>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%=Resources.ResourceUA.CreateLab %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=Resources.ResourceUA.CreateLab %></h2>

    <%= Html.ValidationSummary("Виправте помилки.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <p><%= Html.ValidationSummary()%></p>
    <p>
        <%=Resources.ResourceUA.Theme %>:
        <%=Html.TextBox("Title")%> <%= Html.ValidationMessage("Title")%></p>
    <p>
        <%=Resources.ResourceUA.LittleInfo %>:
        <%=Html.TextArea("Text")%> <%= Html.ValidationMessage("Text")%></p>
    
  
    
    <p>
        <input type="submit" value="Додати" /></p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink(Resources.ResourceUA.LabList, "LabList") %>
    </div>

</asp:Content>

