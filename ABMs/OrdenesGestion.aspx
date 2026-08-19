<%@ Page Title="Gestion de Ordenes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdenesGestion.aspx.cs" Inherits="A.OrdenesGestion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<script type="text/javascript">
    $(document).ready(function () {
        var table = $('#MainContent_grilla_principal').DataTable({
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

            }
        });
        table.buttons().container()
            .appendTo('#MainContent_grilla_principal_wrapper .col-sm-6:eq(0)');
    });
</script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:brown"></span> <span class="glyphicon glyphicon-tasks" style="font-size: 23px; color:brown"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label> : <asp:Label ID="Lbl_ultima" runat="server"></asp:Label></h2>
    <center><asp:Image ID="Image1" runat="server" ImageUrl="~/img/Wizar_Aprobar_Ordenes.jpg" /></center>
    <hr style="border-color:#CCC;"/>
    <asp:Label ID="accion" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="Txt_mes" runat="server" visible="false"></asp:Label>
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>
    <asp:Label ID="EstadoLiq" runat="server" Visible="false"></asp:Label>

<div class="container-fluid" id="t_grilla" runat="server"> 
    <div class="row">
        <div class="col-md-2"><asp:Button ID="btnVolver" runat="server"  Text="<< Volver" class="btn btn-info" OnClick="f_volver"/></div>
        <div class="col-md-2" style="text-align:right"><label>Estado de Ordenes >></label></div>
        <div class="col-md-3" >
            <asp:DropDownList ID="CBox_Estado" Width="180px" runat="server" onselectedindexchanged="CBox_Estado_SelectedIndexChanged" AutoPostBack = "true" CssClass="form-control col-xs-3">
                <asp:ListItem Value="Generada" Selected="True">GENERADA</asp:ListItem>
                <asp:ListItem Value="Aprobada">APROBADA</asp:ListItem>
                <asp:ListItem Value="Anulada">ANULADA</asp:ListItem>
            </asp:DropDownList>                  
        </div>
        <div class="col-md-3" style="text-align: right;">
            <asp:LinkButton Visible="false" ID="lnk_aprobarlote" runat="server" OnClick="Aprobar_Lote_Ordenes" class="btn btn-primary"  >
            >> Aprobar Ordenes por lote <<</asp:LinkButton>
        </div>
        <div class="col-md-2" style="text-align: right;">
            <asp:LinkButton Visible="<%# AMET.PermisoOperador()%>" ID="lnk_aprobar_orden" runat="server" OnClientClick = "return confirm('Se va a Generar una Novedad...')"
             OnClick="grilla_principal_Aprobar" class="btn btn-success" >
            >> Siguiente</asp:LinkButton>
        </div>
    </div>
     <br /><br />
    <div class="row">
            <asp:GridView ID="grilla_principal"  runat="server" AutoGenerateColumns="False"
            OnRowDeleting="f_eliminar_fila"  OnRowCommand="gview_RowCommand" class="table table-striped table-bordered" OnRowDataBound="gview_RowDatabound">
            <AlternatingRowStyle BackColor="White" />      
            <Columns>
                <asp:TemplateField HeaderText="#">     
            <ItemTemplate>                
            <asp:Label id="Num" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>	
            </ItemTemplate>
            </asp:TemplateField>                
                <asp:TemplateField HeaderText="ID" Visible="False">     
            <ItemTemplate>                
            <asp:Label id="ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID")%>'></asp:Label>	
            </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Orden">
            <ItemTemplate>
            <asp:Label id="NumOrden" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NumOrden") %>'></asp:Label>	
            </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Padrón">   
            <ItemTemplate>
            <asp:Label id="Padron" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Padron") %>'></asp:Label>	
            </ItemTemplate>  
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre">   
            <ItemTemplate>
            <asp:Label id="NomAp" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NomAp") %>'></asp:Label>	
            </ItemTemplate>  
            </asp:TemplateField>              
            <asp:TemplateField HeaderText="Fecha Inicio">   
            <ItemTemplate>
            <asp:Label id="FechaInicio" runat="server" Text='<%# Bind("FI", "{0:d}") %>'></asp:Label>	
            </ItemTemplate>  
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fecha Fin">   
            <ItemTemplate>
            <asp:Label id="FechaFin" runat="server" Text='<%# Bind("FV", "{0:d}") %>'></asp:Label>	
            </ItemTemplate>  
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Importe Financiado">
            <ItemTemplate>
            <asp:Label id="ImporteTotal" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ImporteT")%>'></asp:Label>	
            </ItemTemplate>  
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cant Cuotas">
            <ItemTemplate>
            <asp:Label id="CantCuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CuotaCant")%>'></asp:Label>	
            </ItemTemplate>  
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cuotas">
            <ItemTemplate>
            <asp:Label id="Cuotas" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Cuota")%>'></asp:Label>	
            </ItemTemplate>  
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Comercio">
            <ItemTemplate>
            <asp:Label id="NomComercio" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NomComercio")%>'></asp:Label>	
            </ItemTemplate>  
            </asp:TemplateField>
                <asp:TemplateField HeaderText="Estado">
            <ItemTemplate>
            <asp:Label id="Estado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Estado")%>'></asp:Label>	
            </ItemTemplate>  
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="Mostrar" runat="server" CommandName="Mostrar" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>' 
                    ToolTip="Consultar"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton Visible="<%# AMET.PermisoLiquidador()%>" ID="lnkRemove" runat="server" CommandName="Delete" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>' 
                        OnClientClick = "return confirm('¿Está seguro que quiere ANULAR esta Orden?')" 
                    ToolTip ="Dar de Baja"><span class="glyphicon glyphicon-remove" style="color:red"></span></asp:LinkButton>
                </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton  ID="Aprobar" runat="server" CommandName="Aprobar" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>'  CssClass="btn btn-warning"
                        OnClientClick = "return confirm('¿Confirma el cambio de Estado de la Orden a Aprobada?')" Visible="<%# AMET.PermisoLiquidador()%>"
                        ToolTip="Aprobar Orden">Aprobar <span class="glyphicon glyphicon-ok"></span></asp:LinkButton>
                </ItemTemplate> 
            </asp:TemplateField>
            </Columns>
            </asp:GridView>
        </div>
        <div class="row">
            <asp:Label ID="lbl_mensaje" runat="server" ></asp:Label>

        </div>
