<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieManageGUI.aspx.cs" Inherits="SE1438_Group2_Project.GUI.MovieManageGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 145px;
        }
        .auto-style2 {
            width: 374px;
        }
        .auto-style3 {
            width: 86px;
        }
        .auto-style4 {
            margin-left: 40px;
        }
        .auto-style6 {
            font-family: "Segoe UI";
            font-weight: bold;
            font-size: x-large;
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="Label1" runat="server" CssClass="auto-style6" Text="Movie Manager"></asp:Label>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">Title:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtTitle" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="Enter movie's title"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style3">Director:</td>
                <td>
                    <asp:TextBox ID="txtDirector" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Actor:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtActor" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Release Date:</td>
                <td class="auto-style2">
                    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                </td>
                <td class="auto-style3">Description:</td>
                <td>
                    <asp:TextBox ID="txtDes" runat="server" Height="181px" TextMode="MultiLine" Width="356px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Running Time:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtRunTime" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style3" rowspan="2">Image:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtURL" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Country:</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlCountry" runat="server" Width="220px">
                    </asp:DropDownList>
                    <br />
                    <asp:Button ID="btnCountry" runat="server" Text="Add Country" OnClick="btnCountry_Click" CausesValidation="False" />
                </td>
                <td class="auto-style4">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" CausesValidation="False" />
                    <asp:Label ID="lblUpload" runat="server" ForeColor="Red"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Upload" ControlToValidate="txtURL"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Genre</td>
                <td class="auto-style2">
                    <asp:ListBox ID="ListBox1" runat="server" Width="167px" SelectionMode="Multiple"></asp:ListBox>
                    <br />
                    <asp:Button ID="btnGenre" runat="server" Text="Add Genre" OnClick="btnGenre_Click" CausesValidation="False" />
                </td>
                <td class="auto-style3" rowspan="2">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Image ID="Image2" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="False" />
                </td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>
