<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="A.Usuarios" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="Server">
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:darkslateblue"></span> <span class="glyphicon glyphicon-lock" style="font-size: 27px; color:darkslateblue;"></span>&nbsp;&nbsp;<asp:Label ID="Titulo1" runat="server">Seguridad / Administrar Usuarios</asp:Label></h2>
    <hr style="border-color:#CCC;"/>

    <br />
    <asp:LinkButton ID="LinkRegistrarUsuario" PostBackUrl="~/Account/Register.aspx" runat="server">Registrar Nuevo Usuario</asp:LinkButton>
    <br />
    <br />
    <div class="row">
        <div class="col-md-3">
            Seleccione Usuario a Eliminar:
            <asp:DropDownList ID="cmbUsuarioEliminar" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="col-md-3">
            <br /><asp:Button ID="btnEliminarUsuario" runat="server" OnClick="btnEliminarUsuario_Click" Text="Eliminar" class="btn btn-danger"/>
        </div>
    </div>
</asp:Content>