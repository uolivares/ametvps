<%@ Page Title="Liquidación" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Planilla.aspx.cs" Inherits="A.Planilla" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        table.dataTable td { font-size: 0.8em;}

        table2.dataTable td { font-size: 0.8em;}
    </style>
    <script type='text/javascript'>
        $(document).ready(function () {
            var table = $('#MainContent_vista_planilla').DataTable({
                scrollY: 600,
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
                }
            });
            table.buttons().container()
                .appendTo('#MainContent_vista_planilla_wrapper .col-sm-6:eq(0)');

            var table2 = $('#MainContent_GrillaNovedades').DataTable({
                scrollY: 600,
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
                }
            });
            table2.buttons().container()
                .appendTo('#MainContent_GrillaNovedades_wrapper .col-sm-6:eq(0)');
        });

        function ventanaSecundaria(URL, ww, hh) {
            window.open(URL, "Detalle", "width=" + ww + ",height=" + hh +",directories=0,titlebar=0,toolbar=0,location=0,status=0, menubar=0,scrollbars=no,resizable=no")
        }
      
        function mostrar(URL) {
            div = document.getElementById('flotante');
            div.style.display = '';
            document.getElementById('editar').src = URL;
        }

        function cerrar() {
            div = document.getElementById('flotante');
            div.style.display = 'none';
        }

    </script>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color: brown"></span><span class="glyphicon glyphicon-tasks" style="font-size: 23px; color: brown"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label>
        :
        <asp:Label ID="Lbl_ultima" runat="server"></asp:Label></h2>
    <center>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/Wizar_Generar_Novedad.jpg" /></center>
    <hr style="border-color: #CCC;" />
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>

    <asp:Label ID="IdLiquidacionT" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="IdPersonaT" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="EstadoLiq" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="accion" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="Txt_mes" runat="server" Visible="false"></asp:Label>

    <div class="container-fluid" id="d_grilla" runat="server">
        <div class="row">
            <div class="col-md-4">
                <asp:Button ID="btnAceptar" runat="server" Text="<< Volver" Width="105px" OnClick="f_volver" class="btn btn-info" /></div>
            <div class="col-md-8" style="text-align: right;">
                <asp:Button ID="bt_enviar" runat="server" Text="Enviar Novedad >>" OnClientClick="return confirm('¿Está seguro de ENVIAR la Novedad?')" OnClick="Enviar_Click" Visible="false" class="btn btn-success" />
                <asp:Button ID="bt_cerrar" runat="server" Text="CERRAR Novedad >>" OnClientClick="return confirm('¿Está seguro de CERRAR la Novedad?')" OnClick="Cerrar_Click" Visible="false" class="btn btn-success" />
                <asp:Button ID="ExportaDPI" runat="server" Text=">> Exportar Altas a Archivo DPI" OnClick="ExportaDPI_Click" class="btn btn-warning" Visible="false" />
                <asp:Button ID="ImportarDPI" runat="server" OnClick="ImportarDPI_Click" Text="Importar Archivo DPI <<" class="btn btn-info" Visible="false" />
            </div>
        </div>

        <div class="row">
            <div class="container" style="padding-top: 20px;">
                <hr style="border-color: #CCC;" />
                <div class="row">
                    <div class="col-xs-12">
                        <div class="col-md-2 btn-primary text-right">
                            <h5><strong>GRUPO >></strong></h5>
                        </div>
                        <div class="col-md-5">
                            <asp:DropDownList ID="Grupo" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Grupo_SelectedIndexChanged">
                                <asp:ListItem Value="ESC">Escuela</asp:ListItem>
                                <asp:ListItem Value="SG">Sueldos Generales</asp:ListItem>
                                <asp:ListItem Value="">Todos</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-2 btn-primary text-right">
                            <h5><strong>Deuda Mayor a >></strong></h5>
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="DDMayor" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Grupo_SelectedIndexChanged">
                                <asp:ListItem Value="1">$ 1</asp:ListItem>
                                <asp:ListItem Value="10">$ 10</asp:ListItem>
                                <asp:ListItem Value="50">$ 50</asp:ListItem>
                                <asp:ListItem Value="100">$ 100</asp:ListItem>
                                <asp:ListItem Value="-1000000">Todos</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div id="flotante" style="display:none; position: fixed;right:0;z-index:9999"  class="position-fixed">
                     <div id="close" class="btn-info"><a href="javascript:cerrar();" class="btn btn-info">[X] Cerrar</a></div>
                    <iframe style=" width: 350px; height: 350px;" id="editar"></iframe>
                </div>
                <hr style="border-color: #CCC;" />
                <h4 class="text-success"><strong>LIQUIDACIÓN (ORDENES, SALDOS):</strong></h4>
                <asp:GridView ID="vista_planilla" runat="server" AutoGenerateColumns="False" OnRowDataBound="gview_RowDatabound"
                     OnRowCommand="gview_RowCommand" class="table table-striped table-bordered">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <asp:Label ID="Num" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Centro" Visible="True" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="CodCentro" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CodCentro")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Padrón" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="Padron" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Padron")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apellido y Nombre" ItemStyle-Width="250px">
                            <ItemTemplate>
                                <asp:Label ID="Afiliado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Nombre")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cuota">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CuotasTotal")%>' UpdateMode="Conditional" OnClientClick="findAllOccurences(); return false;"></asp:Label>
                                <a href="javascript:ventanaSecundaria('OrdenesDetalleLiq.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "ID")%>',1024, 800)">
                                    <span class="glyphicon glyphicon-th-list" style="color: darkblue"></span>
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Saldo">
                            <ItemTemplate>
                                <asp:Label ID="Saldo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SaldoAnterior")%>'></asp:Label>
                                <asp:LinkButton ID="lnk_saldo" runat="server" CommandName="Quitar" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID")%>'
                                    OnClientClick="return confirm('¿ Confirma aplicar el 2% de recargo?')" Visible="false" ToolTip="Aplicar 2%">
                                    <span class="glyphicon glyphicon-download-alt" style="color:red"></span>  
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Deuda">
                            <ItemTemplate>
                                <asp:Label ID="Deuda" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Total")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pedido">
                            <ItemTemplate>
                                <asp:Label ID="Lb_Pedido" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MontoPedido")%>'></asp:Label>
                                 <a href="javascript:mostrar('OrdenesEditarMonto.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "ID")%>')">
                                    <span class="glyphicon glyphicon-edit" style="color:green"></span>
                                </a>
                           </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Toma">
                            <ItemTemplate>
                                <asp:Label ID="Recuperado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MontoRecuperado")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Grupo">
                            <ItemTemplate>
                                <asp:Label ID="Grupo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Grupo")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Modif.">
                            <ItemTemplate>
                                <asp:Label ID="ModificadoEl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ModificadoEl")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

 <%-- **********************************************************************************************************************************
                                                 Planillas de Altas
