<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="OnlineRecruitmentSystem.HoemPage" MasterPageFile="~/Site.Master" Title="HomePage" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="container">
        <%--<div class="lead">
            <h2>欢迎
            </h2>
        </div>--%>
        
        <div class="jumbotron">
            <h1>OnlineRecruitmentSystem</h1>
            <p class="lead">欢迎来到在线高校招聘网</p>
            <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
        </div>
        <div class="row">
            <div class="col-xs-4">
                <h2 class="page-header">区域一
                </h2>
                <p>
                    Bootstrap has a few easy ways to quickly get started, each one appealing
                to a different skill level and use case. Read through to see what suits
                your particular needs.
                </p>
                <%--<p><iframe width="300" height="300" src="https://cybermap.kaspersky.com/cn/widget/dynamic/dark" frameborder="0" ></iframe></p>--%>
            </div>
            <div class="col-xs-4">
                <h2 class="page-header">区域二
                </h2>
                <p>
                    If you work with Bootstrap's uncompiled source code, you need to compile
                the LESS files to produce usable CSS files. For compiling LESS files into
                CSS, we only officially support Recess, which is Twitter's CSS hinter based
                on less.js.
                </p>
            </div>
            <div class="col-xs-4">
                <h2 class="page-header">区域三
                </h2>
                <p>
                    Within the download you'll find the following directories and files, logically
                grouping common resources and providing both compiled and minified variations.
                </p>
            </div>
        </div>
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow CssClass="row">
                <asp:TableCell CssClass="col-xs-4">
                    <h2 class="page-header">区域二
                </h2>
                <p>
                    If you work with Bootstrap's uncompiled source code, you need to compile
                the LESS files to produce usable CSS files. For compiling LESS files into
                CSS, we only officially support Recess, which is Twitter's CSS hinter based
                on less.js.
                </p>
                </asp:TableCell>
                <asp:TableCell>b</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>

</asp:Content>