<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowGUI.aspx.cs" Inherits="SE1438_Group2_Project.GUI.ShowGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 318px;
        }
        .auto-style2 {
            font-family: "Segoe UI";
            font-weight: bold;
            font-size: x-large;
            color: red;
        }
        .auto-style3 {
            margin-left: 400px;
        }
        .auto-style4 {
            margin-left: 360px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="Label1" runat="server" Text="SHOW" CssClass="auto-style2"></asp:Label>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" Width="220px">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>
                </td>
            </tr>
        </table>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" PageSize="2" OnPageIndexChanging="GridView1_PageIndexChanging" Width="899px">
            <Columns>
                <asp:BoundField DataField="ShowID" HeaderText="ShowID" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:ImageField DataImageUrlField="ImageUrl" HeaderText="IMG">
                    <ControlStyle Width="120px" Height="180px"/>
                </asp:ImageField>
                <asp:BoundField DataField="Name" HeaderText="Room" />
                <asp:BoundField DataField="SlotName" HeaderText="Slot" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:HyperLinkField DataNavigateUrlFields="ShowID" DataNavigateUrlFormatString="ShowManageGUI.aspx?showid={0}" HeaderText="Edit" Text="Edit">
                <ItemStyle ForeColor="Black" />
                </asp:HyperLinkField>
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        </asp:GridView>
    </p>
    <p class="auto-style4">
        <asp:Label ID="lblNoi" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    </p>
    <p class="auto-style3">
        <asp:Button ID="btnAdd" runat="server" Text="Add Show" OnClick="btnAdd_Click" />
    </p>
</asp:Content>
