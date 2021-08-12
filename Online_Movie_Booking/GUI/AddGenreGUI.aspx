<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddGenreGUI.aspx.cs" Inherits="SE1438_Group2_Project.GUI.AddGenreGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 495px;
        }
        .auto-style2 {
            font-family: "Segoe UI";
            font-weight: bold;
            font-size: large;
            color: red;
        }
        .auto-style3 {
            font-weight: bold;
        }
        .auto-style4 {
            width: 495px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="Label1" runat="server" CssClass="auto-style2" Text="Add Genre"></asp:Label>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style4">Enter Genre Name:</td>
                <td>
                    <asp:TextBox ID="txtGenreName" runat="server" CssClass="auto-style3"></asp:TextBox>
                    <b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtGenreName" ErrorMessage="Enter Genre Name!"></asp:RequiredFieldValidator>
                    </b></td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
                </td>
                <td>
                    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CausesValidation="False" />
                </td>
            </tr>
        </table>
    </p>
</asp:Content>
