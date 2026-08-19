<%@ Page Title="Detalle de Ordenes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdenesDetalleLiq.aspx.cs" Inherits="A.OrdenesDetalleLiq" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        $(document).ready(function () {
            var table = $('#MainContent_grilla_secundaria').DataTable({
                
                paging: false,
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
                        var total = total + intVal(porciones[5]);
                    }

                    $(api.column(4).footer()).html('TOTAL:');
                    $(api.column(5).footer()).html('$ ' + total.toFixed(2));
                }
            });
            table.buttons().container()
                .appendTo('#MainContent_grilla_secundaria_wrapper .col-sm-6:eq(0)');

        });
        
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <h3><strong><asp:Label ID="lbl_ordenes" runat="server"></asp:Label></strong></h3>
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>
    <asp:GridView ID="grilla_secundaria" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered" EmptyDataText="No hay resultados." ShowFooter="true">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Padron">
                                <ItemTemplate>
                                    <asp:Label ID="Padron" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "padron") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Orden">
                                <ItemTemplate>
                                    <asp:Label ID="Orden" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NumOrden") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Código">
                                <ItemTemplate>
                                    <asp:Label ID="CodigoFinanciero" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CodigoFinanciero") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Inicio Cobro">
                                <ItemTemplate>
                                    <asp:Label ID="FechaInicio" runat="server" Text='<%# Bind("FI", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Importe Total">
                                <ItemTemplate>
                                    <asp:Label ID="ImporteTotal" runat="server" Text=' <%# DataBinder.Eval(Container.DataItem, "ImporteT")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cuotas">
                                <ItemTemplate>
                                    <asp:Label ID="CantCuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CuotaCant")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Monto Cuota">
                                <ItemTemplate>
                                    <asp:Label ID="CuotasMonto" runat="server" Text=' <%# DataBinder.Eval(Container.DataItem, "Cuota")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Comercio">
                                <ItemTemplate>
                                    <asp:Label ID="NomComercio" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NomComercio")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado">
                                <ItemTemplate>
                                    <asp:Label ID="Estado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Estado")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Desactivado El">
                                <ItemTemplate>
                                    <asp:Label ID="Estado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DesactivadoEl")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
</asp:Content>
