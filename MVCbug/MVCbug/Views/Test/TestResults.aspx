<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MVCbug.Models.Test>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	���������� ����������
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>������ ����������� ����� </h2>

    <table>
        <tr>
        <td style="width:200px; color:Navy"><h1>����������</h1></td>
        <td style="width:70px;"><h1>����</h1></td>
        <td><h1>���������</h1></td>
        
        </tr>
        
        <%
            foreach(MVCbug.Models.Test t in(IEnumerable<MVCbug.Models.Test>) ViewData["Tests"])     
            {%>
            <tr>
            
        <td ><h1 style="color:Navy"><%=t.aspnet_User.UserName %></h1></td>
        <td ><h1 style="color:Navy"><%= t.AnswersCorrectly %></h1></td>
        <td ><h1 style="color:Navy"><%= t.Finished%></h1></td>
                
             
        </tr>   
          <%}%>
              
        </table>
    

    <p>
        <%= Html.ActionLink("�����", "Info") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>

