<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Task>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.ChangeTask %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%=Resources.ResourceUA.ChangeTask %></h2>

    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>

    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>

    <h2>
    </h2>

    <script type="text/javascript">
    function AjaxSuccess()
    {
    alert('Ви впевнені?')
    }
    </script>

    <%= Html.ValidationSummary(Resources.ResourceUA.EditWasUnsuccessful) %>
    <%  using (Ajax.BeginForm(new AjaxOptions { UpdateTargetId = "message", OnSuccess = "AjaxSuccess" }))
        { %>
    <div id="message">
    </div>
    <fieldset>
        <legend>
            <%=Resources.ResourceUA.InsertChanges %></legend>
        <p>
            <label for="Title">
                <%=Resources.ResourceUA.Theme %>:</label>
            <%= Html.TextBox("Title") %>
            <%= Html.ValidationMessage("Title", "*") %>
        </p>
        <p>
            <label for="Text">
                <%=Resources.ResourceUA.LittleInfo %>:</label>
            <%= Html.TextArea("Text") %>
            <%= Html.ValidationMessage("Text", "*") %>
        </p>
        <p>
            <label for="StateId">
                <%=Resources.ResourceUA.State %>:</label>
            <%= Html.DropDownList("StateId",(IEnumerable<SelectListItem>)ViewData["States"]) %>
            <%= Html.ValidationMessage("StateId", "*") %>
        </p>
        <p>
            <label for="AssignedOn">
                <%=Resources.ResourceUA.User %>:</label>
            <%= Html.DropDownList("AssignedOn", (IEnumerable<SelectListItem>)ViewData["Users"])%>
            <%= Html.ValidationMessage("AssignedOn", "*") %>
        </p>
        <p>
            <input type="submit" value="Зберегти" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%=Html.ActionLink(Resources.ResourceUA.Back, "List") %>
    </div>
</asp:Content>
