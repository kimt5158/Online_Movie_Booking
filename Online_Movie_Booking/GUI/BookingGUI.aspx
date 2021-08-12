<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingGUI.aspx.cs" Inherits="SE1438_Group2_Project.GUI.BookingGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 81px;
        }
        .auto-style2 {
            width: 390px;
        }
        .auto-style3 {
            font-family: "Segoe UI";
            font-weight: bold;
            font-size: large;
        }
        .auto-style4 {
            width: 81px;
            font-family: "Segoe UI";
            font-weight: bold;
        }
        .auto-style5 {
            font-family: "Segoe UI";
            font-weight: bold;
            font-size: large;
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="Label1" runat="server" CssClass="auto-style5" Text="BOOK TICKET"></asp:Label>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style4">Film</td>
                <td class="auto-style2">
                    <asp:Label ID="lblTitle" runat="server" CssClass="auto-style3" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Show Date</td>
                <td class="auto-style2">
                    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Slot</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="293px">
                    </asp:DropDownList>
                    <asp:Label ID="lbSlot" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="btnBook" runat="server" OnClick="btnBook_Click" style="height: 29px" Text="Book" />
                </td>
                <td class="auto-style2">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Cancel" />
                </td>
            </tr>
        </table>
    </p>
</asp:Content>
