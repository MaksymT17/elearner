<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Task>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.PersonalTask %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%=Resources.ResourceUA.PersonalTask %></h2>
    <fieldset style="color: Navy;">
        <legend>
            <%if (Model.aspnet_User != null)
              {  %>
            <%=Model.aspnet_User.LoweredUserName %>
            <% } %></legend>
        <p>
            <%=Resources.ResourceUA.Theme %>:
            <%= Html.Encode(Model.Title) %>
        </p>
        <p>
            <%=Resources.ResourceUA.LittleInfo %>:
            <%= Html.Encode(Model.Text) %>
        </p>
        <p>
            <%=Resources.ResourceUA.CreatedDate %>:
            <%= Html.Encode(String.Format("{0:g}", Model.CreatedOn)) %>
        </p>
        <p>
            <%=Resources.ResourceUA.MaxMark %>:
            <%= Html.Encode(Model.State.Title) %>
        </p>
    </fieldset>
    <p>
        <% if (HttpContext.Current.User.IsInRole("admin"))
           {%>
        <%=Html.ActionLink(Resources.ResourceUA.Edit, "Edit", new { id=Model.TaskId }) %>
        |
        <%=Html.ActionLink(Resources.ResourceUA.Delete, "Delete", new { id = Model.TaskId }, new { onclick="return confirm('Ви впевнені ?');"})%>
        |
        <%} %>
        <%=Html.ActionLink(Resources.ResourceUA.Back, "List")%>
    </p>
</asp:Content>
