<%@ Page Title="Vet Surgery - All Pets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AllPets.aspx.cs" Inherits="AllPets" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div style="height: 600px;overflow-y:scroll; overflow-x:scroll; border:groove">
        <asp:GridView ID="gv_allPets" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField Datafield="petName" HeaderText="Pet Name"/>
                <asp:BoundField Datafield="concatName" HeaderText="Client Name"/>
                <asp:BoundField Datafield="regRef" HeaderText="Registration #"/>
                <asp:BoundField Datafield="animalType" HeaderText="Animal"/>
                <asp:BoundField Datafield="breed" HeaderText="Breed"/>
                <asp:BoundField Datafield="colour" HeaderText="Colour"/>
            </Columns>
        </asp:GridView>
    </div>
    <br />
</asp:Content>

