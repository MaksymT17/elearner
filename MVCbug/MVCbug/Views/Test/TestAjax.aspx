<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCbug.Models.Question>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	TestAjax
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
   
    <h2>testAjax</h2>

     <script type="text/javascript">
    function AjaxSuccess()
    {
    alert('Ви впевнені?')
    }
    </script>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>
    <% using (Html.BeginForm() ) { %>
<%  using (Ajax.BeginForm(new AjaxOptions { UpdateTargetId = "message", OnSuccess = "AjaxSuccess" }))
           { %>
   
<div id= "message>" </div>
        <fieldset>
            <legend>
                <%= Html.Encode(Model.Question1)%></legend>
            <%MVCbug.Core.MyClass cl = new MVCbug.Core.MyClass();
              List<int> i = cl.SortQuestionNumbers();
              string[] answerArray = new string[4];
              answerArray[0] = Html.Encode(Model.Answer.ToString());
              answerArray[1] = Html.Encode(Model.Answer1.ToString());
              answerArray[2] = Html.Encode(Model.Answer2.ToString());
              answerArray[3] = Html.Encode(Model.Answer3.ToString());%>
            <p>
                Варіанти відповідей:</p>
            <p>
                <%=Html.RadioButton("choice0",false) %>
                <%= Html.ActionLink(answerArray[i[0]].ToString(), "TestAjax", new { id = Model.QuestionId, answer = answerArray[i[0]]})%>
            </p>
            <p>
                <%=Html.RadioButton("choice1",false) %>
                <%=Html.ActionLink(answerArray[i[1]].ToString(), "TestAjax", new { id = Model.QuestionId, answer = answerArray[i[1]] })%>
            </p>
            <p>
                <%=Html.RadioButton("choice2",false) %>
                <%= Html.ActionLink(answerArray[i[2]].ToString(), "TestAjax", new { id = Model.QuestionId, answer = answerArray[i[2]] })%>
            </p>
            <p>
                <%=Html.RadioButton("choice3",false) %>
                <%= Html.ActionLink(answerArray[i[3]].ToString(), "TestAjax", new { id = Model.QuestionId, answer = answerArray[i[3]] })%>
            </p>
        </fieldset>
    </div>
    <table>
        <tr>
            <td>
                
                Правильних відповідей
            </td>
            <td>
            <%if(Html.RadioButton("choice",true))
              {
                  AcceptVerbsAttribute(HttpVerbs.Post(Model.QuestionId, answerArray[i[0]].ToString());
              } %>
                <%= MVCbug.Models.MyContext.Current.CurrentTest.AnswersCorrectly.ToString() %>
            </td>
        </tr>
        <tr>
            <td>
                Всього запитань
            </td>
            <td>
                <%= MVCbug.Models.MyContext.Current.CurrentTest.AnswersAll.ToString() %>
            </td>
        </tr>
        <%Html.Encode(Model.Answer = "cho"); %>
        <input type="submit" value="Зберегти" />
    </table>
    <% } %>
    <% } %>
        
    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>

