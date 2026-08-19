<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Novedad.aspx.cs" Inherits="A.Novedad" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <style type="text/css">
        .style2
        {
            width: 523px;
        }
    </style>
    <h2><asp:Image ID="Image2" runat="server"  ImageUrl="~/img/IMG_PlanillaNovedades.png" ImageAlign="Middle"/>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label></h2>
    <hr style="border-color:#CCC;"/>
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>
    <asp:Label ID="IdPersonaT" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="accion" runat="server" Visible="false"></asp:Label>
    
 <table id="t_GridView_lista_novedades" runat="server" width="100%">
<tr><td class="style2"><h3>Novedades sin corroborar correspondiente al periodo:  <asp:Label ID="lbl_mes_nuevo" runat="server" ></asp:Label> </h3></td>
<td align="right">  <asp:Button ID="btn_pasar_corrobora" runat="server" Text="Pasar a Corroborar >>>"  OnClick="f_generar_novedad_iniciada"  /> </td>
</tr>
<tr>
<td colspan="2">  

<asp:GridView ID="GridView_lista_novedades"  DataKeyNames="Padron" runat="server" CellPadding="4" Width="600px" 
                ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" 
                   Font-Size="Small"    RowStyle-HorizontalAlign="Right" >
                <AlternatingRowStyle BackColor="White" />     
                 
                <Columns>
                 <asp:TemplateField HeaderText="#">     
                <ItemTemplate>                
                <asp:Label id="Num" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>                

                <asp:TemplateField HeaderText="Padrón" Visible="True">   
                <ItemTemplate>
                <asp:Label id="Padron" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Padron")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Apellido y Nombre"  ItemStyle-HorizontalAlign="Left">
                <ItemTemplate>
                <asp:Label id="Afiliado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Apellido")%>'></asp:Label>	
                , <asp:Label id="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Nombre")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>    
                       
                <asp:TemplateField HeaderText="Cuota"  ItemStyle-Width="70" >
                <ItemTemplate>
                $ <asp:Label id="Cuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cuota")%>'></asp:Label>	
                </ItemTemplate> 
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Saldo"  ItemStyle-Width="80">
                <ItemTemplate>
                $ <asp:Label id="Saldo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "saldo")%>'></asp:Label>	
                                </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Deuda" ItemStyle-Width="80">
                <ItemTemplate>
                $ <asp:Label id="Deuda" runat="server" Text='<%# String.Format("{0:f2}",DataBinder.Eval(Container.DataItem, "Deuda"))%>'></asp:Label>	
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