</div>
     
<div class="modal fade" id="ModalOrdenes" tabindex="-1" role="dialog" aria-labelledby="ModalOrdenes" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <h3><strong><asp:Label ID="lbl_ordenes" runat="server">Ordenes Detalle</asp:Label></strong></h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
            </button>
            </div>
            <div class="modal-body">
                <div class="row">
                <table id="t_form_muestra" align="center" runat="server" border="0" cellpadding="0" cellspacing="0" Width="90%">
                    <tr>
                        <td colspan="4"></td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right">Número&nbsp;Oden:</td>
                        <td>&nbsp;</td>
                        <td align="left">
                            &nbsp;<asp:TextBox ID="txt_numero" runat="server" Width="110px" Enabled="False"></asp:TextBox>
                        </td>
                        <td align="left">
                            Estado: <asp:TextBox ID="txt_estado" runat="server" Width="110px" Enabled="False"></asp:TextBox> 
                            <asp:TextBox ID="txt_id_orden" runat="server" Width="110px" Enabled="False" Visible="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right">Autorizado: </td>
                        <td>&nbsp;</td>
                        <td align="left" colspan="2">
                        <asp:TextBox ID="txt_Autorizado" runat="server" Width="270px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right">Afiliado:</td>
                        <td>&nbsp;</td>
                        <td align="left" colspan="2">
                            <asp:TextBox ID="txt_Afiliado" runat="server" Width="270px" Enabled="False" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right">Total:</td>
                        <td></td>
                        <td align="left">
                        <asp:TextBox ID="txt_importe" runat="server" Width="145px" Enabled="False"></asp:TextBox>
                        </td>
                        <td align="left">
                            Cuotas:<asp:TextBox ID="txt_cuotas" runat="server" Width="68px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right">Comercio:</td>
                        <td></td>
                        <td colspan="2">
                            <asp:TextBox ID="txt_comercio" runat="server" Width="201px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right">Fecha Creacion: </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="txt_fechaCreacion" runat="server" Width="84px" Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                            Inicio&nbsp;Cobro&nbsp;<asp:TextBox ID="txt_fechaAlta" runat="server" Width="84px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right"></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>Fin de Cobro <asp:TextBox ID="txt_fechaBaja" runat="server" Width="84px" Enabled="False" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right">Firmante:</td>
                        <td></td>
                        <td colspan="2">
                           <asp:TextBox ID="txt_firmante" runat="server" Width="289px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right">Observaciones: </td>
                        <td></td>
                        <td colspan="2">
                            <asp:TextBox ID="Txt_observa" runat="server" Height="29px" Width="414px"></asp:TextBox>
                        </td>
                    </tr>
                 </table>
                </div>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
</asp:Content>