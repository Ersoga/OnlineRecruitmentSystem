<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonalCenter.aspx.cs" Inherits="OnlineRecruitmentSystem.PersonalCenter" MasterPageFile="~/Site.Master" %>


<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:Panel ID="Panel1" runat="server" Height="648px" Width="1356px">
        <asp:Table ID="PersonalInfoTable" runat="server" Height="641px" Width="1364px" BorderStyle="Inset" BorderWidth="2px" CaptionAlign="Top" CssClass="thumbnail" GridLines="Both">
            <asp:TableRow ID="Row1" runat="server" CssClass="row" Height="110px">
                <asp:TableCell runat="server" CssClass="col-sm-1 col-sm-offset-10 col-md-1"><asp:Image runat="server" ImageUrl="~/Image/头像/f9a8b87aeabff8c791050232fdc2286e.jpg" Height="100" Width="80" />
</asp:TableCell>
                <asp:TableCell runat="server"><asp:Label ID="Name" runat="server" Text ="Name"></asp:Label>
</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>
</asp:Content>
    

