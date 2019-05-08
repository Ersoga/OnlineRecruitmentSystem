<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineRecruitmentSystem.Login" MasterPageFile="~/Site.Master"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="~/Content/CSS/LoginStyle.css" rel="stylesheet" style="color: #000080"/>
    <script type="text/javascript">
        $(function () {
            $("#btnd").click(function () {
                //var xh;
                //if (XMLHttpRequest) {
                //    xh = new XMLHttpRequest();
                //} else {
                //    xh = new ActiveXObject("Microsoft.XMLHTTP");
                //}
                //xh.open("get", "Admin.aspx", true);
                //xh.send();
                //xh.onreadystatechange = function() {
                //    alert("666");
                //}
            })
        })
    </script>
    <div class="container">
        <%--<button id="btnd"></button>--%>
        <div class="form row">
            <asp:Login runat="server" CreateUserText="注册" FailureAction="RedirectToLoginPage" CreateUserUrl="~/Register.aspx" ID="UserLogin" OnAuthenticate="UserLogin_Authenticate" TitleText="Login" FailureTextStyle-CssClass="text-warning" RememberMeText="记住" PasswordRecoveryText="找回密码" Width="389px" DestinationPageUrl="~/HomePage.aspx" Height="340px" PasswordRecoveryUrl="~/Recovery.aspx" TextLayout="TextOnLeft" UserName="UserName" OnLoginError="UserLogin_LoginError">
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
        </div>
    </div>
</asp:Content>
