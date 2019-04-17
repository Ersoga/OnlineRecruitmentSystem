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
            <asp:DropDownList ID="job_SearchMethod" runat="server" Height="49px" Width="104px">
                <asp:ListItem Value="0">City</asp:ListItem>
                <asp:ListItem Value="1">学校名</asp:ListItem>
                <asp:ListItem Value="2">岗位名</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="job_SerachString" runat="server" Height="16px" Width="161px"></asp:TextBox>
            <asp:Button ID="job_Search" runat="server" Text="搜索" Height="20px" OnClick="job_Search_Click" Width="87px" />
            <br />
            <asp:Table ID="job_InfoTable" runat="server" Height="140px" Width="1147px">
            </asp:Table>
        </div>
    </div>

</asp:Content>