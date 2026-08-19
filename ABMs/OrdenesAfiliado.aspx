<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdenesAfiliado.aspx.cs" Inherits="A.OrdenesAfiliado" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<style type="text/css">
    .style1{width:  335px;}
    .style2{height: 30px;}
    .style3{width: 335px; height: 30px;}
    .style4{}
    .style5{width: 230px; height: 30px;}
    #T_Cabecera{height: 40px;}
</style>
 <script type="text/javascript">
     $(document).ready(function() {
     $('#MainContent_vista_grilla_principal').DataTable({
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
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:chocolate"></span> <span class="glyphicon glyphicon-list" style="font-size: 25px; color:chocolate"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label></h2>
    <hr style="border-color:#CCC;"/>
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>
    <asp:Label ID="IdAfiliadoT" runat="server" Visible="true"></asp:Label>
    <asp:Label ID="accion" runat="server" Visible="false"></asp:Label>
    <table id="t_grilla_principal_ordenes" runat="server"  width="100%" border="0" cellpadding="0" cellspacing="0">
           <tr>
            <td align="center"><h4>AFILIADO:   <asp:Label ID="lbl_NombreAfiliado" runat="server" ></asp:Label></h4>
            </td>
           </tr>
           <tr>
            <td> 
                 <table id="Table1" runat="server" width="100%">
                    <tr>
                        <td>
                            <asp:Button ID="btn_Volver" runat="server"  Text="<< Volver" Width="105px" OnClick="f_volver"  CssClass="btn btn-info"/>
                        </td>
                        <td  align="right">
                          <asp:Button Enabled="<%# AMET.PermisoOperador()%>" ID="Button2" runat="server" Text="> Orden Predim <" OnClick="f_agregar_nuevo"  CssClass="btn btn-success"/>
                          <asp:Button Enabled="<%# AMET.PermisoOperador()%>" ID="Button3" runat="server" Text="> Otra Orden <" OnClick="f_agregar_otros"  CssClass="btn btn-primary"/>
                          <asp:Button Enabled="<%# AMET.PermisoOperador()%>" ID="Button5" runat="server" Text="> Devolución <" OnClick="f_agregar_devolucion"  CssClass="btn btn-dark"/>
                          <asp:Button Enabled="<%# AMET.PermisoOperador()%>" ID="Button14" runat="server" Text="<< Cancelar Saldo >>" OnClick="f_agregar_saldo" CssClass="btn btn-danger" />
                        </td>
                    </tr> 
                  </table>
             </td>
            </tr>
            <tr><td>
            <hr>
            Listado de Ordenes </td>
            </tr>
            <tr>
            <td>
                <asp:GridView ID="vista_grilla_principal"  runat="server" OnRowDataBound="gview_RowDatabound" 
                    OnPageIndexChanging="gview_PageIndexChanging" AutoGenerateColumns="False"
                OnRowDeleting="f_eliminar_fila"  OnRowCommand="gview_RowCommand" class="table table-striped table-bordered">
                <AlternatingRowStyle BackColor="White" />      
                <Columns>
                 <asp:TemplateField HeaderText="#">     
                <ItemTemplate>                
                <asp:Label id="Num" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>                
                 <asp:TemplateField HeaderText="ID" Visible="true">     
                <ItemTemplate>                
                <asp:Label id="ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID")%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nro Orden">
                <ItemTemplate>
                       <asp:LinkButton ID="Mostrar" runat="server" CommandName="Mostrar" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>' >
                <asp:Label id="NumOrden" align="center" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NumOrden")%>'></asp:Label>	
                     </asp:LinkButton>
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Capital">
                <ItemTemplate>
                $ <asp:Label id="importeT" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ImporteT")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Monto">
                <ItemTemplate>
                $ <asp:Label id="Monto" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "monto")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Cuotas">
                <ItemTemplate>
                <asp:Label id="cuota_cant" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CuotaCant")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Monto Cuota">
                <ItemTemplate>
                $ <asp:Label id="cuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Cuota")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comercio">
                <ItemTemplate>
                <asp:Label id="NomComercio" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NomComercio")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Inicio de Cobro">   
                <ItemTemplate>
                <asp:Label id="FechaInicio" runat="server" Text='<%# Bind("FI", "{0:d}") %>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fin de Cobro">   
                <ItemTemplate>
                <asp:Label id="FechaVencimiento" runat="server" Text='<%# Bind("FV", "{0:d}") %>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Estado">
                <ItemTemplate>
                <asp:Label id="estado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Estado")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton Visible="<%# AMET.PermisoOperador()%>" ID="lnkRemove" runat="server" CommandName="Delete" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>' 
                         OnClientClick = "return confirm('¿Está seguro que quiere eliminar esta Orden?')" ToolTip="Eliminar">
                        <span class="glyphicon glyphicon-remove" style="color:red"></span></asp:LinkButton>
                    </ItemTemplate> 
                </asp:TemplateField>
                </Columns>
                </asp:GridView>
            </td>
            </tr> 
            <tr> 
                <td  align="right"></td>        
                <td><asp:Label ID="lbl_msj_ordenes" runat="server" ></asp:Label></td>
            </tr>         
            <tr>
                <td></td>
            </tr> 
