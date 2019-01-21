<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineRecruitmentSystem.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="center-block container">
        <div class="form-group row input-group">
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="用户名：" CssClass="form-horizontal"></asp:Label>
            <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="密码：" CssClass="form-group-lg"></asp:Label>
            <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="重复你的密码：" CssClass="form-group-sm"></asp:Label>
            <asp:TextBox ID="RePassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="手机号：" CssClass="form-group-sm"></asp:Label>
            <asp:TextBox ID="PhoneNumber" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
            <br />
            <asp:Button ID="Regist" runat="server" Text="Button" OnClick="Regist_Click" CssClass="btn-group"/>
        </div>
    </div>
</asp:Content>
