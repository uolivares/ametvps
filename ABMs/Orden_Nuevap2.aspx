<%@ Page Title="Nueva Orden" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orden_Nuevap2.aspx.cs" Inherits="A.Orden_Nuevap2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

<style type="text/css">
    .style1{width:  335px;}
    .style2{height: 30px;}
    .style3{width: 335px; height: 30px;}
    .style4{}
    .style5{width: 230px; height: 30px;}
    #T_Cabecera{height: 40px;}
    .auto-style1 {
        color: #FF0000;
    }
    .auto-style2 {
        width: 243px;
        height: -42px;
        margin-left: 0px;
    }
    .auto-style5 {
        color: #000000;
    }
    .auto-style6 {
        width: 212px;
    }
    .auto-style7 {
        width: 775px;
    }
    .auto-style8 {
        width: 472px;
    }
    .auto-style9 {
        height: 84px;
    }
</style>

   <script type="text/javascript">
       'use strict'
       function GetSelected(rb,id) {        
           var isChecked = rb.checked;
           if (isChecked)
               console.log(id);
           else
               console.log(rb.DeudaReal);
       }

      <%-- function UpdateTime(time) {
           document.getElementById("<%=lblTime.ClientID %>").innerHTML = time;
        }--%>


   </script>

 <script type="text/javascript">
     $(document).ready(function () {
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


<script type="text/javascript">
    function SelectAllRows(chk) {
        var gridView = document.getElementById('<%= GridView_ordenes_cancelar.ClientID %>');
        var checkBoxes = gridView.getElementsByTagName("input");
        for (var i = 0; i < checkBoxes.length; i++) {
            if (checkBoxes[i].type === "checkbox" && checkBoxes[i] !== chk) {
                checkBoxes[i].checked = chk.checked;
            }
        }
    }
</script>



<script type="text/javascript">
    function ValidacionesCancelacion() {

        let DeudaRealIngresada = document.getElementById('<%= txt_total_deuda.ClientID %>').value;        
        let DeudaReal = parseFloat(DeudaRealIngresada.replace(",", ".")).toFixed(2);        
        //var DeudaCancela = parseFloat(document.getElementById('<%= txt_total_cancelar.ClientID %>').value);
        let DeudaCancelaIngresada = document.getElementById('<%= txt_total_cancelar.ClientID %>').value; 
        let DeudaCancela = parseFloat(DeudaCancelaIngresada.replace(",", ".")).toFixed(2); 
        let Diferencia = DeudaReal - DeudaCancela
        //alert('Deuda real' + DeudaReal);
        //alert('Deuda cancela' + DeudaCancela);
        //alert('Diferencia: ' + Diferencia);

        //if (DeudaCancela > DeudaReal) 
    if (Diferencia < 0)
        {
            alert('El Total de Deuda a Cancelar ingresado, no puede superar el valor del Total de la Deuda, por favor verifique el valor ingresado...')
            return false;
        }
        if (Diferencia > 0) {

            return confirm('Se generará una Orden de Bonificación por el valor de $' + parseFloat(DeudaReal - DeudaCancela).toFixed(2) + ', ¿Desea Continuar ? ');
        }
    }       
</script>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:chocolate"></span> <span class="glyphicon glyphicon-list" style="font-size: 25px; color:chocolate"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label> </h2>
     <center><asp:Image ID="Imagen_wizard" ImageAlign="Top" runat="server" /></center>
    <hr/>
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>
    <asp:Label ID="IdAfiliadoT" runat="server" Visible="true"></asp:Label>
    <asp:Label ID="accion" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="Lab_IdOrden" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="Lab_Usuario_nombre" runat="server" Visible="false"></asp:Label>
    <div class="row">
    <table id="t_grilla_principal_ordenes" runat="server"  width="100%" border="0" cellpadding="0" cellspacing="0" align="center" visible="false">
           <tr>
            <td align="center" class="auto-style1"><h4><% //si tiene valor se muestra el Afiliado %>  <asp:Label ID="lbl_NombreAfiliado" runat="server" CssClass="auto-style5" ></asp:Label></h4>
            </td>
           </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btn_Volver" runat="server"  Text="<< Volver"  OnClick="volver_p1"  CssClass="btn btn-primary" Width="135px"/>&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Tipo de Orden:"></asp:Label>&nbsp;&nbsp;
                <asp:DropDownList ID="DDTipoDeOrden" runat="server" Height="22px" Width="201px"></asp:DropDownList>&nbsp;&nbsp;
                <asp:Button ID="Btn_Nuevo0" runat="server" Text="Siguiente >>" OnClick="Nueva_Orden" CssClass="btn btn-primary" Width="135px" />
            </td>
           </tr>
           <tr>
            <td> 
                 <table id="Table1" runat="server" width="100%">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td  align="right">
                             <%--<asp:Button Enabled="<%# AMET.PermisoOperador()%>" ID="Button5" runat="server" Text="> Devolución <" OnClick="f_agregar_devolucion"  CssClass="btn btn-dark"/>--%>
                        </td>
                    </tr> 
                  </table>
             </td>
            </tr>
            <tr><td>
            <hr>
             </td>
            </tr>
            <tr>
            <td align="center">
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
                <asp:TemplateField HeaderText="Nro Orden">
                <ItemTemplate>                       
                <asp:Label id="NumOrden" align="center" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NumOrden")%>'></asp:Label>	                   
                </ItemTemplate>  
                </asp:TemplateField>
              
                 <asp:TemplateField HeaderText="Padrón">
                <ItemTemplate>
                <asp:Label id="padron" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Padron")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="DNI">
                <ItemTemplate>
                <asp:Label id="dni" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Documento")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Apellido y Nombre">
                <ItemTemplate>
                <asp:Label id="nombre" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Nombre")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Capital">
                <ItemTemplate>
                $ <asp:Label id="importeT" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ImporteT")%>'></asp:Label>	
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
            <tr><td class="auto-style9">
            <br/>
            Listado de Ordenes 
                a Cancelar:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:Button ID="Button11" runat="server" Text="Quitar Ordenes seleccionadas del Listado" OnClick="Button_Quitar_elementos" CssClass="btn btn-primary" Width="295px"/>
                </td>
               
                
            </tr>
            <tr>
            <td>
                <asp:GridView ID="GridView_ordenes_cancelar" SelectionMode="Multiple" runat="server" CellPadding="4" Width="910px" ForeColor="#333333" GridLines="None"
                OnRowDataBound="gview_Cancela_RowDatabound" OnPageIndexChanging="gview_PageIndexChanging" AutoGenerateColumns="False"
                OnRowDeleting="f_eliminar_cancelar_saldo"  PageSize="10" Font-Size="Small" OnRowCommand="gview_RowCommand" OnRowUpdating="f_Cancelacion_mes_siguiente" class="table table-striped table-bordered"  >
                <AlternatingRowStyle BackColor="White" />                                   

                <Columns>

                  <%--  <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:CheckBox ID="CheckBoxSelectAll" runat="server" onclick="SelectAllRows(this)" />
                        </HeaderTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    
                        <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                    </asp:TemplateField>   --%> 

        <asp:TemplateField>
            <HeaderTemplate>
                <asp:CheckBox ID="CheckBoxSelectAll" runat="server" onclick="SelectAllRows(this)" />
            </HeaderTemplate>
            <ItemTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>

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

                <asp:TemplateField HeaderText="Tipo">
                    <ItemTemplate>
                        <asp:Label id="Tipo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Tipo")%>'></asp:Label>	
                    </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Nro Orden">
                    <ItemTemplate>
                        <asp:Label id="numorden" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Numorden")%>'></asp:Label>	
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
                        <asp:Label id="ImporteTotal" runat="server" Width="90" Text='<%# String.Format("${0:00.00}", DataBinder.Eval(Container.DataItem, "cuota"))%>'></asp:Label>                        
                    </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Periodo Cancelación" Visible="true">
                    <ItemTemplate>
                        <asp:Label id="periodo" runat="server" Text='<%# Bind("periodo", "{0:d}") %>'></asp:Label>	
                    </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cuotas Adeuadas">
                    <ItemTemplate>
                        <asp:Label id="CantCuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cccuota")%>'></asp:Label>	
                    </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Monto Deuda">
                    <ItemTemplate>
                        <asp:Label id="Cuota" runat="server" Width="90" Text='<%# String.Format("${0:00.00}", DataBinder.Eval(Container.DataItem,"deuda"))%>'></asp:Label>	
                    </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Tipo de Cancelación ">
                    <ItemTemplate> 
                        <center>
                          <asp:Label id="IniciaMesSiguiente" runat="server" Text='<%# ((Boolean)Eval("IniciaMesSiguiente")? "Cancela Mes Siguiente":"Cancelación Normal")   %>' Width="150"></asp:Label> 
                        </center>
                     </ItemTemplate> 
                </asp:TemplateField> 

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton Visible='<%# (((string)Eval("Tipo")=="ORDEN") && ((int)Eval("cccuota")!=1)? true : false) %>' ID="MesSiguiente" runat="server" CommandName="MesSiguiente" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>' 
                            OnClientClick = "return confirm('¿Está seguro que quiere cambiar el tipo de Cancelación?')" ToolTip="Cambia tipo de Cancelación: Normal / Cancela Mes Siguiente" >  
                                    
                        <span class="glyphicon glyphicon-refresh" style="color:dodgerblue"></span>         
                        </asp:LinkButton>
                    <%--    <asp:CheckBox Visible='<%# (((string)Eval("Tipo")=="ORDEN") && ((int)Eval("cccuota")!=1)? true : false) %>' runat="server" id="chkSelect"  runat="server" Checked="false" OnClick="UpdateTime" />
                        </asp:CheckBox>--%>

                    </ItemTemplate> 
                </asp:TemplateField>                 

                <%--<asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton Visible="<%# AMET.PermisoOperador()%>" ID="lnkRemove" runat="server" CommandName="Delete" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>' 
                             OnClientClick = "return confirm('¿Está seguro que quiere sacar la Orden/Deuda de la Cancelación?')" ToolTip="Eliminar de la Cancelación">
                            <span class="glyphicon glyphicon-remove" style="color:red"></span>
                        </asp:LinkButton>                        
                    </ItemTemplate> 
                </asp:TemplateField>--%>
                </Columns>
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
                
                <%--<asp:Button ID="btnUpdate" Text="Update Time" runat="server" OnClick="UpdateTime" />
               
                <asp:Label ID="lblTime" runat="server" />--%>
                
    
                <table id="Table2" runat="server" class="auto-style8">
                 <tr>
                    <td class="auto-style7" align="left">
                        Autorizado: <asp:DropDownList ID="DDAutorizado4" runat="server" Height="19px" Width="320px"></asp:DropDownList>
                        <br><br>
                        Firmante: <strong> <asp:Label ID="Lab_Firmante_cancela" runat="server" Text="Bazan G."></asp:Label>
                        </strong>
                        <br><br>
                        Observaciones: <asp:TextBox ID="TextObsCancel" runat="server" Height="62px" Width="414px"></asp:TextBox>
                        <br><br>
                        Total Deuda: <asp:TextBox ID="txt_total_deuda" runat="server" Width="92px" ReadOnly="True" ></asp:TextBox>
                        <br><br>                    
                    <%--<td  align="right">--%>
                        Total Deuda a cancelar: <asp:TextBox ID="txt_total_cancelar" runat="server" Width="80px"  ></asp:TextBox>
                        <br><br>
                    
                     <%--<td class="text-left">
                         &nbsp;</td>--%>
                   </td> 
                </tr>
                    
                 <tr>
                    <td class="auto-style7" >
                        <hr class="auto-style6" />
                            <asp:Button ID="Button9" runat="server" Text="<< Cancelar" CausesValidation="false" onclick="Cancelar_Click" CssClass="btn btn-info"/>
                    </td>
                    <td  align="right"> 
                        <hr class="auto-style2" />
                        <asp:Button ID="Button10" runat="server" Text="> Confirmar Cancelar Saldo <" OnClientClick="return ValidacionesCancelacion()" onclick="GuardarOrden_cancelar_click" CssClass="btn btn-success" Width="246px"/><strong>
                     </strong>
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
             Historial de Novedades
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

    

