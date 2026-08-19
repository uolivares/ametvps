<%@ Page Title="TOMA DPI" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CargarDPI.aspx.cs" Inherits="A.CargarDPI" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<style type="text/css">
    table.dataTable td {
        font-size: 0.9em;
    }
</style>
 <script type='text/javascript'>
     $(document).ready(function () {
         var table = $('#MainContent_MyGridView').DataTable({
             buttons: ['excel', 'pdf', 'print', 'colvis'],
             language: {
                 decimal: ',',
                 thousands: '.',
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
             },
             "drawCallback": function (settings) {
                 var e = settings.nTBody.rows;
                 var api = this.api(), data;
                 var intVal = function (i) {
                     return typeof i === 'string' ?
                         i.replace(/[\$,]/g, '') * 1 :
                         typeof i === 'number' ?
                             i : 0;
                 };

                 var total = 0;
                 for (var i = 0; i < e.length; i++) {
                     var a = e[i]["innerText"];
                     var porciones = a.split("\t");
                     var total = total + intVal(porciones[6]);
                 }

                 $(api.column(5).footer()).html('TOTAL:');
                 $(api.column(6).footer()).html('$ ' + total.toFixed(2));
             }
         });
         table.buttons().container()
             .appendTo('#MainContent_MyGridView_wrapper .col-sm-6:eq(0)');
     });
 </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:brown"></span> <span class="glyphicon glyphicon-tasks" style="font-size: 23px; color:brown"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label></h2>
    <hr style="border-color:#CCC;"/>
    <asp:Label ID="archivo" runat="server" Visible="false"></asp:Label>
    <div class="alert alert-warning" role="alert" id="alerta" runat="server">
        <asp:Label ID="mensaje" runat="server"></asp:Label>
    </div>
    <div>
        <div class="row"><center><h3>(J21) Cuota AMET   -   (K66) Prestamos   -   (P02) Coseguro</h3></center></div>
        <hr style="border-color:#CCC;"/>
        <div class="row">
            <div class="col-md-3">
                 <asp:Button ID="btnVolver" runat="server" Text="<< Volver" CausesValidation="false" onclick="Volver_Click" CssClass="btn btn-info"/>
            </div>
            <div class="col-md-3">
                <asp:FileUpload ID="fileupload1" class="form-control" runat="server" />
<%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
       ErrorMessage="Tipo de archivo no permitido" ControlToValidate="fileupload1" ForeColor="Red"
      ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.txt|.TXT|.dic|.DIC)$">
  </asp:RegularExpressionValidator>--%></div>
            <div class="col-md-2"><asp:Button ID="btnRead" runat="server" onclick="btnRead_Click" Text="<< Visualizar Archivo" class="btn btn-primary"/></div>
            <div class="col-md-2"><asp:Button ID="btnGuardar" runat="server" onclick="Guardar_Click" Text="< Guardar Recupero y Actualizar Liquidación >" class="btn btn-success" Visible="false"/></div>
            <div class="col-md-2"><asp:Button ID="btnBorrar" runat="server" onclick="Borrar_Click" Text="> Borrar Recupero <" class="btn btn-danger" Visible="false" OnClientClick = "return confirm('¿Esta seguro que quiere eliminar el recupero?')"/></div>
        </div>
        <br />
         <div class="row" runat="server" id="archivot">
             <div class="col-md-2">Archivo Original :</div>
             <div class="col-md-10">
                 <asp:TextBox class="form-control" ID="textBoxContents" runat="server" tabIndex="0" height="81px" 
        textMode="MultiLine" width="100%"></asp:TextBox></div>
        </div>
    <div class="row">
        <asp:TextBox ID="cartel" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox>
    </div>
    <div class="row">
        <asp:GridView ID="MyGridView" runat="server" Width="100%" class="table table-striped table-bordered"></asp:GridView>
    </div>
</div>
</asp:Content>