<table id="t_GridView_novedades_corrobra" runat="server" width="100%">
<tr><td class="style2"><h3>Novedades sin corroborar correspondiente al periodo:  
<asp:Label ID="lbl_corrobra" runat="server" >hola</asp:Label> </h3>
</td>
<td align="right">  <asp:Button ID="Button1" runat="server" Text="CORROBORAR TODOS >>>"  OnClick="f_corroborar_novedad"  /> </td>
</tr>
<tr>
<td colspan="2">  
<%--<form id="form1" runat="server"></form>--%>

    <asp:GridView ID="GridView_corrobora" runat="server" AutoGenerateColumns="False"  CellPadding="4" Width="100%" 
                ForeColor="#333333"
         onrowcancelingedit="GridView_corrobora_RowCancelingEdit" 
        onrowediting="GridView_corrobora_RowEditing" 
        onrowupdating="GridView_corrobora_RowUpdating" 
        onrowdatabound="GridView_corrobora_RowDataBound">
 <Columns>
           <asp:TemplateField HeaderText="ID">
           <ItemTemplate >
               <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id") %>' >	</asp:Label>
           </ItemTemplate>
           </asp:TemplateField>

           <asp:TemplateField HeaderText="Nombre">
           <ItemTemplate >
              <asp:Label ID="lbl_nombre" runat="server" Text='<%# Eval("nombre") %>' > </asp:Label>
           </ItemTemplate>
           </asp:TemplateField>

           <asp:TemplateField HeaderText="padron">
           <ItemTemplate >
              <asp:Label ID="lbl_padron" runat="server" Text='<%# Eval("padron") %>' > </asp:Label>
           </ItemTemplate>
             </asp:TemplateField>

         <asp:TemplateField HeaderText="cuota">
           <ItemTemplate >
             $ <asp:Label ID="lbl_cuota" runat="server" Text='<%# Eval("cuota") %>' > </asp:Label>
           </ItemTemplate>
             </asp:TemplateField>

           <asp:TemplateField HeaderText="saldo">
           <ItemTemplate>
             $  <asp:Label ID="lbl_saldo" runat="server" Text='<%# Eval("saldo") %>'></asp:Label>
           </ItemTemplate>

           </asp:TemplateField>

           <asp:TemplateField HeaderText="Interes(Saldo)">
           <ItemTemplate >
            $ <asp:Label ID="Label2" runat="server" Text='<%# String.Format("{0:f2}",DataBinder.Eval(Container.DataItem, "interes_calculo")) %>'></asp:Label>
           </ItemTemplate>
             <EditItemTemplate>
           <%--    <asp:TextBox ID="TextBox_interes" runat="server" Text='<%# Eval("interes") %>' > </asp:TextBox>  --%> 
                  <asp:DropDownList ID="DDList_Interes" runat="server">
                 <asp:ListItem Text="2" Value="2" />
                 <asp:ListItem Text="0" Value="0"/>     
               </asp:DropDownList> %
           </EditItemTemplate>
           </asp:TemplateField>

           <asp:TemplateField HeaderText="Total">
           <ItemTemplate>
             $  <asp:Label ID="lbl_total" runat="server" Text='<%# String.Format("{0:f2}",DataBinder.Eval(Container.DataItem, "total")) %>'></asp:Label>
           </ItemTemplate>
           </asp:TemplateField>

           <asp:TemplateField HeaderText="A pedir">
           <ItemTemplate >
              $ <asp:Label ID="Label3" runat="server" Text='<%# Eval("pedido") %>'></asp:Label>
           </ItemTemplate>
           <EditItemTemplate>
              $ <asp:TextBox ID="TextBox_pedido" runat="server" Text='<%# Eval("pedido") %>' ></asp:TextBox>
           </EditItemTemplate>
           </asp:TemplateField>


              
           <asp:TemplateField HeaderText=" " ShowHeader="false">
               <ItemTemplate>
                   <asp:LinkButton ID="btnedit" runat="server" CommandName="Edit" Text="Editar" ></asp:LinkButton>
               </ItemTemplate>
               <EditItemTemplate>
                   <asp:LinkButton ID="btnupdate" runat="server" CommandName="Update" Text="Actualizar" ></asp:LinkButton> <br />
                   <asp:LinkButton ID="btncancel" runat="server" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
               </EditItemTemplate>
            </asp:TemplateField>
</Columns>

    </asp:GridView>

</td> 
</tr>
</table>



<table id="t_grilla" runat="server"  width="100%" border="0" cellpadding="0" cellspacing="0">
           <tr>
            <td> 
                 
             </td>
            </tr>
            <tr><td align="right">
                           &nbsp;</td></tr>

<tr>
<td>
    <br />
</td>
</tr>

            <tr>
            <td>
                &nbsp;</td>
            </tr>         
        </table>

<table id="t_ordenes" runat="server"  width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
            <td>
            <asp:Label ID="lbl_ordenes" runat="server">Listado de Ordenes Aprobadas</asp:Label>
            </td>
            </tr>            
            <tr>
            <td>
                <asp:GridView ID="grilla_secundaria"  runat="server"   CellPadding="4" 
                    Width="910px" ForeColor="#333333" GridLines="None"
                 AutoGenerateColumns="False"     Font-Size="Small">
                <AlternatingRowStyle BackColor="White" />      
                <Columns>
                <asp:TemplateField HeaderText="Padron">   
                <ItemTemplate>
                <asp:Label id="Padron" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "padron") %>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Orden">   
                <ItemTemplate>
                <asp:Label id="Orden" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "numorden") %>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Inicio Cobro">   
                <ItemTemplate>
                <asp:Label id="FechaInicio" runat="server" Text='<%# Bind("FechaInicio", "{0:d}") %>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>            
                <asp:TemplateField HeaderText="Importe Total">
                <ItemTemplate>
                <asp:Label id="ImporteTotal" runat="server" Text=' <%# DataBinder.Eval(Container.DataItem, "ImporteTotal")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Cuotas">
                <ItemTemplate>
                <asp:Label id="CantCuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CantCuota")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Monto Cuota">
                <ItemTemplate>
                <asp:Label id="CuotasMonto" runat="server" Text=' <%# DataBinder.Eval(Container.DataItem, "Cuota")%>'></asp:Label>	
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
            
            <tr>  <td align="center">
                    <asp:Button ID="btn_aceptar" runat="server" onclick="btn_aceptar_Click" Text="Aceptar" />
            </td>
            </tr>  
        </table>


</asp:Content>