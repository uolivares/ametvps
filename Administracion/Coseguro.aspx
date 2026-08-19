<%@ Page Title="Coseguro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Coseguro.aspx.cs" Inherits="A.Coseguro" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<script type="text/javascript">
    $(document).ready(function () {
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
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:teal"></span> <span class="glyphicon glyphicon-folder-open" style="font-size: 27px; color:teal"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label></h2>
    <hr style="border-color:#CCC;"/>
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>

    <table id="t_form" align="center" runat="server" border="0" cellpadding="0" cellspacing="0">
        <tr style="height: 30px;">
            <td align="right">Nombre:</td>
            <td></td>
            <td>
                <asp:TextBox ID="Nombre" runat="server" Width="399px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Nombre" ErrorMessage="* Obligatorio" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr style="height: 30px;">
            <td align="right">Código de Liquidación:</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
            <td>
                <asp:TextBox ID="CodLiqCoseguro" runat="server" Width="399px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="CodLiqCoseguro" ErrorMessage="* Obligatorio" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr style="height: 30px;">
            <td align="right">Observaciones:</td>
            <td></td>
            <td align="left">
                <asp:TextBox ID="Observaciones" runat="server" Height="200px" Width="400px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr style="height: 30px;">
            <td>&nbsp;</td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr style="height: 30px;">
            <td align="right">&nbsp;</td>
            <td></td>
            <td style="text-align: center">
                <asp:Button ID="btn_Guardar" runat="server" Text="Guardar" OnClick="Guardar_click" style="text-align: center" class="btn btn-success"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_Cancelar" runat="server" Text="Cancelar" CausesValidation="false" OnClick="Cancelar_Click" class="btn btn-info"/>
            </td>
            <td align="left">&nbsp;</td>
        </tr>
        </table>
    <asp:Label ID="IdCoseguroT" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="accion" runat="server" Visible="false"></asp:Label>
    <table id="t_grilla" runat="server" width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
 
        <tr>
            <td>
               <table id="Table1" runat="server" width="100%" border="0" align="center" >
                    <tr> 
                        <td align="right" style="text-align:right">
                    <asp:Button ID="Button3" runat="server" Text=">> Nuevo Coseguro" OnClick="agregarnuevo" style="text-align: center" class="btn btn-success" /></td>
                    </tr>   
                       
                </table>
            </td>
        </tr>
        <tr>
            <td>
            <br />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gview" runat="server"  CellPadding="4" AutoGenerateColumns="False" 
                OnRowUpdating="gview_RowUpdating" OnRowDeleting="gview_RowDeleting" OnRowCommand="gview_RowCommand"  class="table table-striped table-bordered" >
                    <Columns>
                        <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <asp:Label ID="Num" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label ID="Nombre" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Nombre")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Cod. de Liquidación">
                            <ItemTemplate>
                                <asp:Label ID="CodLiqCoseguro" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CodLiqCoseguro")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Observaciones">
                            <ItemTemplate>
                                <asp:Label ID="Observaciones" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Observaciones")%>'></asp:Label>
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
                                <asp:LinkButton Visible="<%# AMET.PermisoOperador()%>" ID="Editar" runat="server" CommandName="Update" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>' 
                                 ToolTip="Modificar"><span class="glyphicon glyphicon-edit" style="color:green"></span></asp:LinkButton>
                            </ItemTemplate> 
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton Visible="<%# AMET.PermisoOperador()%>" ID="lnkRemove" runat="server" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID")%>'
                                    OnClientClick="return confirm('¿Esta seguro que quiere eliminar?')" ToolTip="Eliminar">
                                    <span class="glyphicon glyphicon-remove" style="color:red"></span></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>