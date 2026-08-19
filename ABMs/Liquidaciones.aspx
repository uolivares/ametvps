<%@ Page Title="Liquidaciones" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Liquidaciones.aspx.cs" Inherits="A.Liquidaciones" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<script type="text/javascript">
 $(document).ready(function() {
  $('#MainContent_gview').DataTable({
  "columnDefs": [{
   "targets": 0
  }],
  language: {
   "sProcessing": "Procesando...",
   "sLengthMenu": "Mostrar _MENU_ resultados",
   "sZeroRecords": "No se encontraron resultados",
   "sEmptyTable": "Ningún dato disponible en esta tabla",
   "sInfo": "Mostrando resultados _START_-_END_ de  _TOTAL_",
   "sInfoEmpty": "Mostrando resultados del 0 al 0 de un total de 0 registros",
   "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
   "sSearch": "Buscar:",
   "sLoadingRecords": "Cargando...",
   "oPaginate": {
    "sFirst": "Primero",
    "sLast": "Último",
    "sNext": "Siguiente",
    "sPrevious": "Anterior"
   },
  }
 });
 });
    
</script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="row">
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:brown"></span> <span class="glyphicon glyphicon-tasks" style="font-size: 23px; color:brown"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label></h2>
    <hr style="border-color:#CCC;"/>
    
    <asp:Label ID="IdPersonaT" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="accion" runat="server" Visible="false"></asp:Label>
    </div>
    <div class="row" >
        <div class="col">
            <asp:Label ID="mensaje" runat="server"  class="alert alert-danger" Visible="false"></asp:Label>
        </div>
        <div class="col" style="text-align:right;" >
            <asp:Button ID="Button1"  runat="server" Text=">> Nueva Liquidación" OnClick="f_agregar_nuevo" class="btn btn-success"/>
        </div>
    </div>
    <br/>
    <div class="row">
        <asp:GridView ID="gview"  runat="server" OnRowDeleting="f_eliminar_fila" 
                OnRowCommand="gview_RowCommand" AutoGenerateColumns="False" class="table table-striped table-bordered"  OnRowDataBound="gview_RowDatabound">
                <Columns>
                 <asp:TemplateField HeaderText="#">     
                <ItemTemplate>                
                <asp:Label id="Num" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ID" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>              
                <asp:TemplateField HeaderText="Liquidación">
                <ItemTemplate>
                <asp:Label id="Liquidacion" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Liquidacion")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha Generada">   
                <ItemTemplate>
                <asp:Label id="FechaGenerada" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CreadoEL")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha Enviada/Cerrada">   
                <ItemTemplate>
                <asp:Label id="FechaEnviada" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FechaEnviada")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Estado">
                <ItemTemplate>
                <asp:Label id="Estado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Estado")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="Mostrar" runat="server" CommandName='<%# DataBinder.Eval(Container.DataItem, "Estado")%>' CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>' 
                         ToolTip="Consultar"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkRemove" runat="server" CommandName="Delete" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>' 
                         OnClientClick = "return confirm('¿Esta seguro que quiere eliminar esta Liquidación?')"  
                         ToolTip="Eliminar" Visible="<%# AMET.PermisoLiquidador()%>"><span class="glyphicon glyphicon-remove" style="color:red"></span></asp:LinkButton>
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="RecuperoDPI" runat="server" CommandName="RecuperoDPI" CommandArgument = '<%#Container.DataItemIndex%>' 
                         ToolTip="Ver Recupero DPI" Visible="false" ><span class="glyphicon glyphicon-file" style="color:darkgreen"></span></asp:LinkButton>
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="AltasBajas" runat="server" CommandName="AltasBajas" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>' 
                         ToolTip="Ver Altas y Bajas" Visible="true" ><span class="glyphicon glyphicon-user" style="color:darkgreen"></span></asp:LinkButton>
                    </ItemTemplate> 
                </asp:TemplateField>
                 </Columns>
                </asp:GridView>
    </div>
</asp:Content>