<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%=Resources.ResourceUA.AddToStudentList %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=Resources.ResourceUA.AddToStudentList %></h2>
    <% using (Html.BeginForm())
       { %>
      <table>
<tr><td><%=Resources.ResourceUA.Name %>       </td><td><%=Html.TextBox("name")%></td>       <td> <%=Html.ValidationMessage("!")%></td></tr>
<tr><td><%=Resources.ResourceUA.SecondName %> </td><td><%=Html.TextBox("secondName")%></td>  <td><%=Html.ValidationMessage("!")%></td></tr>
<tr><td><%=Resources.ResourceUA.MiddleName %> </td><td><%=Html.TextBox("middleName")%> </td> <td><%=Html.ValidationMessage("!")%></td></tr>
<tr><td><%=Resources.ResourceUA.Year %>       </td><td><%=Html.TextBox("year")%>  </td>     <td> <%=Html.ValidationMessage("!")%></td></tr>
<tr><td><%=Resources.ResourceUA.Profession %> </td><td><%=Html.TextBox("profession")%> </td> <td><%=Html.ValidationMessage("!")%></td></tr>
<tr><td><%=Resources.ResourceUA.Position %>   </td><td><%=Html.TextBox("position")%> </td>   <td><%=Html.ValidationMessage("!")%></td></tr>
<tr><td><%=Resources.ResourceUA.Country %>    </td><td><%=Html.TextBox("country")%> </td>   <td> <%=Html.ValidationMessage("!")%></td></tr>
<tr><td><%=Resources.ResourceUA.Town %>       </td><td><%=Html.TextBox("town")%>  </td>     <td> <%=Html.ValidationMessage("!")%></td></tr>
<tr><td><%=Resources.ResourceUA.PhoneNumber %></td><td><%=Html.TextBox("phoneNumber")%></td> <td><%=Html.ValidationMessage("!")%></td></tr>
<tr><td><%=Resources.ResourceUA.Education %>  </td><td><%=Html.TextBox("education")%> </td>  <td><%=Html.ValidationMessage("!")%></td></tr>
<tr  style="color:Red;"><td><%=Resources.ResourceUA.Password %> </td><td><%=Html.TextBox("password")%>  </td>  <td><%=Html.ValidationMessage("!")%></td></tr>
</table>
<input type="submit", value="Додати" />
<%} %>
</asp:Content>

