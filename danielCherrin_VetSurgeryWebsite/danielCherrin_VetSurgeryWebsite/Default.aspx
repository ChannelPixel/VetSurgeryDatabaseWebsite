<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:Panel HorizontalAlign="Center" ID="pnl_login" runat="server">
        <asp:Table ID="tbl_login" runat="server" HorizontalAlign="Center">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Right">
                    <asp:Label ID="lbl_email" runat="server" Text="Email:&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <br /> <%-- Empty Cell for formatting. --%>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Right">
                    <asp:Label ID="lbl_password" runat="server" Text="Password:&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            
            <asp:TableRow>
                <asp:TableCell>
                    <br /> <%-- Empty Cell for formatting. --%>
                </asp:TableCell>
            </asp:TableRow>
            
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                    <asp:Button ID="btn_login" runat="server" Text="Login" OnClick="btn_login_Click"/>
                </asp:TableCell>
            </asp:TableRow>

        </asp:Table>

        <asp:Label ID="lbl_loginError" runat="server" Visible="false"></asp:Label>

    </asp:Panel>

</asp:Content>
