<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<script runat="server">

    protected void FileUpload1_Unload(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            HttpContext context;
            context = HttpContext.Current;
            string appPath = context.Request.PhysicalApplicationPath.ToString();
            string savePath = appPath + "Images\\Students\\" + MVCbug.Models.MyContext.Current.eventId + ".jpg";
            // applicaton  path directory            

            string fileName = FileUpload1.FileName;
            FileUpload1.SaveAs(savePath);
            // save image in application directory                        
        }


        HttpContext newcontext;
        newcontext = HttpContext.Current;
        string newappPath = newcontext.Request.PhysicalApplicationPath.ToString();
        string newsavePath = newappPath + "Images\\Students\\" + MVCbug.Models.MyContext.Current.eventId + ".jpg";
        // applicaton  path directory    
        if (System.IO.File.Exists(newsavePath) == true)
        {
            System.IO.File.Copy(newappPath + "Images\\Students\\noPhoto.jpg", newsavePath);
        }
        if (System.IO.File.Exists(newsavePath) == false)
        {
            System.IO.File.Copy(newappPath + "Images\\Students\\noPhoto.jpg", newsavePath);
        }
        
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AddPhoto
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>AddPhoto</h2>
<form id="form1" runat="server">
    
    <asp:FileUpload ID="FileUpload1" runat="server" onunload="FileUpload1_Unload" OnDataBinding="FileUpload1_Unload" OnDisposed="FileUpload1_Unload"
         OnInit="FileUpload1_Unload" OnLoad="FileUpload1_Unload" OnPreRender="FileUpload1_Unload"          />
         <input id="Submit1" type="submit" value="submit" />
    </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
