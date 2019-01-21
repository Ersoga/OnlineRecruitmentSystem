<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineRecruitmentSystem.Login" MasterPageFile="~/Site.Master"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/CSS/LoginStyle.css" rel="stylesheet"/>
    <div class="container">
        <div class="form row">
            <asp:Login runat="server" CreateUserText="注册" FailureAction="RedirectToLoginPage" CreateUserUrl="~/Register.aspx" ID="UserLogin" OnAuthenticate="UserLogin_Authenticate" TitleText="Login" FailureTextStyle-CssClass="text-warning" RememberMeText="记住" PasswordRecoveryText="找回密码" Width="389px" DestinationPageUrl="~/HomePage.aspx" Height="310px" PasswordRecoveryUrl="~/Recovery.aspx" TextLayout="TextOnLeft" UserName="UserName" OnLoginError="UserLogin_LoginError">
                <CheckBoxStyle CssClass="checkbox-inline" />
                <TextBoxStyle CssClass="form-control required" Width="200" BorderWidth="1px" />
                <TitleTextStyle CssClass="form-title h2 col-lg-pull-0" Wrap="False" />
                <HyperLinkStyle BorderStyle="Dashed" />
                <LabelStyle Width="80" />
                <FailureTextStyle />
                <InstructionTextStyle />
                <LoginButtonStyle CssClass="btn text-center btn-group-sm" BorderStyle="Inset" ForeColor="#CC9900" />
                <ValidatorTextStyle Width="50" />
            </asp:Login>
            <%-- <div class="form-group">
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
                    </div>--%>
        </div>
    </div>
</asp:Content>
