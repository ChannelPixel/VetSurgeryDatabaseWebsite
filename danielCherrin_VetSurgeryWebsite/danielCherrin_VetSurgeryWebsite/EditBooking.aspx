<%@ Page Title="Vet Surgery - All Bookings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="EditBooking.aspx.cs" Inherits="EditBooking" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <!--VETS-->
    <div>
        <asp:Label ID="lbl_Vet" runat="server" Text="Attending Vet: "></asp:Label>
        <asp:DropDownList ID="ddl_editVets" runat="server" DataTextField="ddlConcat" DataValueField="email"></asp:DropDownList>
        <hr />
    </div>
    <!--Pet id-->
    <div>
        <asp:Label ID="lbl_Pet" runat="server" Text="Pet: "></asp:Label>
        <asp:DropDownList ID="ddl_editPets" runat="server" DataTextField="ddlConcat" DataValueField="petId"></asp:DropDownList>
        <hr />
    </div>
    <!--Med Ref-->
    <div >
        <asp:Label ID="lbl_Medications" runat="server" Text="Medications: "></asp:Label>
        <br />
        <asp:DropDownList ID="ddl_addMeds" runat="server" DataTextField="ddlConcat" DataValueField="medId"></asp:DropDownList>
        <asp:Button ID="btn_addMed" runat="server" Text="Add" CssClass="btn" OnClick="btn_addMed_Click"/>
        <br />
        <asp:Label ID="lbl_Script" runat="server" Text="Booking Medications: "></asp:Label>
        <br />
        <div style="height: 100px;overflow-y:scroll;">
            <asp:GridView ID="gv_editBookingMeds" runat="server" DataKeyNames="med_refId" AutoGenerateColumns="false" OnRowCommand="gv_editBookingMeds_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Options" Visible="true">
                        <ItemTemplate>
                            <asp:Button ID="gvBtnDelete" runat="server" Text="Delete" CssClass="btn" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField Datafield="medName" HeaderText="Medication"/>
                    <asp:BoundField Datafield="medRoute" HeaderText="Application"/>
                    <asp:BoundField DataField="strength" HeaderText="Strength"/>
                    <asp:BoundField DataField="cost" HeaderText="Cost"/>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <hr />
    <!--Booking Date-->
    <div>
        <asp:Label ID="lbl_BookingDate" runat="server" Text="Booking Date: "></asp:Label>
        <asp:TextBox ID="txt_editBookingDate" runat="server" TextMode="Date"></asp:TextBox>
        &nbsp;
        <asp:Label ID="lbl_BookingTime" runat="server" Text="Booking Time: "></asp:Label>
        <asp:TextBox ID="txt_editBookingTime" runat="server" TextMode="Time"></asp:TextBox>
    </div>
    <hr />
    <!--comment-->
    <div>
        <asp:Label ID="lbl_Comments" runat="server" Text="Comments: "></asp:Label>
        <asp:TextBox ID="txt_editComments" runat="server" TextMode="MultiLine"></asp:TextBox>
    </div>
    <hr />
    <!--is Payed-->
    <div>
        <asp:Label ID="lbl_IsPayed" runat="server" Text="IsPayed: "></asp:Label>
        <asp:CheckBox ID="chk_editIsPayed" runat="server" />
    </div>
    <hr />
    <!--payment type-->
    <div>
        <asp:Label ID="lbl_paymentType" runat="server" Text="Payment Type: "></asp:Label>
        <asp:DropDownList ID="ddl_editPaymentType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_editPaymentType_SelectedIndexChanged">
            <asp:ListItem Value="Cash">Cash</asp:ListItem>
            <asp:ListItem Value="Credit Card">Credit Card</asp:ListItem>
        </asp:DropDownList>
    </div>
    <hr />
    <!--Cost-->
    <div>
        <asp:Label ID="lbl_Cost" runat="server" Text="Cost: $"></asp:Label>
        <asp:TextBox ID="txt_editCost" runat="server"></asp:TextBox>
    </div>
    <hr />

    <asp:Panel ID="pnl_creditCardInfo" runat="server" Visible="false">
        <!--credit card No-->
        <div>
            <asp:Label ID="lbl_creditCardNo" runat="server" Text="Credit Card No: "></asp:Label>
            <asp:TextBox ID="txt_editCreditCardNo" runat="server"></asp:TextBox>
        </div>
        <hr />
        <!--credit card Name-->
        <div>
            <asp:Label ID="lbl_creditCardName" runat="server" Text="Credit Card Name: "></asp:Label>
            <asp:TextBox ID="txt_editCreditCardName" runat="server"></asp:TextBox>
        </div>
        <hr />
        <!--credit card Exp-->
        <div>
            <asp:Label ID="lbl_creditCardExp" runat="server" Text="Credit Card Exp: "></asp:Label>
            <asp:TextBox ID="txt_editCreditCardExp" runat="server" TextMode="Date"></asp:TextBox>
        </div>
    </asp:Panel>
    <hr />
    <div>
        <asp:Button ID="btn_updateBooking" runat="server" Text="Update Booking" CssClass="btn" OnClick="btn_updateBooking_Click"/>
        <asp:Button ID="btn_deleteBooking" runat="server" Text="Delete Booking" CssClass="btn" OnClick="btn_deleteBooking_Click"/>
    </div>

</asp:Content>
