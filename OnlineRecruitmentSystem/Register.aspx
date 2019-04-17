<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineRecruitmentSystem.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="center-block container">
        <div class="form-group row">
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="用户名：" CssClass="form-horizontal"></asp:Label>
            <asp:TextBox ID="UserName" runat="server" CssClass="form-control" Width="614px"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="密码：" CssClass="form-group-lg"></asp:Label>
            <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" Width="615px"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="重复你的密码：" CssClass="form-group-sm"></asp:Label>
            <asp:TextBox ID="RePassword" runat="server" CssClass="form-control" TextMode="Password" Width="614px"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="手机号：" CssClass="form-group-sm"></asp:Label>
            <asp:TextBox ID="PhoneNumber" runat="server" CssClass="form-control" TextMode="Phone" Width="617px"></asp:TextBox>
            <br />
            <asp:Button ID="Regist" runat="server" Text="注册" OnClick="Regist_Click" CssClass="btn-group-xs" Height="30px" Width="112px"/>
        </div>
    </div>
</asp:Content>
