<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FilmGUI.aspx.cs" Inherits="SE1438_Group2_Project.GUI.FilmGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 342px;
        }
        .auto-style2 {
            width: 279px;
        }
        .auto-style3 {
            font-family: "Segoe UI";
            font-weight: bold;
            font-size: large;
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" CssClass="auto-style3" Text="PHIM ĐANG CHIẾU"></asp:Label>
                </td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" Width="980px" AllowPaging="True" CellPadding="4" EnableModelValidation="True" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="2" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="FilmID" HeaderText="ID" />
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:ImageField DataImageUrlField="ImageUrl" HeaderText="Image">
                                <ControlStyle Width="120px" Height="180px"/>
                            </asp:ImageField>
                            <asp:BoundField DataField="Date" HeaderText="Release Date" />
                            <asp:BoundField DataField="CountryName" HeaderText="Country" />
                            <asp:BoundField DataField="Time" HeaderText="Run Time" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:ButtonField CommandName="Detail" HeaderText ="View" Text="View" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="btnAdd" runat="server" Text="Add New Film" OnClick="btnAdd_Click" Visible="False" />
                </td>
            </tr>
        </table>
    
</asp:Content>
