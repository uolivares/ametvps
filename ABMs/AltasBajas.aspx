<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltasBajas.aspx.cs" Inherits="A.Blanco" EnableEventValidation="false"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        table2.dataTable td { font-size: 0.8em;}
    </style>
    <script type='text/javascript'>
        $(document).ready(function () {
            
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

    </script>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color: brown"></span><span class="glyphicon glyphicon-tasks" style="font-size: 23px; color: brown"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label>
        : <asp:Label ID="Lbl_ultima" runat="server"></asp:Label></h2>
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
                    
                    <div class="col-md-3">
                        <div class="col-md-3">
                            <strong>Padron:</strong>
                        </div>
                        <div class="col-md-9">
                            <asp:TextBox ID="Txt_Padron" runat="server" CssClass="form-control" Enabled="<%# PermitirEditar() %>"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2" style="text-align: right;" Enabled="<%# PermitirEditar() %>">
                        <asp:DropDownList ID="TipoAlta" runat="server" CssClass="form-control" >
                                <asp:ListItem Value="AltaAfiliado">Alta Afiliado</asp:ListItem>
                                <asp:ListItem Value="BajaAfiliado">Baja Afiliado</asp:ListItem>
                                <asp:ListItem Value="AltaCoseguro">Alta Coseguro</asp:ListItem>
                                <asp:ListItem Value="BajaCoseguro">Baja Coseguro</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:Button ID="AgregarNovedad" runat="server" OnClick="AltaBaja_Click" Text="<< Agregar Nov." class="btn btn-info"  />
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
