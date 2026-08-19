<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Novedad_informe.aspx.cs" Inherits="A.Novedad_informe" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    </asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
       <asp:Image ID="Image2" runat="server"  ImageUrl="~/img/IMG_PlanillaNovedades.png" ImageAlign="Middle"/>&nbsp;&nbsp;
       <asp:Label ID="Titulo" runat="server">Listado de Novedades</asp:Label> 
     </h2>
    <hr style="border-color:#CCC;"/>
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>
    <asp:Label ID="IdPersonaT" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="accion" runat="server" Visible="false"></asp:Label>
    
<table id="t_grilla" runat="server"  width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr><td></td></tr>
    <tr><td ><h3>Listado Novedades</h3></td></tr>
    <tr>
    <td>
   <asp:GridView ID="GridView_liquidaciones"  runat="server"  CellPadding="4"  
                    ForeColor="#333333" GridLines="None" AutoGenerateColumns="False"
                  OnRowDeleting="f_eliminar_fila"  
                    Font-Size="Small" onrowcommand="gview_RowCommand_detalle"   RowStyle-HorizontalAlign="Right" >
                <AlternatingRowStyle BackColor="White"   />      
                <Columns>

                 <asp:TemplateField HeaderText="#">     
                <ItemTemplate>                
                <asp:Label id="Num" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>    
                         
                 <asp:TemplateField HeaderText="ID" Visible="False">     
                <ItemTemplate>                
                <asp:Label id="ID" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "id_novedad")%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Mes">
                <ItemTemplate>
                <asp:Label id="Mes" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "mes")%>'></asp:Label>	/
                <asp:Label id="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ano")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>    
                       
                <asp:TemplateField HeaderText="Deuda"  ItemStyle-Width="100"   >
                <ItemTemplate>
                  $ <asp:Label id="Cuota_Deuda" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "deuda")%>'></asp:Label>	
                
                </ItemTemplate> 
                </asp:TemplateField>
                 
                <asp:TemplateField HeaderText="Recuperado" ItemStyle-Width="100"  >
                <ItemTemplate>
                $ <asp:Label id="Recuperado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "recuperado")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cantidad de </br> Padrones">
                <ItemTemplate>
                <asp:Label id="Padrones" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cpadron")%>'></asp:Label>	
                </ItemTemplate> 
                </asp:TemplateField> 

                <asp:TemplateField HeaderText="Fecha">
                <ItemTemplate>
                Iniciada: <asp:Label id="f1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fecha_creacion")%>'></asp:Label> <br />	
                Corroborada: <asp:Label id="f2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "corroboradoEl")%>'></asp:Label><br />	
                Recuperado: <asp:Label id="f3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "recuperadoEl")%>'></asp:Label>	
                </ItemTemplate> 
                </asp:TemplateField> 

                    <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="Mostrar" runat="server" CommandName="Mostrar" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "id_novedad")%>' 
                                 ><asp:Image ID="I_MostrarCom" ImageUrl="~/img/consultar.gif" runat="server"  ToolTip="Mostrar" /></asp:LinkButton>
                            </ItemTemplate> 
                        </asp:TemplateField>

                 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton  ID="lnkRemove" runat="server" CommandName="Delete" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "mes")%>' 
                         OnClientClick = "return confirm('¿Esta seguro que quiere eliminar esta Novedad ?')">
                        <asp:Image ID="I_EliminarCom" ImageUrl="~/img/del.png" runat="server" ToolTip="Eliminar" />
                        </asp:LinkButton>
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
                </asp:GridView><br />
</td>
</tr>
</table>
<table id="Tabla_detalle" runat="server"  width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
            <td>Detalle Liquidacion<br /> <asp:Button ID="btn_aceptar" runat="server" onclick="btn_aceptar_Click" Text="Aceptar" />
                <asp:GridView ID="vista_planilla"  DataKeyNames="ID" runat="server" CellPadding="4" Width="910px"  ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" 
                   
                 OnRowDeleting="f_eliminar_fila"  Font-Size="Small"    RowStyle-HorizontalAlign="Right" >
                <AlternatingRowStyle BackColor="White" />      
                <Columns>
                 
                 <asp:TemplateField HeaderText="#">     
                <ItemTemplate>                
                <asp:Label id="Num" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>    
                            
                 <asp:TemplateField HeaderText="ID" Visible="False">     
                <ItemTemplate>                
                <asp:Label id="ID" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "fk_afiliado")%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Padrón" Visible="True">   
                <ItemTemplate>
                <asp:Label id="Padron" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "padron")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Apellido y Nombre"  ItemStyle-HorizontalAlign="Left">
                <ItemTemplate>
                <asp:Label id="Afiliado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "nombre")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>    
                       
                <asp:TemplateField HeaderText="Cuota"  ItemStyle-Width="70" >
                <ItemTemplate>
                <asp:LinkButton ID="lnk_cuota" runat="server" CommandName="Mostrar" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "fk_afiliado")%>' Text="Detalle de Cuota" >
                $ <asp:Label id="Cuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cuota")%>'></asp:Label>	
                </asp:LinkButton> 
                </ItemTemplate> 
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Saldo"  ItemStyle-Width="80">
                <ItemTemplate>
                $ <asp:Label id="Saldo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "saldo")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Interes"  ItemStyle-Width="75">
                <ItemTemplate>
                $ <asp:Label id="interes" runat="server" Text='<%# String.Format("{0:f2}",DataBinder.Eval(Container.DataItem, "interes"))%>'></asp:Label>	
                
                <asp:LinkButton ID="lnk_recargo" runat="server" CommandName="QuitarRecargo" CommandArgument = '<%# DataBinder.Eval(Container.DataItem, "ID")%>' 
                 OnClientClick = "return confirm('¿ Confirma quita del 2% de recargo ?')" visible="false" >
                <asp:Image ID="i_quitar_interes" ImageUrl="~/img/edit.png" runat="server"  ToolTip="Quitar 2%" />  
                </asp:LinkButton>
                </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Deuda" ItemStyle-Width="80">
                <ItemTemplate>
                $ <asp:Label id="Deuda" runat="server" Text='<%# String.Format("{0:f2}",DataBinder.Eval(Container.DataItem, "total"))%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Pedido"  ItemStyle-Width="100">
                <ItemTemplate> 
                $ <asp:Label id="lbl_peio" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "pedido")%>'></asp:Label>	
                  </ItemTemplate>  
                </asp:TemplateField>
                 
                <asp:TemplateField HeaderText="Recuperado">
                <ItemTemplate>
                $ <asp:Label id="Recuperado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "recuperado")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Observaciones">
                <ItemTemplate>
                <asp:Label id="Observaciones" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "obs")%>'></asp:Label>	
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
                </asp:GridView><br />
            </td>
            </tr>         
        </table>
</asp:Content>