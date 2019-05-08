<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SchoolRegister.aspx.cs" Inherits="OnlineRecruitmentSystem.SchoolRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="center-block container">
        <div class="form-group row">
            <br />
            <br />
            <asp:Label ID="SchoolID" runat="server" Text="学校代码：" CssClass="form-horizontal"></asp:Label>
            <asp:TextBox ID="SchoolID_Text" runat="server" CssClass="form-control" Width="614px"></asp:TextBox>
            <br />
            <asp:Label ID="SchoolName" runat="server" Text="学校名：" CssClass="form-group-lg"></asp:Label>
            <asp:TextBox ID="SchoolName_Text" runat="server" CssClass="form-control" Width="615px"></asp:TextBox>
            <br />
            <asp:Label ID="SchoolRegion" runat="server" Text="地区：" CssClass="form-group-lg"></asp:Label>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown-toggle" DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="Id" Height="25px" Width="100px" AutoPostBack="True" ClientIDMode="Static" DataMember="DefaultView" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="dropdown-toggle" DataSourceID="SqlDataSource2" DataTextField="CityName" DataValueField="Id" Height="25px" Width="100px" DataMember="DefaultView" AutoPostBack="True" ClientIDMode="Static" AppendDataBoundItems="True">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="dropdown-toggle" DataSourceID="SqlDataSource3" DataTextField="CityName" DataValueField="Id" Height="25px" Width="100px" AutoPostBack="True" ClientIDMode="Static" DataMember="DefaultView">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
            <asp:Label ID="Contact" runat="server" Text="学校简介：" CssClass="form-group-sm"></asp:Label>
            <asp:TextBox ID="Contact_Text" runat="server" CssClass="form-control" Width="614px" Height="149px" Rows="10" Columns="50" MaxLength="500" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:Label ID="Password" runat="server" Text="密码：" CssClass="form-group-sm"></asp:Label>
            <asp:TextBox ID="Password_Text" runat="server" CssClass="form-control" Width="617px"></asp:TextBox>
            <br />
            <asp:Label ID="RePassword" runat="server" Text="请再次输入密码：" CssClass="form-group-sm"></asp:Label>
            <asp:TextBox ID="RePassword_Text" runat="server" CssClass="form-control" Width="617px"></asp:TextBox>
            <br />
            <asp:Button ID="Regist" runat="server" Text="注册" OnClick="Regist_Click" CssClass="btn-group-xs" Height="30px" Width="112px"/>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RecuitmentSystemConnectionString %>" SelectCommand="SELECT [Id], [CityName] FROM [City] WHERE ([Pid] = @Pid)" EnableCaching="True">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="Pid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RecuitmentSystemConnectionString %>" SelectCommand="SELECT [Id], [CityName] FROM [City] WHERE ([Pid] = @Pid)" EnableCaching="True">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="Pid" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RecuitmentSystemConnectionString %>" SelectCommand="SELECT [Id], [CityName] FROM [City] WHERE ([Pid] = @Pid)" EnableCaching="True">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="Pid" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