<table id="t_form_predim" align="center" runat="server" border="0" cellpadding="0" cellspacing="0" >
    <tr style="height: 30px;"><td align="right"></td><td>&nbsp;</td>    
        <td class="style1">                      
       <asp:TextBox ID="TextBoxNUMORD" runat="server" Width="28%" Enabled="true" ReadOnly="false" visible="false"></asp:TextBox><asp:Label ID="Lab_error" runat="server" Text="" ForeColor="Red" visible="false"></asp:Label>
    </td>
</tr>
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
       <asp:TextBox ID="txt_control" runat="server" Width="115%" Enabled="False" ReadOnly="True"></asp:TextBox>
    </td>
</tr>
<tr style="height: 30px;"><td align="right">Fecha Inicio de Cobro:</td><td></td>
    <td class="style1">
                <asp:DropDownList ID="DDFecha" runat="server" Height="19px" Width="320px">  </asp:DropDownList>
     </td>
</tr>
<tr style="height: 30px;"><td align="right">Firmante:</td><td></td>
    <td class="style1">
        <strong>
            <asp:Label ID="Lab_Firmante_Predim" runat="server" Text="Gonzalo G"></asp:Label>
        </strong>               
     </td>
</tr>
<tr style="height: 30px;"><td align="right">Observaciones: </td><td></td>
    <td class="style1"><asp:TextBox ID="Observaciones" runat="server" Height="38px" Width="414px"></asp:TextBox></td>