</table>

 <table id="t_grilla_ordenes_cancelar" runat="server"  width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr><td>
            <br/>
            Listado de Ordenes A Cancelar Saldo</td>
            </tr>
            <tr>
            <td>
                <asp:GridView ID="GridView_ordenes_cancelar"  runat="server" CellPadding="4" 
                    Width="910px" ForeColor="#333333" GridLines="None"
                OnRowDataBound="gview_RowDatabound" 
                    OnPageIndexChanging="gview_PageIndexChanging" AutoGenerateColumns="False"
                OnRowDeleting="f_eliminar_cancelar_saldo"  PageSize="10" Font-Size="Small"    >
                <AlternatingRowStyle BackColor="White" />      
                <Columns>
                 <asp:TemplateField HeaderText="#">     
                <ItemTemplate>                
                <asp:Label id="Num" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>                
                 <asp:TemplateField HeaderText="ID" Visible="false">     
                <ItemTemplate>                
                <asp:Label id="ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID")%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nro Orden">
                <ItemTemplate>
                <asp:Label id="numorden" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "num_orden")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Inicio de Cobro">   
                <ItemTemplate>
                <asp:Label id="FechaInicio" runat="server" Text='<%# Bind("Fi", "{0:d}") %>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fin de Cobro">   
                <ItemTemplate>
                <asp:Label id="FechaVencimiento" runat="server" Text='<%# Bind("fv", "{0:d}") %>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Importe Cuota">
                <ItemTemplate>
                $ <asp:Label id="ImporteTotal" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cuota")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Inicio Cancelación" Visible="False">
                <ItemTemplate>
                <asp:Label id="periodo" runat="server" Text='<%# Bind("periodo", "{0:d}") %>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Cuotas Adeuadas">
                <ItemTemplate>
                <asp:Label id="CantCuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cc_cuota")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Monto Deuda">
                <ItemTemplate>
                $ <asp:Label id="Cuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "deuda")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton Visible="<%# AMET.PermisoOperador()%>" ID="lnkRemove" runat="server" CommandName="Delete" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>' 
                         OnClientClick = "return confirm('¿Está seguro que quiere sacar esta Orden?')">
                        <asp:Image ID="I_EliminarCom" ImageUrl="~/img/del.png" runat="server" ToolTip="Eliminar" /></asp:LinkButton>
                    </ItemTemplate> 
                </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" BorderStyle="None" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
            </tr> 
            <tr>
            <td><br>
            </td> 
            </tr> 
            <tr>
            <td align="center">
            <hr />
                <table id="Table2" runat="server" width="50%"   >
                 <tr>
                 <td>
                 Total Deuda: <asp:TextBox ID="txt_total_deuda" runat="server" Width="80px" ReadOnly="True" ></asp:TextBox>
                 </td>
                 <td  align="right">
                 Total Deuda a cancelar: <asp:TextBox ID="txt_total_cancelar" runat="server" Width="80px"  ></asp:TextBox>
                 </td>
                 </tr>
                 <tr>
                 <td>
                 <hr />
                 <asp:Button ID="Button9" runat="server" Text="<< Cancelar" CausesValidation="false" onclick="Cancelar_Click" CssClass="btn btn-info"/>
                 </td>
                 <td  align="right">
                 <hr />
                 <asp:Button ID="Button10" runat="server" Text="> Confirmar Cancelar Saldo <"   OnClick="GuardarOrden_cancelar_click" CssClass="btn btn-success"/>
                 </td>
                 </tr> 
                 </table>
            </td>
            </tr>         
