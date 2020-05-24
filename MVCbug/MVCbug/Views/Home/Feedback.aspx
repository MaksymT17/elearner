<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Feedback
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">

    <h2>Feedback</h2>
     <%  using (Html.BeginForm())
       {%>
       
       
       <p><%= Html.ValidationSummary()%></p>
    <p>
        Тема:
        <%=Html.TextArea("Text")%> <%= Html.ValidationMessage("Text")%></p>
        
    <p>
        Ваш Email:
        <%=Html.TextBox("Text")%> <%= Html.ValidationMessage("Email")%></p>

    <p>
       
        <input type="submit" value="Отправить" /><asp:FileUpload ID="FileUpload1" 
            runat="server" />
             <% string fileName = FileUpload1.FileName.ToString();%>
        
    </p>
    <%
           } %>

    </form>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
