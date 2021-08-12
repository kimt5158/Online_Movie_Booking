<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowManageGUI.aspx.cs" Inherits="SE1438_Group2_Project.GUI.ShowManageGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 234px;
        }
        .auto-style4 {
            width: 502px;
            margin-left: 40px;
        }
        .auto-style5 {
            width: 502px;
        }
        .auto-style6 {
            font-family: "Segoe UI";
            font-weight: bold;
            font-size: large;
            color: red;
        }
        .auto-style7 {
            width: 234px;
            font-family: "Segoe UI";
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="Label1" runat="server" CssClass="auto-style6" Text="Show Manager"></asp:Label>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style7">Date:</td>
                <td class="auto-style4">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" OnSelectionChanged="Calendar1_SelectionChanged">
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
            <tr>
                <td class="auto-style7">Slot:</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="ddlSlot" runat="server" Width="273px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Film:</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="ddlFilm" runat="server" Width="272px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Price:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPrice" ErrorMessage="Price can not blank!"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPrice" ErrorMessage="Must be double &gt; 0" MaximumValue="99999" MinimumValue="0" Type="Double"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" CausesValidation="False" />
                </td>
            </tr>
        </table>
    </p>
</asp:Content>
