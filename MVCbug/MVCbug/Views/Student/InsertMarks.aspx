<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Student>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%=Resources.ResourceUA.InsertMarks %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=Resources.ResourceUA.InsertMarks %></h2>
 <% using (Html.BeginForm())
    { %>
    <fieldset>
        <legend><%=Resources.ResourceUA.StudentMarks %></legend>        
        <p>            
            <%= Html.Encode(Model.Name)%>
        </p>
        <p>            
            <%= Html.Encode(Model.SecondName)%>
        </p>
                <p>            
            <%= Html.Encode(Model.MiddleName)%>
        </p>        
        <table>
<tr><td><%Resources.ResourceUA.Lab1 %></td><td><%=Html.TextBox("lab1")%></td> <td><%=Html.ValidationMessage("!")%></td></tr>
<tr><td><%Resources.ResourceUA.Lab2 %></td><td><%=Html.TextBox("lab2")%></td> <td><%=Html.ValidationMessage("!")%></td></tr>
<tr><td><%Resources.ResourceUA.Lab3 %></td><td><%=Html.TextBox("lab3")%></td> <td><%=Html.ValidationMessage("!")%></td></tr>
</table>
<input type="submit", value="Додати" />
<%} %>
    </fieldset>
    <p>
        <%=Html.ActionLink(Resources.ResourceUA.Edit, "Edit", new { id=Model.StudentId }) %> |
        <%=Html.ActionLink(Resources.ResourceUA.Back, "Index") %>
    </p>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>