</table>

<table id="t_grilla_Novedades" runat="server"  width="100%" border="0" cellpadding="0" cellspacing="0">
           <tr>
            <td align="left"> 
             <br />
             <br />
             <br />
             Historal de Novedades
             </td>
            </tr>
            <tr>
            <td><br />
                <asp:GridView ID="vista_grilla_Novedades"  runat="server" CellPadding="4" Width="910px" 
                    ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Font-Size="Small"   >
                <AlternatingRowStyle BackColor="White" />      
                <Columns>
                
                <asp:TemplateField HeaderText="Padrón">   
                <ItemTemplate>
                <asp:Label id="Padron" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Padron")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha Novedad">   
                <ItemTemplate>
                <asp:Label id="Fecha" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "mes")%>'></asp:Label>	
                -  <asp:Label id="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ano")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cuota">
                <ItemTemplate>
                $ <asp:Label id="Cuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CuotasTotal")%>'></asp:Label>	
                </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Saldo">
                <ItemTemplate>
                $ <asp:Label id="Saldo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SaldoAnterior")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Deuda">
                <ItemTemplate>
                $ <asp:Label id="Deuda" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Total")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pedido">
                <ItemTemplate>
                $ <asp:Label id="Pedido" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MontoPedido")%>' ></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Recuperado">
                <ItemTemplate>
                $ <asp:Label id="Recuperado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MontoRecuperado")%>' Font-Bold="True" ForeColor="#FF6666"></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Observaciones">
                <ItemTemplate>
                <asp:Label id="Observaciones" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Observaciones")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField> 
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" BorderStyle="None" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
            </tr>         
            <tr>         
                <td><asp:Label ID="lbl_msj_novedades" runat="server" ></asp:Label></td>
            </tr>       
    </table>

    <table id="t_grilla_proyecciones" runat="server"  width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr><td>
        </br>
        <h3>Proyecciones</h3>
            </td>
            </tr>
            <tr>
            <td>
                <asp:GridView ID="gview_proyeccion"  runat="server"   CellPadding="4" 
                    Width="550px" ForeColor="#333333" GridLines="None"
                     AutoGenerateColumns="False"
                     Font-Size="Small" >
                <AlternatingRowStyle BackColor="White" />      
                <Columns>
                 <asp:TemplateField HeaderText="#">     
                <ItemTemplate>                
                <asp:Label id="Num" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>     
               <asp:TemplateField HeaderText="Periodo">
                <ItemTemplate>
                <asp:Label id="mes" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "mes")%>'></asp:Label>	
                /
                <asp:Label id="año" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "año")%>'></asp:Label>
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total">   
                <ItemTemplate>
                $ <asp:Label id="total" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "total") %>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ordenes Activas">
                <ItemTemplate>
                <asp:Label id="ordenes" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ordenes")%>' Font-Bold="True"></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" BorderStyle="None" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
            </tr>      
    <tr>
        <td align = 'center'>
         <h3>&nbsp;  <asp:Label ID="total_mes1" runat="server"></asp:Label></h3></td>
    </tr>  
     <tr>
        <td align = 'center'>&nbsp;</td>
     </tr> 
     <tr>
         <td>&nbsp;</td>
     </tr>        
     <tr>
        <td align = 'center'>&nbsp;</td>
     </tr> 
</table>

<table id="t_form_predim" align="left" runat="server" border="0" cellpadding="0" cellspacing="0" >
<tr style="height: 30px;">
    <td align="right">Comercio:</td>
    <td></td>
     <td class="style1">
                    <asp:DropDownList ID="DDComercio" runat="server" Height="22px" Width="201px" 
                       AutoPostBack = "true"  >  </asp:DropDownList>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Autorizado: </td>
    <td>&nbsp;</td><td align="left"       class="style1">
    <asp:DropDownList ID="DDAutorizado" runat="server" Height="17px" Width="330px">  </asp:DropDownList>
    </td>