</tr>
<tr style="height: 30px;">
    <td></td>
    <td></td>
    <td class="auto-style1"><asp:Label ID="Lab_Confirmacion" runat="server" Visible="false" ForeColor="Red" Text="*La Orden fue generada Satisfactoriamente.."></asp:Label></td>
</tr>             
<tr style="height: 30px; background-color:#DBDBDB">
    <td align="center" class="style1" colspan="3">
    <asp:Button ID="btn_Cancelar" runat="server" Text="<< Volver" CausesValidation="false" onclick="Cancelar_Click" CssClass="btn btn-info"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <asp:Button ID="btn_GuardarOrden" Enabled="false" runat="server" Text="< Guardar >"  OnClick="GuardarOrden_click" CssClass="btn btn-success"/>
        <asp:Button ID="btn_ImprimirOrden" visible="false" runat="server" Text="Imprimir Orden"  OnClick="ImprimirOrden" CssClass="btn btn-primary" Width="124px"/>
    </td> 
    
</tr>  
</table>
<br />

<table id="t_form_comercio" align="center" runat="server" border="0" cellpadding="0" cellspacing="0" >

 <tr style="height: 30px;"><td align="right"></td><td>&nbsp;</td>    
        <td class="style1">                      
       <asp:TextBox ID="Textnumordgeneral" runat="server" Width="28%" Enabled="true" ReadOnly="false" Visible="false"></asp:TextBox><asp:Label ID="Label_error_numord_general" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
    </td>
