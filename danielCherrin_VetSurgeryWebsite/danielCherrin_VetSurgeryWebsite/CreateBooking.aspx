<%@ Page Title="Vet Surgery - Create Booking" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CreateBooking.aspx.cs" Inherits="CreateBookings" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div>
        <asp:Label ID="lbl_Vet" runat="server" Text="Vet: "></asp:Label>
        <asp:DropDownList ID="ddl_createVets" runat="server" DataTextField="ddlConcat" DataValueField="email"></asp:DropDownList>
    </div>

    <hr />

    <div>
        <asp:Label ID="lbl_Pet" runat="server" Text="Pet: "></asp:Label>
        <asp:DropDownList ID="ddl_createPets" runat="server" DataTextField="ddlConcat" DataValueField="petId"></asp:DropDownList>
    </div>

    <hr />

    <div>
        <asp:Label ID="lbl_BookingDate" runat="server" Text="Booking Date: "></asp:Label>
        <asp:TextBox ID="txt_createDate" runat="server" TextMode="Date"></asp:TextBox>
    </div>

    <hr />

    <div>
        <asp:Label ID="lbl_BookingTime" runat="server" Text="Booking Time: "></asp:Label>
        <asp:TextBox ID="txt_createTime" runat="server" TextMode="Time"></asp:TextBox>
    </div>

    <hr />
    
    <div>
        <asp:Button ID="btn_createBooking" runat="server" Text="Create Booking" OnClick="btn_createBooking_Click" CssClass="btn"/>
        <asp:Button ID="btn_cancelBooking" runat="server" Text="Cancel Booking" OnClick="btn_cancelBooking_Click" CssClass="btn"/>
    </div>
    <br />
</asp:Content>