</tr>   
<tr style="height: 30px;">
  <td align="right">Capital</td><td>&nbsp;</td>
  <td align="left" class="style1">
            <asp:DropDownList ID="DDMonto" runat="server" AutoPostBack = "true"
                         OnSelectedIndexChanged="DDMonto_SelectedIndexChanged">
            <asp:ListItem Text = "--Seleccione Capital --" Value = ""></asp:ListItem>
            </asp:DropDownList>
            &nbsp;</td>
</tr>
<tr style="height: 30px;">
    <td align="right">Cantidad Cuotas:</td><td>&nbsp;</td>
    <td align="left"  class="style1">
        <asp:DropDownList ID="DDCantCuota" runat="server" AutoPostBack = "true"
    Enabled = "false"  OnSelectedIndexChanged="DDCCuotas_SelectedIndexChanged">
    <asp:ListItem Text = "--Seleccione Cantidad de Cuotas --" Value = ""></asp:ListItem>
    </asp:DropDownList>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Cuota:</td>
    <td></td>
    <td align="left" class="style1">
        <asp:DropDownList ID="DDCuota" runat="server" AutoPostBack = "true"
     Enabled = "false" OnSelectedIndexChanged="DDCuota_SelectedIndexChanged">
    <asp:ListItem Text = "-- Monto Cuota --" Value = ""></asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator id="RField_cuota" ControlToValidate="txt_control" ErrorMessage="* Obligatorio" runat="server"/>  &nbsp;
    </td>
</tr>     
<tr style="height: 30px;"><td align="right">&nbsp;</td><td>&nbsp;</td>
    <td class="style1">                      
       <asp:TextBox ID="txt_control" runat="server" Width="100%" Enabled="False" ReadOnly="True"></asp:TextBox>
    </td>
</tr>
<tr style="height: 30px;"><td align="right">Fecha Inicio de Cobro:</td><td></td>
    <td class="style1">
                <asp:DropDownList ID="DDFecha" runat="server" Height="19px" Width="320px">  </asp:DropDownList>
     </td>
</tr>
<tr style="height: 30px;"><td align="right">Firmante:</td><td></td>
    <td class="style1">
                <asp:DropDownList ID="DDFirmante" runat="server" Height="19px" Width="320px">  </asp:DropDownList>
     </td>
</tr>
<tr style="height: 30px;"><td align="right">Observaciones: </td><td></td>
    <td class="style1"><asp:TextBox ID="Observaciones" runat="server" Height="38px" Width="414px"></asp:TextBox></td>
</tr>
<tr style="height: 30px;">
    <td></td>
    <td></td>
    <td></td>
</tr>             
<tr style="height: 30px; background-color:#DBDBDB">
    <td align="center" class="style1" colspan="3">
    <asp:Button ID="btn_Cancelar" runat="server" Text="<< Cancelar" CausesValidation="false" onclick="Cancelar_Click" CssClass="btn btn-info"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <asp:Button ID="btn_GuardarOrden" runat="server" Text="> Guardar <" OnClick="GuardarOrden_click" CssClass="btn btn-success"/>
    </td> 
</tr>  
</table>
<br />

<table id="t_form_comercio" align="left" runat="server" border="0" cellpadding="0" cellspacing="0" >
<tr style="height: 30px;">
<td align="right">Comercio:</td>
<td></td>
    <td class="style1">
        <asp:DropDownList ID="DDComercio2" runat="server" Height="22px" Width="201px" AutoPostBack = "true"></asp:DropDownList>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Autorizado: </td><td>&nbsp;</td>
    <td align="left" class="style1">
        <asp:DropDownList ID="DDAutorizado2" runat="server" Height="17px" Width="330px">  </asp:DropDownList>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Capital</td>
    <td>&nbsp;</td>
    <td align="left" class="style1">
        &nbsp;<asp:TextBox ID="txt_Monto02" runat="server" Width="68px" ></asp:TextBox>
        <asp:RequiredFieldValidator id="RequiredFieldValidator1" ControlToValidate="txt_control" ErrorMessage="* Obligatorio" runat="server"/> 
     </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Cantidad Cuotas:</td>
    <td>&nbsp;</td><td align="left" class="style1">
                <asp:DropDownList ID="DDCCuotas02" runat="server">
                    <asp:ListItem Selected="True">1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
      </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Cuota:</td>
    <td></td><td align="left" class="style1">
        <asp:TextBox ID="txt_Cuota02" runat="server" Width="68px" ReadOnly="True" ></asp:TextBox>
        &nbsp;
        <asp:Button ID="btn_GuardarOrden3" runat="server" Text="< Calcular Cuota >" OnClick="btn_Cuota_calcular2_Click" CssClass="btn btn-success"/>
    </td>
