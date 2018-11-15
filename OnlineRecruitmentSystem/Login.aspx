<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineRecruitmentSystem.Login" MasterPageFile="~/Site.Master"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/CSS/LoginStyle.css" rel="stylesheet"/>
    <div class="container">
        <div class="form row">
            <div class="form-horizontal col-md-offset-3" id="login_form">
                <h3 class="form-title">LOGIN</h3>
                <div class="col-md-9">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <asp:TextBox ID="UserName" runat="server" Font-Names="微软雅黑" Font-Overline="False" CssClass="form-control required">UserName</asp:TextBox>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <asp:TextBox ID="Password" runat="server" Text="Password" MaxLength="16" Wrap="False" TextMode="Password" CssClass="form-control required"></asp:TextBox>
                    </div>
                    <div class="form-group">
                            <asp:CheckBox ID="remember" runat="server" Text="记住我" />
                    </div>
                    <div class="form-group col-md-offset-9">
                        <asp:Button ID="m_Login" runat="server" Text="登陆" CssClass="btn btn-success pull-right" OnClick="m_Login_Click"/>
                    </div>
                    <asp:TextBox ID="Message" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
