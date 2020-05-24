<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Question>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%=Resources.ResourceUA.Test %>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Content/TestStyle.css" rel="stylesheet" type="text/css" />
    <h2> <%=Resources.ResourceUA.Question %>:</h2>
      
    <div id="testpanel">
    <fieldset>
          <%= ViewData["stringCategory"]%>     
        <legend><%= Html.Encode(Model.Question1)%></legend>
        <table>
        <tr>
        </tr>
        </table>        
        
      <%MVCbug.Core.MyClass cl = new MVCbug.Core.MyClass();
            List<int> i = cl.SortQuestionNumbers();
            string[] answerArray = new string[4];
            answerArray[0] = Model.Answer.ToString();
            answerArray[1] = Model.Answer1.ToString();
            answerArray[2] = Model.Answer2.ToString();
            answerArray[3] = Model.Answer3.ToString();%>          
      
              <p> <%=Resources.ResourceUA.QuestionVariants %>:</p>
       
                <% if (answerArray[i[0]]!="") { %>
            <p>
                <%= Html.ActionLink(answerArray[i[0]].ToString(), "QuestionCycle", new { id = Model.QuestionId, answer = answerArray[i[0]]})%>
            </p>
            <%} %>
             <% if (answerArray[i[1]]!="") { %>
            <p>
                <%= Html.ActionLink(answerArray[i[1]].ToString(), "QuestionCycle", new { id = Model.QuestionId, answer = answerArray[i[1]] })%>
            </p>
             <%} %>
             <% if (answerArray[i[2]]!="") { %>
            <p>
                <%= Html.ActionLink(answerArray[i[2]].ToString(), "QuestionCycle", new { id = Model.QuestionId, answer = answerArray[i[2]] })%>
            </p>
             <%} %>
             <% if (answerArray[i[3]]!="") { %>
            <p>
                <%= Html.ActionLink(answerArray[i[3]].ToString(), "QuestionCycle", new { id = Model.QuestionId, answer = answerArray[i[3]] })%>
            </p>
             <%} %>
        
       
    </fieldset>
    </div>
    <p>
       
        
        <%=Html.ActionLink(Resources.ResourceUA.Back, "Info")%>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
