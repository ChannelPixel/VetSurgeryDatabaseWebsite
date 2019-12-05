<%@ Page Title="Vet Surgery - My Bookings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="MyBookings.aspx.cs" Inherits="MyBookings" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div style="height: 600px;overflow-y:scroll; overflow-x:scroll; border:groove">
        <asp:GridView ID="gv_myBookings" runat="server" AutoGenerateColumns="false" DataKeyNames="bookingId, petId" OnRowDataBound="gv_myBookings_RowDataBound" OnRowCommand="gv_myBookings_RowCommand" >
            <Columns>
                <asp:TemplateField HeaderText="Options" Visible="true">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td><asp:Button ID="gvBtnEdit" runat="server" Text="Edit" CssClass="btn"/></td>
                            <td>&nbsp</td>
                            <td><asp:Button ID="gvBtnSelect" runat="server" Text="Select" CssClass="btn"/></td>
                        </tr>
                    </table>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="email" HeaderText="Attending Vet" Visible="true"/>
                <asp:BoundField DataField="bookingDate" HeaderText="Booking Date" Visible="true" DataFormatString="{0:d}"/>
                <asp:BoundField DataField="bookingTime" HeaderText="Booking Time" Visible="true"/>
                <asp:BoundField DataField="cost" HeaderText="Total Cost" Visible="true" DataFormatString="{0:C}"/>
                <asp:CheckBoxField DataField="isPayed" HeaderText="Payed?" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField DataField="paymentType" HeaderText="Payment Type" Visible="true"/>
                <asp:BoundField DataField="creditCardNo" HeaderText="Credit Card No"/>
                <asp:BoundField DataField="creditCardName" HeaderText="Credit Card Name"/>
                <asp:BoundField DataField="creditCardExp" HeaderText="Credit Card Exp"/>
                <asp:BoundField DataField="comment" HeaderText="Booking Comments"/>
            </Columns>
        </asp:GridView>
    </div>
    <br />
    <!--Gridview for SELECTED booking's client details -->
    <div style="overflow-x:scroll">
    <asp:GridView ID="gv_selectClient" runat="server" AutoGenerateColumns="false" DataKeyNames="clientId">
        <Columns>
            <asp:BoundField DataField="givenName" HeaderText="Given Name"/>
            <asp:BoundField DataField="lastName" HeaderText="Last Name"/>
            <asp:BoundField DataField="email" HeaderText="Email"/>
            <asp:BoundField DataField="addressNo" HeaderText="Address #"/>
            <asp:BoundField DataField="addressStreet" HeaderText="Address Street"/>
            <asp:BoundField DataField="addressPostCode" HeaderText="Address Postcode"/>
            <asp:BoundField DataField="addressSuburb" HeaderText="Address Suburb"/>
            <asp:BoundField DataField="addressState" HeaderText="Address State"/>
            <asp:BoundField DataField="mobPhone" HeaderText="Mobile Phone"/>
            <asp:BoundField DataField="homePhone" HeaderText="Home Phone"/>
        </Columns>
    </asp:GridView>
    </div>
    <!--Gridview for SELECTED booking's pet details-->
    <div style="overflow-x:scroll">
    <asp:GridView ID="gv_selectPet" runat="server" AutoGenerateColumns="false" DataKeyNames="petId, clientId">
        <Columns>
            <asp:BoundField DataField="petName" HeaderText="Pet Name"/>
            <asp:BoundField DataField="regRef" HeaderText="Registration Number"/>
            <asp:BoundField DataField="animalType" HeaderText="Animal"/>
            <asp:BoundField DataField="breed" HeaderText="Species"/>
            <asp:BoundField DataField="colour" HeaderText="Colour"/>
        </Columns>
    </asp:GridView>
    </div>
    <!--GridView for SELECTED booking's medications-->
    <div style="overflow-x:scroll;">
        <asp:GridView ID="gv_selectMeds" runat="server" DataKeyNames="med_refId" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField Datafield="medName" HeaderText="Medication"/>
                <asp:BoundField Datafield="medRoute" HeaderText="Application"/>
                <asp:BoundField DataField="strength" HeaderText="Strength"/>
                <asp:BoundField DataField="cost" HeaderText="Cost"/>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