</tr>

<tr style="height: 30px;">
<td align="right">Comercio:</td>
<td></td>
    <td class="style1">
        <asp:DropDownList ID="DDComercio2" runat="server" Height="22px" Width="201px" AutoPostBack = "true" OnSelectedIndexChanged="Select_Comercio_Click"></asp:DropDownList>
    </td>
</tr>
    <tr style="height: 30px;" visible="true"><td align="right"><asp:Label ID="LabCodigoFinanciero" runat="server" Text="Nro. de Legajo" visible="true"></asp:Label></td><td>&nbsp;</td>    
        <td class="style1">                      
       <asp:TextBox ID="TxtCodFinanciero" runat="server" Width="28%" Enabled="true" ReadOnly="false" visible="true"></asp:TextBox><asp:Label ID="LabelMensajeCodFinanciero" runat="server" Text="" ForeColor="Red" visible="true"></asp:Label>
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
        &nbsp;<asp:TextBox ID="txt_Monto02" runat="server" Width="68px" AutoPostBack="true"  OnTextChanged="btn_Cuota_calcular2_Click" ></asp:TextBox>
        <asp:RequiredFieldValidator id="RequiredFieldValidator1" ControlToValidate="txt_control" ErrorMessage="* Obligatorio" runat="server"/> 
     </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Cantidad Cuotas:</td>
    <td>&nbsp;</td><td align="left" class="style1">
                <asp:DropDownList ID="DDCCuotas02" AutoPostBack="true" runat="server" OnSelectedIndexChanged="btn_Cuota_calcular2_Click">
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
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                    <asp:ListItem>32</asp:ListItem>
                    <asp:ListItem>33</asp:ListItem>
                    <asp:ListItem>34</asp:ListItem>
                    <asp:ListItem>35</asp:ListItem>
                    <asp:ListItem>36</asp:ListItem>
                    <asp:ListItem>37</asp:ListItem>
                    <asp:ListItem>38</asp:ListItem>
                    <asp:ListItem>39</asp:ListItem>
                    <asp:ListItem>40</asp:ListItem>
                    <asp:ListItem>41</asp:ListItem>
                    <asp:ListItem>42</asp:ListItem>
                    <asp:ListItem>43</asp:ListItem>
                    <asp:ListItem>44</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                    <asp:ListItem>46</asp:ListItem>
                    <asp:ListItem>47</asp:ListItem>
                    <asp:ListItem>48</asp:ListItem>
                </asp:DropDownList>
      </td>
