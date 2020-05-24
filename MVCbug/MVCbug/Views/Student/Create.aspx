<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Student>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   <%=Resources.ResourceUA.Add%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%=Resources.ResourceUA.Add%></h2>
    <%= Html.ValidationSummary(Resources.ResourceUA.EditWasUnsuccessful)%>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend><h2><%=ViewData["Status"]%></h2></legend>
       
            <table>
                <tr><td><%=Resources.ResourceUA.Name%></td> 
                    <td><%= Html.TextBox("Name")%></td>
                    <td><%= Html.ValidationMessage("Name", "*")%></td></tr>
        
                <tr><td><%=Resources.ResourceUA.SecondName%></td>
                    <td><%= Html.TextBox("SecondName")%></td>
                    <td><%= Html.ValidationMessage("SecondName", "*")%></td></tr>
       
                <tr><td><%=Resources.ResourceUA.MiddleName%></td>
                    <td><%= Html.TextBox("MiddleName")%></td>
                    <td><%= Html.ValidationMessage("MiddleName", "*")%></td></tr>       
        
                <tr><td><%=Resources.ResourceUA.Year%>   </td>
                    <td><%= Html.TextBox("BornYear")%></td>
                    <td><%= Html.ValidationMessage("BornYear", "*")%></td></tr>
        
                <tr><td><%=Resources.ResourceUA.Profession%></td>
                    <td><%= Html.TextBox("Profession")%></td>
                    <td><%= Html.ValidationMessage("Profession", "*")%></td></tr>
       
                <tr><td><%=Resources.ResourceUA.Position%> </td>
                    <td><%= Html.TextBox("Position")%></td>
                    <td><%= Html.ValidationMessage("Position", "*")%></td></tr>
        
        
                <tr><td><%=Resources.ResourceUA.Country%></td>
                   <td> <%= Html.TextBox("Country")%></td>
                 <td>   <%= Html.ValidationMessage("Country", "*")%></td></tr>
       
       
                <tr><td><%=Resources.ResourceUA.Town%> </td>
                    <td><%= Html.TextBox("Town")%></td>
                    <td><%= Html.ValidationMessage("Town", "*")%></td></tr>
       
                <tr><td><%=Resources.ResourceUA.PhoneNumber%></td>
                    <td><%= Html.TextBox("PhoneNumber")%></td>
                   <td> <%= Html.ValidationMessage("PhoneNumber", "*")%></td></tr>
       
                <tr><td><%=Resources.ResourceUA.Education%></td>
                   <td> <%= Html.TextBox("EducationType")%></td>
                   <td> <%= Html.ValidationMessage("EducationType", "*")%></td></tr>
    
                <tr style="color:Red;"><td><%=Resources.ResourceUA.Password%> </td>
                    <td><%=Html.TextBox("password")%>  </td> 
                    <td><%=Html.ValidationMessage("!")%></td></tr>
         </table>
        <p>
            <input type="submit" value="ַבנודעט" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%=Html.ActionLink(Resources.ResourceUA.Back, "Index")%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
