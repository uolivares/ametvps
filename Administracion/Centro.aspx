<%@ Page Title="Centro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Centro.aspx.cs" Inherits="A.Centro" %>

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
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:tomato"></span> <span class="glyphicon glyphicon-stats" style="font-size: 27px; color:tomato"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label></h2>
    <hr style="border-color:#CCC;"/>
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>
    <asp:Label ID="IdCentroT" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="accion" runat="server" Visible="false"></asp:Label>

<table id="t_grilla" runat="server"  width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
           <tr>
            <td> 
                  <table id="Table2" runat="server" width="100%" border="0" align="center" >
                    <tr> 
                        <td align="right" style="text-align:right">
                        <asp:Button ID="Button3" runat="server" Text=">> Nueva Centro" OnClick="f_agregar_nuevo" class="btn btn-success"/></td>
                    </tr>    
                   </table>
                <br />
             </td>
            </tr>
            <tr><td></td></tr>
            <tr>
            <td align="center">
                <asp:GridView ID="gview"  runat="server" AutoGenerateColumns="False" OnRowUpdating = "f_actualizar_registro" OnRowDeleting="f_eliminar_fila" 
                OnRowCommand="gview_RowCommand"  class="table table-striped table-bordered">
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
                <asp:TemplateField HeaderText="Código Centro">
                <ItemTemplate>
                <asp:Label id="CodCentro" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CodCentro")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Descripción">   
                <ItemTemplate>
                <asp:Label id="Descripcion" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Descripcion")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tipo">
                <ItemTemplate>
                <asp:Label id="Tipo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Tipo")%>'></asp:Label>	
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
                        <asp:LinkButton ID="Editar" runat="server" CommandName="Update" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>' 
                         ToolTip="Modificar"><span class="glyphicon glyphicon-edit" style="color:green"></span></asp:LinkButton>
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkRemove" runat="server" CommandName="Delete" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>' 
                         OnClientClick = "return confirm('¿Esta seguro que quiere eliminar este Centro ?')" 
                        ToolTip="Eliminar"><span class="glyphicon glyphicon-remove" style="color:red"></span></asp:LinkButton>
                    </ItemTemplate> 
                </asp:TemplateField>
                </Columns>
                </asp:GridView>
            </td>
            </tr>         
        </table>

     <table id="t_form" align="center" runat="server" border="0" cellpadding="0" cellspacing="0" width="90%">
            <tr style="height: 30px;">
                <td align="right">Código Centro:&nbsp;</td>
                <td><asp:TextBox ID="CodCentro" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator2" ControlToValidate="CodCentro"  ErrorMessage="* Obligatorio" runat="server"/></td>
                <td align="right">Descripción:&nbsp;</td>
                <td align="left"><asp:TextBox ID="Descripcion" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr><td colspan="4">&nbsp;</td></tr>
            <tr style="height: 30px;">
                <td align="right">&nbsp;Tipo de Centro:&nbsp;</td>
                <td><asp:DropDownList ID="DDTipoCentro" runat="server"></asp:DropDownList></td>
                <td align="right"></td>
                <td align="left"></td>
            </tr>
            <tr><td colspan="4">&nbsp;</td></tr>
            <tr style="height: 50px; background-color:#DBDBDB" >
                <td align="right"></td>
                <td align="center"><asp:Button ID="btn_Guardar" runat="server" Text="Guardar" OnClick="Guardar_click" class="btn btn-success"/></td>
                <td></td>
                <td><asp:Button ID="btn_Cancelar" runat="server" Text="Cancelar" CausesValidation="false" onclick="Cancelar_Click" class="btn btn-primary"/></td>
            </tr>
    </table>
</asp:Content>