</tr>
<tr style="height: 30px;">
    <td align="right">Cuota:</td>
    <td></td><td align="left" class="style1">
        <asp:TextBox ID="txt_Cuota02" runat="server" Width="68px" ReadOnly="True" ></asp:TextBox>       
    </td>
</tr>         
<tr style="height: 30px;">
    <td align="right">&nbsp;</td><td>&nbsp;</td>
    <td class="style1">                               
        <asp:TextBox ID="txt_control2" runat="server" Enabled="False" ReadOnly="True" Width="364px"></asp:TextBox>
    </td>
</tr>
<tr style="height: 30px;"><td align="right">Fecha Inicio de Cobro:</td><td></td>
    <td class="style1">
                <asp:DropDownList ID="DDfecha2" runat="server" Height="19px" Width="320px">  </asp:DropDownList>
    </td>
</tr>
<tr style="height: 30px;"><td align="right">Firmante:</td><td></td>
    <td class="style1">               
                <strong>
        <asp:Label ID="Lab_Firmante_OK" runat="server" Text="Gonzalo G"></asp:Label>
                </strong>
    </td>
</tr>
<tr style="height: 30px;"><td align="right">Observaciones: </td><td></td>
    <td class="style1" >
    <asp:TextBox ID="txtObservaciones2" runat="server" Height="38px" Width="414px"></asp:TextBox></td>
</tr>

<tr style="height: 30px;">
    <td></td>
    <td></td>
    <td><asp:Label ID="Lab_Confirmacion_Orden_comun" runat="server" Visible="false" ForeColor="Red" Text="*La Orden fue generada Satisfactoriamente.."></asp:Label></td>
</tr>             
<tr style="height: 30px; background-color:#DBDBDB">
    <td align="center" class="style1" colspan="3">
    <asp:Button ID="Button4" runat="server" Text="<< Volver" CausesValidation="false" onclick="Cancelar_Click" CssClass="btn btn-info"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button  ID="btn_GuardarOrden02" runat="server" Text="Guardar" OnClick="GuardarOrden02_Click" EnableTheming="True" enabled="False" CssClass="btn btn-success"/>
        <asp:Button ID="btn_ImprimirOrdenComun" visible="false" runat="server" Text="Imprimir Orden"  OnClick="ImprimirOrden" CssClass="btn btn-primary" Width="124px"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td> 
</tr>
</table>

<table id="t_form_devol" align="center" runat="server" border="0" cellpadding="0" cellspacing="0" >
<tr style="height: 30px;">
    <td align="right">Orden:</td>
    <td></td>
    <td class="style1">
        <strong>Devolución</strong>
    </td>
</tr>

    <tr style="height: 30px;">
    <td align="right">Autorizado:</td>
    <td></td>
   <td align="left" class="style1">
        <asp:DropDownList ID="DDAutorizado3" runat="server" Height="17px" Width="330px">  </asp:DropDownList>
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
    <td align="right">Firmante:</td>
    <td></td>
    <td class="style1">
        <strong>
        <asp:Label ID="Lab_Firmante_Devolucion" runat="server" Text="Gonzalo G"></asp:Label>
        </strong>
        <%--<asp:DropDownList ID="DDFirmante3" runat="server" Height="19px" Width="320px"></asp:DropDownList>--%>
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
        <asp:Button ID="Button6" runat="server" Text="<< Cancelar" CausesValidation="false" onclick="Cancelar_Click" CssClass="btn btn-info"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button7" runat="server" Text="< Generar Devolución >" OnClick="GuardarOrden03_Click" EnableTheming="True" CssClass="btn btn-success"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
</div>
    </div>
</asp:Content>

