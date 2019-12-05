<%@ Page Title="Vet Surgery - Financial Reports" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="FinancialReports.aspx.cs" Inherits="FinancialReports" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <br />
    <!--Daily-->
    <div>
        <asp:Label ID="lbl_dailyReports" runat="server" Text="Daily Booking income for today:"></asp:Label>
        <br />
        <asp:Label ID="lbl_dailyCost" runat="server" Text="" Font-Bold="true"></asp:Label>
        <br />
        <br />
    </div>
    <!--Weekly-->
    <div>
        <asp:Label ID="lbl_weeklyReports" runat="server" Text="Weekly Booking income for this week:"></asp:Label>
        <br />
        <asp:Label ID="lbl_weeklyCost" runat="server" Text="" Font-Bold="true"></asp:Label>
        <br />
        <br />
    </div>
    <!--Monthly-->
    <div>
        <asp:Label ID="lbl_monthlyReports" runat="server" Text="Monthly Booking income for this month:"></asp:Label>
        <br />
        <asp:Label ID="lbl_monthlyCost" runat="server" Text="" Font-Bold="true"></asp:Label>
        <br />
        <br />
    </div>
    <!--Date to Date-->
    <div>
        <asp:Label ID="lbl_dateToDateReports" runat="server" Text="Date To Date Booking income for:"></asp:Label>
        <br />
        <asp:Label ID="lbl_dateToDateCost" runat="server" Text="" Font-Bold="true"></asp:Label>
        <br />
        <asp:TextBox ID="txt_dateToDateStart" runat="server" TextMode="Date" OnTextChanged="txt_dateToDateStart_TextChanged" AutoPostBack="true"></asp:TextBox>
        <asp:Label ID="lbl_to" runat="server" Text="to"></asp:Label>
        <asp:TextBox ID="txt_dateToDateEnd" runat="server" TextMode="Date" Enabled="false" OnTextChanged="txt_dateToDateEnd_TextChanged" AutoPostBack="true"></asp:TextBox>
        <asp:Button ID="btn_sumbitDates" runat="server" Text="Submit Dates" Enabled="false" OnClick="btn_sumbitDates_Click"/>
    </div>
    <br />
</asp:Content>