</tr>         
<tr style="height: 30px;">
    <td align="right">&nbsp;</td><td>&nbsp;</td>
    <td class="style1">                               
        <asp:TextBox ID="txt_control2" runat="server" Width="100%" Enabled="False" ReadOnly="True"></asp:TextBox>
    </td>
</tr>
<tr style="height: 30px;"><td align="right">Fecha Inicio de Cobro:</td><td></td>
    <td class="style1">
                <asp:DropDownList ID="DDfecha2" runat="server" Height="19px" Width="320px">  </asp:DropDownList>
    </td>
</tr>
<tr style="height: 30px;"><td align="right">Firmante:</td><td></td>
    <td class="style1">
                <asp:DropDownList ID="DDFirmante2" runat="server" Height="19px" Width="320px" 
                    >  </asp:DropDownList>
    </td>
</tr>
<tr style="height: 30px;"><td align="right">Observaciones: </td><td></td>
    <td class="style1" >
    <asp:TextBox ID="txtObservaciones2" runat="server" Height="38px" Width="414px"></asp:TextBox></td>
</tr>

<tr style="height: 30px;">
    <td></td>
    <td></td>
    <td></td>
</tr>             
<tr style="height: 30px; background-color:#DBDBDB">
    <td align="center" class="style1" colspan="3">
    <asp:Button ID="Button4" runat="server" Text="<< Cancelar" CausesValidation="false" onclick="Cancelar_Click" CssClass="btn btn-info"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button  ID="btn_GuardarOrden02" runat="server" Text="> Guardar <" OnClick="GuardarOrden02_Click" EnableTheming="True" Visible="False" CssClass="btn btn-success"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td> 
</tr>
</table>

<table id="t_form_devol" align="left" runat="server" border="0" cellpadding="0" cellspacing="0" >
<tr style="height: 30px;">
    <td align="right">Orden:</td>
    <td></td>
    <td class="style1">
        <asp:DropDownList ID="DDComercio3" runat="server" Height="22px" Width="201px" AutoPostBack="true"></asp:DropDownList>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Monto: </td>
    <td>&nbsp;</td>
    <td align="left" class="style1">
        &nbsp;<asp:TextBox ID="txt_monto03" runat="server" Width="68px" ></asp:TextBox>
        <asp:RequiredFieldValidator id="RequiredFieldValidator2" ControlToValidate="txt_control" ErrorMessage="* Obligatorio" runat="server"/>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Cantidad Cuotas:</td>
    <td>&nbsp;</td>
    <td align="left" class="style1">
        <asp:DropDownList ID="DDCCuotas03" runat="server">
            <asp:ListItem Selected="True">1</asp:ListItem>
        </asp:DropDownList>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Periodo:</td>
    <td></td>
    <td class="style1">
        <asp:DropDownList ID="DDfecha3" runat="server" Height="19px" Width="320px"></asp:DropDownList>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Firmante:</td>
    <td></td>
    <td class="style1">
        <asp:DropDownList ID="DDFirmante3" runat="server" Height="19px" Width="320px"></asp:DropDownList>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Observaciones: </td>
    <td></td>
    <td class="style1">
        <asp:TextBox ID="txt_Observaciones3" runat="server" Height="38px" Width="414px"></asp:TextBox>
    </td>
</tr>
<tr style="height: 30px;">
    <td></td>
    <td></td>
    <td class="style1"></td>
