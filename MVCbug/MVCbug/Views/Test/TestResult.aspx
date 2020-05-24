<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Test>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%=Resources.ResourceUA.TestResults %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=Resources.ResourceUA.TestResults %></h2>

    <fieldset>
        <legend><%= Html.Encode(Model.UserName) %> <%=Resources.ResourceUA.YourTestCompllete%>  </legend>
        <p>
        
        <h2 ><%=Resources.ResourceUA.Result %> :  <%=  ViewData["YourMark"]%></h2>
             <%=Resources.ResourceUA.Category%>:
            <%= Html.Encode(Model.CategoryName) %>
        </p>
        <p>
            <%=Resources.ResourceUA.CorrectQuestions %>:
            <%= Html.Encode(Model.AnswersCorrectly) %>
        </p>
        <p>
            <%=Resources.ResourceUA.AllQuestions %>:
            <%= Html.Encode(Model.AnswersAll) %>
        </p>
        
        
    </fieldset>
    <p>
        <%=Html.ActionLink(Resources.ResourceUA.Back, "Info") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>

