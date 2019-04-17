<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recovery.aspx.cs" Inherits="OnlineRecruitmentSystem.Recovery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="center-block container">
        <div class="form-group row">
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="手机号：" CssClass="form-group-sm"></asp:Label>
            <asp:TextBox ID="PhoneNumber" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="原密码：" CssClass="form-group-sm"></asp:Label>
            <asp:TextBox ID="PrePassword" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="密码：" CssClass="form-group-lg"></asp:Label>
            <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="重复你的密码：" CssClass="form-group-sm"></asp:Label>
            <asp:TextBox ID="RePassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <br />
            
            <asp:Button ID="RecoPassword" runat="server" Text="确定" CssClass="btn-group" Width ="20"/>
        </div>
    </div>
</asp:Content>
