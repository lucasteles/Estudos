<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: ViewBag.Message %></h3>
    <p>
     Teste CAPTCHA
    </p>
    <p>
    <% using (Html.BeginForm("index", "home")) 
     { %>
       <p><img src="/home/getcaptcha" /></p>
       <p>Para vencer o desafio CAPTCHA - informe o número da figura acima:</p>
       <p><%=Html.TextBox("captcha")%></p>
       <p><input type="submit" value="Submeter" /></p>
     <% }
    %>
    </p>
</asp:Content>
