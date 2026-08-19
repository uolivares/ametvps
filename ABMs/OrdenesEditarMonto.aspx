<%@ Page Title="Editar Monto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdenesEditarMonto.aspx.cs" Inherits="A.OrdenesEditarMonto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<script type="text/javascript">    
    alert("ID="+request.Querystring(" id="));
</script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <h3><strong><asp:Label ID="lbl_ordenes" runat="server"></asp:Label></strong></h3>
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>
<div class="container">

      <div class="form-group row">
        <label for="colpadron" class="col-sm-6"><strong>Padrón:</strong></label>
        <div class="col-sm-6">
          <asp:Label id="padron" runat="server" ></asp:Label>
        </div>
      </div>
      <div class="form-group row">
        <label for="colNombre" class="col-sm-6 "><strong>Nombre:</strong></label>
        <div class="col-sm-6">
          <asp:Label id="nombre" runat="server" ></asp:Label>
        </div>
      </div>
      <div class="form-group row">
        <label for="colFmonto" class="col-sm-6"><strong>Monto Pedido:</strong></label>
        <div class="col-sm-6">
            <asp:TextBox ID="montopedido" runat="server" CssClass="form-control" Width="130px"></asp:TextBox>
        </div>
      </div>

    <div class="form-group row pull-right">
      <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-success" OnClick="f_guardar" />     
    </div>
</div>

</asp:Content>
