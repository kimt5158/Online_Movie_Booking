<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCountryGUI.aspx.cs" Inherits="SE1438_Group2_Project.GUI.AddCountryGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 406px;
        }
        .auto-style2 {
            font-family: "Segoe UI";
            font-weight: bold;
            font-size: large;
            color: red;
        }
        .auto-style3 {
            width: 406px;
            font-family: "Segoe UI";
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="Label1" runat="server" CssClass="auto-style2" Text="Add Country"></asp:Label>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style3">Enter Country Name:</td>
                <td>
                    <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCountry" ErrorMessage="Enter Country Name!"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="auto-style1">
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
                </td>
                <td>
                    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CausesValidation="False" />
                </td>
            </tr>
        </table>
    </p>
</asp:Content>
