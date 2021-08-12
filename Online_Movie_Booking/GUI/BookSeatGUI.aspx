<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookSeatGUI.aspx.cs" Inherits="SE1438_Group2_Project.GUI.BookSeatGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 345px;
        }
        .auto-style3 {
            font-family: "Segoe UI";
            font-weight: bold;
            font-size: x-large;
            color: red;
        }
        .auto-style4 {
            width: 220px;
        }
        .auto-style5 {
            width: 242px;
        }
        .auto-style6 {
            font-family: "Segoe UI";
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="Label1" runat="server" Text="BOOK SEAT" CssClass="auto-style3"></asp:Label>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style5">Seat:</td>
                <td class="auto-style4">
                    <asp:Table ID="Table1" runat="server">
                    </asp:Table>
                </td>
                <td class="auto-style1">
                    <asp:CheckBox ID="CheckBox1" runat="server" BackColor="Red" Checked="True" CssClass="auto-style6" Enabled="False" />
&nbsp;<b>Booked seats:
                    <asp:Label ID="lblBooked" runat="server" Text="Label"></asp:Label>
                    <br />
                    </b>
                    <asp:CheckBox ID="CheckBox2" runat="server" CssClass="auto-style6" Enabled="False" />
                    <b>&nbsp;Available seats:
                    <asp:Label ID="lblAvai" runat="server" Text="Label"></asp:Label>
                    <br />
                    Price:&nbsp;
                    <asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label>
                    ($/seat)</b></td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="lbNoi" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="btnBook" runat="server" Text="Book" OnClick="btnBook_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>
