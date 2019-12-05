<%@ Page Title="Vet Surgery - All Clients" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AllClients.aspx.cs" Inherits="AllClients" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div style="height: 600px;overflow-y:scroll; overflow-x:scroll; border:groove">
        <asp:GridView ID="gv_allClients" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField Datafield="givenName" HeaderText="Given Name"/>
                <asp:BoundField Datafield="lastName" HeaderText="Last Name"/>
                <asp:BoundField Datafield="email" HeaderText="Email"/>
                <asp:BoundField Datafield="addressNo" HeaderText="Address No"/>
                <asp:BoundField Datafield="addressStreet" HeaderText="Address Street"/>
                <asp:BoundField Datafield="addressPostCode" HeaderText="Address PostCode"/>
                <asp:BoundField Datafield="addressSuburb" HeaderText="Address Suburb"/>
                <asp:BoundField Datafield="addressState" HeaderText="Address State"/>
                <asp:BoundField Datafield="mobPhone" HeaderText="Mob. Phone"/>
                <asp:BoundField Datafield="homePhone" HeaderText="Home Phone"/>
            </Columns>
        </asp:GridView>
    </div>
    <br />
</asp:Content>
