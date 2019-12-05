<%@ Page Title="Vet Surgery - All Medications" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AllMedications.aspx.cs" Inherits="AllMedications" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div style="height: auto;width:auto;overflow-y:scroll; overflow-x:scroll; border:groove">
        <asp:GridView ID="gv_allMedications" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="medId" HeaderText="Medication Id" Visible="false"/>
                <asp:BoundField DataField="medName" HeaderText="Medication Name" Visible="true"/>
                <asp:BoundField DataField="strength" HeaderText="Strength" Visible="true"/>
                <asp:BoundField DataField="medRoute" HeaderText="Application" Visible="true"/>
                <asp:BoundField DataField="cost" HeaderText="Cost" Visible="true" DataFormatString="{0:C}"/>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
