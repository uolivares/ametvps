<%@ Page Title="Aprobar Ordenes x Lote" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AprobarOrdenesxLote.aspx.cs" Inherits="A.AprobarOrdenesxLote" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<style type="text/css">
    table.dataTable td {
        font-size: 0.9em;
    }
</style>
 <script type='text/javascript'>
     
     $(document).ready(function () {
         var table = $('#MainContent_GridView1').DataTable({
             buttons: ['excel', 'pdf', 'print', 'colvis'],
             language: {
                 "sProcessing": "Procesando...",
                 "sLengthMenu": "Mostrar _MENU_ registros",
                 "sZeroRecords": "No se encontraron resultados",
                 "sEmptyTable": "Ningún dato disponible en esta tabla",
                 "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                 "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                 "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                 "sInfoPostFix": "",
                 "sSearch": "Buscar:",
                 "sUrl": "",
                 "sInfoThousands": ",",
                 "sLoadingRecords": "Cargando...",
                 "oPaginate": {
                     "sFirst": "Primero",
                     "sLast": "Último",
                     "sNext": "Siguiente",
                     "sPrevious": "Anterior"
                 },
                 "oAria": {
                     "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                     "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                 },
                 "buttons": {
                     "copy": "Copiar",
                     "colvis": "Visibilidad",
                     "collection": "Colección",
                     "colvisRestore": "Restaurar visibilidad",
                     "copyKeys": "Presione ctrl o u2318 + C para copiar los datos de la tabla al portapapeles del sistema. <br \/> <br \/> Para cancelar, haga clic en este mensaje o presione escape.",
                     "copySuccess": {
                         "1": "Copiada 1 fila al portapapeles",
                         "_": "Copiadas %ds fila al portapapeles"
                     },
                     "copyTitle": "Copiar al portapapeles",
                     "csv": "CSV",
                     "excel": "Excel",
                     "pageLength": {
                         "-1": "Mostrar todas las filas",
                         "_": "Mostrar %d filas"
                     },
                     "pdf": "PDF",
                     "print": "Imprimir",
                     "renameState": "Cambiar nombre",
                     "updateState": "Actualizar",
                     "createState": "Crear Estado",
                     "removeAllStates": "Remover Estados",
                     "removeState": "Remover",
                     "savedStates": "Estados Guardados",
                     "stateRestore": "Estado %d"
                 },
             }
         });
         table.buttons().container()
             .appendTo('#MainContent_GridView1_wrapper .col-sm-6:eq(0)');
     });
 </script>

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:darkseagreen"></span> <span class="glyphicon glyphicon-user" style="font-size: 27px; color:darkgreen"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label></h2>
    <hr style="border-color:#CCC;"/>
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>
    
    <div>
        Subir archivo excel:

        <asp:FileUpload ID="FileUpload1" runat="server"  Class="form-control"/>
        <br />
        <br />
        
        <asp:Button ID="Button2" runat="server" Text="Ver archivo excel" 
            Width="142px" onclick="Button2_Click" class="btn btn-success"/>
        &nbsp;
        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
            Text="Guardar en Base de datos" class="btn btn-info"/>

        <hr style="border-color:#CCC;"/>
        <br />
        <asp:GridView ID="GridView1" runat="server" Class="table table-striped table-bordered" ></asp:GridView>
    </div>
    
</asp:Content>