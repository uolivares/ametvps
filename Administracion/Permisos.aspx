<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Permisos.aspx.cs" Inherits="A.Permisos" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="Server">
<h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:darkslateblue"></span> <span class="glyphicon glyphicon-lock" style="font-size: 27px; color:darkslateblue;"></span>&nbsp;&nbsp;<asp:Label ID="Titulo1" runat="server">Seguridad / Administrar Permisos</asp:Label></h2>
<hr style="border-color:#CCC;"/>
    <br />
    <table border="0" width="60%">
        <tr>
            <td>
                Seleccionar Usuario:
                <asp:DropDownList ID="cmbUsuarios" runat="server" Width="200px" OnSelectedIndexChanged="cmbUsuarios_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                </td>
            <td>
                <asp:Button ID="Actualizar" runat="server" Text="Actualizar" OnClick="Actualizar_Click" class="btn btn-success"/>
                
            </td>
            <td></td>
        </tr>
        <tr>
            <td  colspan="3" height="30"></td>
        </tr>
        <tr>
            <td>Permisos No Asignados</td>
            <td>&nbsp;</td>
            <td>Permisos Asignados</td>
        </tr>
        <tr>
            <td rowspan="4">
                <asp:ListBox ID="lbNoAsignados" runat="server" Height="150px" Width="200px" CssClass="form-control"></asp:ListBox>
            </td>
            <td>
                <asp:Button ID="btnAgregarUno" runat="server" Text="&gt;" Width="48px" OnClick="btnAgregarUno_Click" />
            </td>
            <td rowspan="4">
                <asp:ListBox ID="lbAsignados" runat="server" Height="150px" Width="200px" CssClass="form-control"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnEliminarUno" runat="server" Text="&lt;" Width="48px" OnClick="btnEliminarUno_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAgregarTodos" runat="server" Text="&gt;&gt;" Width="48px" OnClick="btnAgregarTodos_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnEliminarTodos" runat="server" Text="&lt;&lt;" Width="48px" OnClick="btnEliminarTodos_Click" />
            </td>
        </tr>
    </table>
</asp:Content>