</tr>             
<tr style="height: 30px; background-color:#DBDBDB">
    <td align="center" class="style1" colspan="3">
        <asp:Button ID="Button6" runat="server" Text="<< Cancelar" CausesValidation="false" onclick="Cancelar_Click" CssClass="btn btn-info"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
        ID="Button7" runat="server" Text="< Generar Devolución >" OnClick="GuardarOrden03_Click" EnableTheming="True" CssClass="btn btn-success"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td> 
</tr>
</table>
<table id="t_form_muestra" align="left" runat="server" border="0" cellpadding="0" cellspacing="0" >
<tr style="height: 30px;">
    <td align="right">Afiliado:</td>
    <td></td>
    <td class="style4" colspan="2">
        <asp:TextBox ID="txt_Afiliado" runat="server" Width="270px" Enabled="False" ></asp:TextBox>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">DNI:</td>
    <td>&nbsp;</td>
    <td class="style4">
        <asp:TextBox ID="txt_dni" runat="server" Width="110px" Enabled="False"></asp:TextBox>
    </td>
    <td class="style1">&nbsp;</td>
</tr>
<tr style="height: 30px;">
    <td align="right">Comercio:</td>
    <td></td>
    <td class="style4">
        <asp:TextBox ID="txt_comercio" runat="server" Width="201px" Enabled="False"></asp:TextBox>
    </td>
    <td class="style1"></td>
</tr>
<tr style="height: 30px;">
    <td align="right">&nbsp;Número Orden: </td>
    <td>&nbsp;</td>
    <td align="left" class="style4">
        <asp:TextBox ID="txt_numero" runat="server" Width="110px" Enabled="False"></asp:TextBox>&nbsp;
    </td>
    <td align="left" class="style1">
        Padron: <asp:TextBox ID="txt_padron" runat="server" Width="110px" Enabled="False"></asp:TextBox>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Autorizado: </td>
    <td>&nbsp;</td>
    <td align="left" class="style4" colspan="2">
        <asp:TextBox ID="txt_Autorizado" runat="server" Width="270px" Enabled="False"></asp:TextBox>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Monto Total: $</td>
    <td></td>
    <td align="left" class="style4">                
        <asp:TextBox ID="txt_importe" runat="server" Width="145px" Enabled="False"></asp:TextBox>
    </td>
    <td align="left" class="style1">
        Cuota: $ <asp:TextBox ID="txt_Mcuotas" runat="server" Width="68px" Enabled="False"></asp:TextBox>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Cantidad Cuotas:</td>
    <td></td>
    <td class="style4">
        <asp:TextBox ID="txt_cuotas" runat="server" Width="68px" Enabled="False"></asp:TextBox>
    </td>
    <td class="style1">
        &nbsp;Inicio Cobro:<asp:TextBox ID="txt_fechaAlta" runat="server" Width="84px" Enabled="False"></asp:TextBox>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Fecha Creacion&nbsp; </td><td>&nbsp;</td>
    <td class="style4" >
         <asp:TextBox ID="txt_fechaCreacion" runat="server" Width="84px" Enabled="False"></asp:TextBox>
    </td>
    <td class="style1" >
        Fin de Cobro <asp:TextBox ID="txt_fechaBaja" runat="server" Width="84px" Enabled="False" ></asp:TextBox>
    </td>
</tr>
<tr style="height: 30px;">
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
</tr>
<tr style="height: 30px;"><td align="right">Firmante:</td><td></td>
    <td class="style4" colspan="2">
        <asp:TextBox ID="txt_firmante" runat="server" Width="289px" Enabled="False"></asp:TextBox>
    </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Observaciones: </td>
    <td></td>
    <td class="style4" colspan="2">
        <asp:TextBox ID="Txt_observa" runat="server" Height="29px" Width="414px"></asp:TextBox>
    </td>
</tr>
<tr>
    <td class="style2" > </td>
    <td class="style2"></td>
    <td class="style5"></td>
    <td class="style3">&nbsp;</td>
</tr>             
<tr style="height: 30px; background-color:#DBDBDB">
    <td align="right"></td>
    <td></td>
    <td align="center" class="style4" colspan="2">
        <asp:Button ID="Button1" runat="server" Text="<< Aceptar" CausesValidation="false" onclick="Cancelar_Click" CssClass="btn btn-info"/>&nbsp;&nbsp;&nbsp;
    </td> 
</tr>
</table>
<br />
</asp:Content>