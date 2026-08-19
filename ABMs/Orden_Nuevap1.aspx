<%@ Page Title="Nueva Orden" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orden_Nuevap1.aspx.cs" Inherits="A.Orden_Nuevap1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .auto-style1 {
            width: 137px;
        }
        .auto-style2 {
            width: 40px;
        }
        .auto-style3 {
            width: 300px;
        }
    </style>

</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:chocolate"></span> <span class="glyphicon glyphicon-list" style="font-size: 25px; color:chocolate"></span>&nbsp;&nbsp;
        <asp:Label ID="Titulo" runat="server"></asp:Label>
     <center><asp:Image ID="Image1" runat="server" ImageUrl="~/img/Wizar_Nueva_orden_paso1.png" /></center>
    </h2>
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>
    
    <hr />
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
    document.onkeyup = KeyCheck;
    function KeyCheck(e) {
        var KeyID = (window.event) ? event.keyCode : e.keyCode;
        if (KeyID == 35) {
            document.getElementById('MainContent_btn_Volver').click();
        }
        if (KeyID == 36) {
            window.location.href = "Ordenes.aspx";
        }
    }
</script>
    <table id="t_form" align="left" runat="server" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr style=" background-color: #DBDBDB"><td colspan="6">&nbsp;&nbsp;&nbsp; <strong> Datos de Filtro</strong></td></tr>
        <tr style="height: 10px;"><td>&nbsp;</td><td></td><td></td></tr>
    </table>
    
    <asp:Label ID="IdPersonaT" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="IdAfiliadoT" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="accion" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="accioncoseguro" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="parametro" runat="server" Visible="false"></asp:Label>
    <table id="t_grilla" runat="server" width="90%" border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
               <table id="Table1" runat="server" width="100%" bgcolor="#EBEBEB" border="0">
                    <tr>
                        <td colspan="2" align="left"><strong>Buscar por:</strong></td> 
                        <td height="30" colspan="3" align="right" bgcolor="#FFFFFF">
                            &nbsp;</td>
                    </tr>
                    <tr> <td height="5" colspan="5" align="left"></td></tr>
                    <tr> 
                          <td class="auto-style3"></td>                          
                          <td width="50" height="30">Padron:&nbsp;</td>
                          <td class="auto-style1"><asp:TextBox ID="Padron" runat="server"></asp:TextBox></td>
                          <td width="50" height="30">&nbsp;&nbsp;Nombre:&nbsp;</td> 
                          <td><asp:TextBox ID="NombreB" runat="server"></asp:TextBox>
                          
                         </td>
                         <td></td>
                    </tr> 
                    <tr> 
                     <td class="auto-style3" >
                         <asp:Button ID="btn_Volver" runat="server"   Text="<< Volver"  OnClick="volver_p1"  CssClass="btn btn-info" Width="135px"/>
                     </td>
                     <td width="50" height="30">DNI: </td>
                     <td class="auto-style1"><asp:TextBox ID="DocumentoB" runat="server"></asp:TextBox>
                     </td>
                      <td width="50" height="30">&nbsp;&nbsp;Apellido:&nbsp;</td> 
                      <td><asp:TextBox ID="ApellidoB" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="bt_buscar" runat="server" OnClick="Buscar_Click" Text="Buscar Padrón-Afiliado" class="btn btn-primary" /></td>
                      <td></td>
                    </tr> 
                    <tr>
                        <td class="auto-style3"></td>
                        <td height="30" class="auto-style2"></td>
                        <td align="left" class="auto-style1">
                             <asp:DropDownList ID="DDEstado" runat="server" Visible="false">
                                <asp:ListItem Value="Activo">Activo</asp:ListItem>
                             </asp:DropDownList>
                        </td>
                        <td colspan="3"> </td>
                    </tr>                      
                </table>
                <hr />
            </td>
        </tr>
        <tr><td></td></tr>
        <tr>
            <td>
                <asp:GridView ID="gview" runat="server" OnRowDataBound="gview_RowDatabound" OnPageIndexChanging="gview_PageIndexChanging"
                   OnRowCommand="gview_RowCommand"  AutoGenerateColumns="False" class="table table-striped table-bordered">
                    <AlternatingRowStyle BackColor="White" />
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
                        <asp:TemplateField HeaderText="IdAfiliado" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="IdAfiliado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "IdAfiliado")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Padrón">
                            <ItemTemplate>
                                <asp:Label ID="Padron" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Padron")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label ID="Nombre" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Nombre")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Documento">
                            <ItemTemplate>
                                <asp:Label ID="Documento" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Documento")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Género">
                            <ItemTemplate>
                                <asp:Label ID="Sexo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Sexo")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Coseguro">
                            <ItemTemplate>
                                <asp:Label ID="Coseguro" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Coseguro")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado">
                            <ItemTemplate>
                                <asp:Label ID="Estado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Estado")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField   ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                    <asp:Button ID="Ordenes" Visible="<%# AMET.PermisoOperador()%>" runat="server" Text="Seleccionar >>" class="btn btn-warning" CommandName="Ordenes" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "IdAfiliado")%>'   />
                            </ItemTemplate> 
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>