**********************************************************************************************************************************--%>
        <hr style="border-color: #CCC;" />
        <div class="row">
            <div class="container" style="padding-top: 20px;">
                <div class="row">
                    <div class="col-md-6">
                        <h4 class="text-success"><strong>ALTAS Y BAJAS AFILIADOS Y COSEGURO:</strong></h4>
                    </div>
                    

                </div>
           </div>
        
        <asp:Label ID="Novedad" runat="server"></asp:Label>
        <br />
        <asp:GridView ID="GrillaNovedades" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered" OnRowDeleting="f_eliminar_novedad"
            OnRowDataBound="grilla_RowDatabound">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="#">
                    <ItemTemplate>
                        <asp:Label ID="Num" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IdNovedadesAmet" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="IdNovedadesAmet" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "IdNovedadesAmet")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Centro" Visible="true" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="CodCentro" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CodCentro")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Padrón">
                    <ItemTemplate>
                        <asp:Label ID="Padron" runat="server" Text=' <%# DataBinder.Eval(Container.DataItem, "Padron")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CUIL">
                    <ItemTemplate>
                        <asp:Label ID="CUIL" runat="server" Text=' <%# DataBinder.Eval(Container.DataItem, "CUIL")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Apellido y Nombre">
                    <ItemTemplate>
                        <asp:Label ID="NomApe" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NomApe") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tipo de Novedad">
                    <ItemTemplate>
                        <asp:Label ID="TipoNovedad" runat="server" Text='<%# Eval("TipoNovedad") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha Novedad">
                    <ItemTemplate>
                        <asp:Label ID="FechaNovedad" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FechaNovedad") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Grupo">
                    <ItemTemplate>
                        <asp:Label ID="Grupo" runat="server" Text='<%# Bind("Grupo", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnk_Remove" runat="server" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "IdNovedadesAmet")%>'
                            OnClientClick="return confirm('¿Esta seguro que quiere eliminar esta Novedad?')" Visible="<%# AMET.PermisoLiquidador()%>" ToolTip="Eliminar">
                <span class="glyphicon glyphicon-remove" style="color:red"></span>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
  </div>
</asp:Content>
