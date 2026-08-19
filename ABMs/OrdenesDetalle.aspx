<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdenesDetalle.aspx.cs" Inherits="A.OrdenesDetalle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent"></asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2><asp:Label ID="Titulo" runat="server"></asp:Label></h2>
    <hr style="border-color:#CCC;"/>

<table id="t_grilla_proyecciones" runat="server"  width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr><td><h3><asp:Label ID="mes1" runat="server"></asp:Label></h3>   
            </td></tr>
            <tr>
            <td>
                <asp:GridView ID="gview_mes1"  runat="server" AllowPaging="True" CellPadding="4" 
                    Width="910px" ForeColor="#333333" GridLines="None"
                     AutoGenerateColumns="False"
                     Font-Size="Small" >
                <AlternatingRowStyle BackColor="White" />      
                <Columns>
                 <asp:TemplateField HeaderText="#">     
                <ItemTemplate>                
                <asp:Label id="Num" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>     
                           
                 <asp:TemplateField HeaderText="IdComercio" Visible="False">     
                <ItemTemplate>                
                <asp:Label id="IdComercio" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "IdComercio")%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>

               <asp:TemplateField HeaderText="Orden">
                <ItemTemplate>
                <asp:Label id="NumOrden" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NumOrden")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Monto">
                <ItemTemplate>
                $ <asp:Label id="Monto" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "monto")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cuota">   
                <ItemTemplate>
                <asp:Label id="NCuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Num_Cuota") %>'></asp:Label>	
                /
                <asp:Label id="TotalCuotas" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CantCuota")%>'></asp:Label>
                </ItemTemplate>  
                </asp:TemplateField>
           
 
                <asp:TemplateField HeaderText="Valor Cuota">
                <ItemTemplate>
                $ <asp:Label id="VCuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Cuota")%>' Font-Bold="True"></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
 
               <asp:TemplateField HeaderText="Saldo">
                <ItemTemplate>
                $ <asp:Label id="Saldo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Saldo")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>

               <asp:TemplateField HeaderText="FInicio">
                <ItemTemplate>
                <asp:Label id="FInicio" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FInicio")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
 
               <asp:TemplateField HeaderText="FFin">
                <ItemTemplate>
                <asp:Label id="FFin" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FFin")%>'></asp:Label>	
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
    <tr><td align = 'center'><h3>Total:  $&nbsp;  <asp:Label ID="total_mes1" runat="server"></asp:Label></h3>
            </td></tr>  
       <tr><td><h3><asp:Label ID="mes2" runat="server"></asp:Label></h3>
           </td></tr>
        <tr>
            <td>
                <asp:GridView ID="gview_mes2"  runat="server" AllowPaging="True" CellPadding="4" 
                    Width="910px" ForeColor="#333333" GridLines="None"
                     AutoGenerateColumns="False"
                     Font-Size="Small" 
                    >
                <AlternatingRowStyle BackColor="White" />      
                <Columns>
                 <asp:TemplateField HeaderText="#">     
                <ItemTemplate>                
                <asp:Label id="Num" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>     
                           
                 <asp:TemplateField HeaderText="IdComercio" Visible="False">     
                <ItemTemplate>                
                <asp:Label id="IdComercio" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "IdComercio")%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>

               <asp:TemplateField HeaderText="Orden">
                <ItemTemplate>
                <asp:Label id="NumOrden" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NumOrden")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Monto">
                <ItemTemplate>
                $ <asp:Label id="Monto" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "monto")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cuota">   
                <ItemTemplate>
                <asp:Label id="NCuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Num_Cuota") %>'></asp:Label>	
                /
                <asp:Label id="TotalCuotas" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CantCuota")%>'></asp:Label>
                </ItemTemplate>  
                </asp:TemplateField>
           
 
                <asp:TemplateField HeaderText="Valor Cuota">
                <ItemTemplate>
                $ <asp:Label id="VCuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Cuota")%>' Font-Bold="True"></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
 
               <asp:TemplateField HeaderText="Saldo">
                <ItemTemplate>
                $ <asp:Label id="Saldo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Saldo")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
 
               <asp:TemplateField HeaderText="FInicio">
                <ItemTemplate>
                <asp:Label id="FInicio" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FInicio")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
 
               <asp:TemplateField HeaderText="FFin">
                <ItemTemplate>
                <asp:Label id="FFin" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FFin")%>'></asp:Label>	
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
     <tr><td align = 'center'><h3>Total: $ <asp:Label ID="total_mes2" runat="server"></asp:Label></h3>
            </td></tr> 
       <tr><td><h3><asp:Label ID="mes3" runat="server"></asp:Label></h3>
           </td></tr>
        <tr>
            <td>
                <asp:GridView ID="gview_mes3"  runat="server" AllowPaging="True" CellPadding="4" 
                    Width="910px" ForeColor="#333333" GridLines="None"
                     AutoGenerateColumns="False"
                     Font-Size="Small" >
                <AlternatingRowStyle BackColor="White" />      
                <Columns>
                 <asp:TemplateField HeaderText="#">     
                <ItemTemplate>                
                <asp:Label id="Num" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>     
                           
                 <asp:TemplateField HeaderText="IdComercio" Visible="False">     
                <ItemTemplate>                
                <asp:Label id="IdComercio" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "IdComercio")%>'></asp:Label>	
                </ItemTemplate>
                </asp:TemplateField>

               <asp:TemplateField HeaderText="Orden">
                <ItemTemplate>
                <asp:Label id="NumOrden" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NumOrden")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Monto">
                <ItemTemplate>
                $ <asp:Label id="Monto" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "monto")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cuota">   
                <ItemTemplate>
                <asp:Label id="NCuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Num_Cuota") %>'></asp:Label>	
                /
                <asp:Label id="TotalCuotas" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CantCuota")%>'></asp:Label>
                </ItemTemplate>  
                </asp:TemplateField>
           
 
                <asp:TemplateField HeaderText="Valor Cuota">
                <ItemTemplate>
                $ <asp:Label id="VCuota" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Cuota")%>' Font-Bold="True"></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
 
               <asp:TemplateField HeaderText="Saldo">
                <ItemTemplate>
                $ <asp:Label id="Saldo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Saldo")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
 

               <asp:TemplateField HeaderText="FInicio">
                <ItemTemplate>
                <asp:Label id="FInicio" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FInicio")%>'></asp:Label>	
                </ItemTemplate>  
                </asp:TemplateField>
 
               <asp:TemplateField HeaderText="FFin">
                <ItemTemplate>
                <asp:Label id="FFin" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FFin")%>'></asp:Label>	
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
     <tr><td align = 'center'><h3>Total:  $ <asp:Label ID="total_mes3" runat="server"></asp:Label></h3>
            </td></tr>                
        </table>
</asp:Content>