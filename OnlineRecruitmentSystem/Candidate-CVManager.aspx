<%@ Page Title="" Language="C#" MasterPageFile="~/Site_fix.Master" AutoEventWireup="true" CodeBehind="Candidate-CVManager.aspx.cs" Inherits="OnlineRecruitmentSystem.Candidate_CVManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" runat="server">
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataSourceID="Source">
        <EditItemTemplate>
            ResumeID:
            <asp:TextBox ID="ResumeIDTextBox" runat="server" Text='<%# Bind("ResumeID") %>' />
            <br />
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Gender:
            <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
            <br />
            YearOfBirthday:
            <asp:TextBox ID="YearOfBirthdayTextBox" runat="server" Text='<%# Bind("YearOfBirthday") %>' />
            <br />
            MonthOfBirthday:
            <asp:TextBox ID="MonthOfBirthdayTextBox" runat="server" Text='<%# Bind("MonthOfBirthday") %>' />
            <br />
            DayOfBirthday:
            <asp:TextBox ID="DayOfBirthdayTextBox" runat="server" Text='<%# Bind("DayOfBirthday") %>' />
            <br />
            CardType:
            <asp:TextBox ID="CardTypeTextBox" runat="server" Text='<%# Bind("CardType") %>' />
            <br />
            IDNumber:
            <asp:TextBox ID="IDNumberTextBox" runat="server" Text='<%# Bind("IDNumber") %>' />
            <br />
            Salary:
            <asp:TextBox ID="SalaryTextBox" runat="server" Text='<%# Bind("Salary") %>' />
            <br />
            CurrencyType:
            <asp:TextBox ID="CurrencyTypeTextBox" runat="server" Text='<%# Bind("CurrencyType") %>' />
            <br />
            Mobile:
            <asp:TextBox ID="MobileTextBox" runat="server" Text='<%# Bind("Mobile") %>' />
            <br />
            QQ:
            <asp:TextBox ID="QQTextBox" runat="server" Text='<%# Bind("QQ") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            PlaceOfDomicile:
            <asp:TextBox ID="PlaceOfDomicileTextBox" runat="server" Text='<%# Bind("PlaceOfDomicile") %>' />
            <br />
            CityId:
            <asp:TextBox ID="CityIdTextBox" runat="server" Text='<%# Bind("CityId") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            Stature:
            <asp:TextBox ID="StatureTextBox" runat="server" Text='<%# Bind("Stature") %>' />
            <br />
            Height:
            <asp:TextBox ID="HeightTextBox" runat="server" Text='<%# Bind("Height") %>' />
            <br />
            Marrige:
            <asp:TextBox ID="MarrigeTextBox" runat="server" Text='<%# Bind("Marrige") %>' />
            <br />
            HomePage:
            <asp:TextBox ID="HomePageTextBox" runat="server" Text='<%# Bind("HomePage") %>' />
            <br />
            StudentGroup:
            <asp:TextBox ID="StudentGroupTextBox" runat="server" Text='<%# Bind("StudentGroup") %>' />
            <br />
            WorkYear:
            <asp:TextBox ID="WorkYearTextBox" runat="server" Text='<%# Bind("WorkYear") %>' />
            <br />
            Introduction:
            <asp:TextBox ID="IntroductionTextBox" runat="server" Text='<%# Bind("Introduction") %>' />
            <br />
            Weight:
            <asp:TextBox ID="WeightTextBox" runat="server" Text='<%# Bind("Weight") %>' />
            <br />
            UserId:
            <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>' />
            <br />
            <%--EducationBackgrounds:
            <asp:TextBox ID="EducationBackgroundsTextBox" runat="server" Text='<%# Bind("EducationBackgrounds") %>' />
            <br />
            JobIntensions:
            <asp:TextBox ID="JobIntensionsTextBox" runat="server" Text='<%# Bind("JobIntensions") %>' />
            <br />
            WorkExperiences:
            <asp:TextBox ID="WorkExperiencesTextBox" runat="server" Text='<%# Bind("WorkExperiences") %>' />
            <br />
            UserTable:
            <asp:TextBox ID="UserTableTextBox" runat="server" Text='<%# Bind("UserTable") %>' />
            <br />--%>
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <InsertItemTemplate>
            ResumeID:
            <asp:TextBox ID="ResumeIDTextBox" runat="server" Text='<%# Bind("ResumeID") %>' />
            <br />
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Gender:
            <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
            <br />
            YearOfBirthday:
            <asp:TextBox ID="YearOfBirthdayTextBox" runat="server" Text='<%# Bind("YearOfBirthday") %>' />
            <br />
            MonthOfBirthday:
            <asp:TextBox ID="MonthOfBirthdayTextBox" runat="server" Text='<%# Bind("MonthOfBirthday") %>' />
            <br />
            DayOfBirthday:
            <asp:TextBox ID="DayOfBirthdayTextBox" runat="server" Text='<%# Bind("DayOfBirthday") %>' />
            <br />
            CardType:
            <asp:TextBox ID="CardTypeTextBox" runat="server" Text='<%# Bind("CardType") %>' />
            <br />
            IDNumber:
            <asp:TextBox ID="IDNumberTextBox" runat="server" Text='<%# Bind("IDNumber") %>' />
            <br />
            Salary:
            <asp:TextBox ID="SalaryTextBox" runat="server" Text='<%# Bind("Salary") %>' />
            <br />
            CurrencyType:
            <asp:TextBox ID="CurrencyTypeTextBox" runat="server" Text='<%# Bind("CurrencyType") %>' />
            <br />
            Mobile:
            <asp:TextBox ID="MobileTextBox" runat="server" Text='<%# Bind("Mobile") %>' />
            <br />
            QQ:
            <asp:TextBox ID="QQTextBox" runat="server" Text='<%# Bind("QQ") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            PlaceOfDomicile:
            <asp:TextBox ID="PlaceOfDomicileTextBox" runat="server" Text='<%# Bind("PlaceOfDomicile") %>' />
            <br />
            CityId:
            <asp:TextBox ID="CityIdTextBox" runat="server" Text='<%# Bind("CityId") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            Stature:
            <asp:TextBox ID="StatureTextBox" runat="server" Text='<%# Bind("Stature") %>' />
            <br />
            Height:
            <asp:TextBox ID="HeightTextBox" runat="server" Text='<%# Bind("Height") %>' />
            <br />
            Marrige:
            <asp:TextBox ID="MarrigeTextBox" runat="server" Text='<%# Bind("Marrige") %>' />
            <br />
            HomePage:
            <asp:TextBox ID="HomePageTextBox" runat="server" Text='<%# Bind("HomePage") %>' />
            <br />
            StudentGroup:
            <asp:TextBox ID="StudentGroupTextBox" runat="server" Text='<%# Bind("StudentGroup") %>' />
            <br />
            WorkYear:
            <asp:TextBox ID="WorkYearTextBox" runat="server" Text='<%# Bind("WorkYear") %>' />
            <br />
            Introduction:
            <asp:TextBox ID="IntroductionTextBox" runat="server" Text='<%# Bind("Introduction") %>' />
            <br />
            Weight:
            <asp:TextBox ID="WeightTextBox" runat="server" Text='<%# Bind("Weight") %>' />
            <br />
            UserId:
            <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>' />
            <br />
            <%--EducationBackgrounds:
            <asp:TextBox ID="EducationBackgroundsTextBox" runat="server" Text='<%# Bind("EducationBackgrounds") %>' />
            <br />
            JobIntensions:
            <asp:TextBox ID="JobIntensionsTextBox" runat="server" Text='<%# Bind("JobIntensions") %>' />
            <br />
            WorkExperiences:
            <asp:TextBox ID="WorkExperiencesTextBox" runat="server" Text='<%# Bind("WorkExperiences") %>' />
            <br />
            UserTable:
            <asp:TextBox ID="UserTableTextBox" runat="server" Text='<%# Bind("UserTable") %>' />
            <br />--%>
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            ResumeID:
            <asp:Label ID="ResumeIDLabel" runat="server" Text='<%# Bind("ResumeID") %>' />
            <br />
            Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Gender:
            <asp:Label ID="GenderLabel" runat="server" Text='<%# Bind("Gender") %>' />
            <br />
            YearOfBirthday:
            <asp:Label ID="YearOfBirthdayLabel" runat="server" Text='<%# Bind("YearOfBirthday") %>' />
            <br />
            MonthOfBirthday:
            <asp:Label ID="MonthOfBirthdayLabel" runat="server" Text='<%# Bind("MonthOfBirthday") %>' />
            <br />
            DayOfBirthday:
            <asp:Label ID="DayOfBirthdayLabel" runat="server" Text='<%# Bind("DayOfBirthday") %>' />
            <br />
            CardType:
            <asp:Label ID="CardTypeLabel" runat="server" Text='<%# Bind("CardType") %>' />
            <br />
            IDNumber:
            <asp:Label ID="IDNumberLabel" runat="server" Text='<%# Bind("IDNumber") %>' />
            <br />
            Salary:
            <asp:Label ID="SalaryLabel" runat="server" Text='<%# Bind("Salary") %>' />
            <br />
            CurrencyType:
            <asp:Label ID="CurrencyTypeLabel" runat="server" Text='<%# Bind("CurrencyType") %>' />
            <br />
            Mobile:
            <asp:Label ID="MobileLabel" runat="server" Text='<%# Bind("Mobile") %>' />
            <br />
            QQ:
            <asp:Label ID="QQLabel" runat="server" Text='<%# Bind("QQ") %>' />
            <br />
            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            PlaceOfDomicile:
            <asp:Label ID="PlaceOfDomicileLabel" runat="server" Text='<%# Bind("PlaceOfDomicile") %>' />
            <br />
            CityId:
            <asp:Label ID="CityIdLabel" runat="server" Text='<%# Bind("CityId") %>' />
            <br />
            Address:
            <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            Stature:
            <asp:Label ID="StatureLabel" runat="server" Text='<%# Bind("Stature") %>' />
            <br />
            Height:
            <asp:Label ID="HeightLabel" runat="server" Text='<%# Bind("Height") %>' />
            <br />
            Marrige:
            <asp:Label ID="MarrigeLabel" runat="server" Text='<%# Bind("Marrige") %>' />
            <br />
            HomePage:
            <asp:Label ID="HomePageLabel" runat="server" Text='<%# Bind("HomePage") %>' />
            <br />
            StudentGroup:
            <asp:Label ID="StudentGroupLabel" runat="server" Text='<%# Bind("StudentGroup") %>' />
            <br />
            WorkYear:
            <asp:Label ID="WorkYearLabel" runat="server" Text='<%# Bind("WorkYear") %>' />
            <br />
            Introduction:
            <asp:Label ID="IntroductionLabel" runat="server" Text='<%# Bind("Introduction") %>' />
            <br />
            Weight:
            <asp:Label ID="WeightLabel" runat="server" Text='<%# Bind("Weight") %>' />
            <br />
            UserId:
            <asp:Label ID="UserIdLabel" runat="server" Text='<%# Bind("UserId") %>' />
            <br />
            <%--EducationBackgrounds:
            <asp:Label ID="EducationBackgroundsLabel" runat="server" Text='<%# Bind("EducationBackgrounds") %>' />
            <br />
            JobIntensions:
            <asp:Label ID="JobIntensionsLabel" runat="server" Text='<%# Bind("JobIntensions") %>' />
            <br />
            WorkExperiences:
            <asp:Label ID="WorkExperiencesLabel" runat="server" Text='<%# Bind("WorkExperiences") %>' />
            <br />
            UserTable:
            <asp:Label ID="UserTableLabel" runat="server" Text='<%# Bind("UserTable") %>' />
            <br />--%>

        </ItemTemplate>
    </asp:FormView>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="Source" >
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:DynamicControl runat="server" DataField="ResumeID" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Name" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Gender" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="YearOfBirthday" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="MonthOfBirthday" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="DayOfBirthday" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CardType" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="IDNumber" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Salary" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CurrencyType" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Mobile" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="QQ" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Email" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="PlaceOfDomicile" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CityId" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Address" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Stature" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Height" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Marrige" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="HomePage" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="StudentGroup" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="WorkYear" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Introduction" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Weight" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="UserId" Mode="ReadOnly" />
                </td>
                <%--<td>
                    <asp:DynamicControl runat="server" DataField="EducationBackgrounds" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="JobIntensions" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="WorkExperiences" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="UserTable" Mode="ReadOnly" />
                </td>--%>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="ResumeID" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Name" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Gender" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="YearOfBirthday" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="MonthOfBirthday" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="DayOfBirthday" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CardType" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="IDNumber" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Salary" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CurrencyType" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Mobile" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="QQ" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Email" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="PlaceOfDomicile" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CityId" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Address" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Stature" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Height" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Marrige" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="HomePage" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="StudentGroup" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="WorkYear" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Introduction" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Weight" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="UserId" Mode="Edit" />
                </td>
                <%--<td>
                    <asp:DynamicControl runat="server" DataField="EducationBackgrounds" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="JobIntensions" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="WorkExperiences" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="UserTable" Mode="Edit" />
                </td>--%>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>未返回数据。</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" ValidationGroup="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="ResumeID" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Name" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Gender" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="YearOfBirthday" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="MonthOfBirthday" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="DayOfBirthday" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CardType" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="IDNumber" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Salary" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CurrencyType" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Mobile" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="QQ" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Email" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="PlaceOfDomicile" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CityId" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Address" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Stature" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Height" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Marrige" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="HomePage" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="StudentGroup" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="WorkYear" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Introduction" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Weight" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="UserId" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <%--<td>
                    <asp:DynamicControl runat="server" DataField="EducationBackgrounds" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="JobIntensions" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="WorkExperiences" Mode="Insert" ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="UserTable" Mode="Insert" ValidationGroup="Insert" />
                </td>--%>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:DynamicControl runat="server" DataField="ResumeID" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Name" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Gender" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="YearOfBirthday" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="MonthOfBirthday" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="DayOfBirthday" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CardType" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="IDNumber" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Salary" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CurrencyType" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Mobile" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="QQ" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Email" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="PlaceOfDomicile" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CityId" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Address" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Stature" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Height" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Marrige" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="HomePage" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="StudentGroup" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="WorkYear" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Introduction" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Weight" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="UserId" Mode="ReadOnly" />
                </td>
                <%--<td>
                    <asp:DynamicControl runat="server" DataField="EducationBackgrounds" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="JobIntensions" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="WorkExperiences" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="UserTable" Mode="ReadOnly" />
                </td>--%>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">ResumeID</th>
                                <th runat="server">Name</th>
                                <th runat="server">Gender</th>
                                <th runat="server">YearOfBirthday</th>
                                <th runat="server">MonthOfBirthday</th>
                                <th runat="server">DayOfBirthday</th>
                                <th runat="server">CardType</th>
                                <th runat="server">IDNumber</th>
                                <th runat="server">Salary</th>
                                <th runat="server">CurrencyType</th>
                                <th runat="server">Mobile</th>
                                <th runat="server">QQ</th>
                                <th runat="server">Email</th>
                                <th runat="server">PlaceOfDomicile</th>
                                <th runat="server">CityId</th>
                                <th runat="server">Address</th>
                                <th runat="server">Stature</th>
                                <th runat="server">Height</th>
                                <th runat="server">Marrige</th>
                                <th runat="server">HomePage</th>
                                <th runat="server">StudentGroup</th>
                                <th runat="server">WorkYear</th>
                                <th runat="server">Introduction</th>
                                <th runat="server">Weight</th>
                                <th runat="server">UserId</th>
                                <%--<th runat="server">EducationBackgrounds</th>
                                <th runat="server">JobIntensions</th>
                                <th runat="server">WorkExperiences</th>
                                <th runat="server">UserTable</th>--%>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:DynamicControl runat="server" DataField="ResumeID" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Name" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Gender" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="YearOfBirthday" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="MonthOfBirthday" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="DayOfBirthday" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CardType" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="IDNumber" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Salary" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CurrencyType" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Mobile" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="QQ" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Email" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="PlaceOfDomicile" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="CityId" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Address" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Stature" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Height" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Marrige" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="HomePage" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="StudentGroup" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="WorkYear" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Introduction" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Weight" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="UserId" Mode="ReadOnly" />
                </td>
                <%--<td>
                    <asp:DynamicControl runat="server" DataField="EducationBackgrounds" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="JobIntensions" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="WorkExperiences" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="UserTable" Mode="ReadOnly" />
                </td>--%>
            </tr>
        </SelectedItemTemplate>
        
    </asp:ListView>
    <asp:ObjectDataSource ID="Source" runat="server" SelectMethod="GetResume" TypeName="OnlineRecuitmentSystemBLL.User">
        <SelectParameters>
            <asp:Parameter Name="resumeID" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
