<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Novedad_GraficosTotales.aspx.cs" Inherits="A.ABMs.NovedadesGraficoTotales" %>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:chocolate"></span> <span class="glyphicon glyphicon-list" style="font-size: 25px; color:chocolate"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label> </h2>
    <hr/>
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>
    <asp:Label ID="IdAfiliadoT" runat="server" Visible="true"></asp:Label>
    <asp:Label ID="accion" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="Lab_IdOrden" runat="server" Visible="false"></asp:Label>
 <BR>
<div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lab_DatosAfiliado" runat="server" ForeColor="#0000ff"></asp:Label>
</div>
    
    
    <div>
     <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2" Width="458px" Height="370px">
         <Series>
             <asp:Series Name="Monto Real" XValueMember="Detalle" YValueMembers="valor" Legend="Monto Real" ChartType="Doughnut" ChartArea="ChartArea1"></asp:Series>
            
             
         </Series>
         <ChartAreas>
             <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
         </ChartAreas>
         <Titles>
             <asp:Title Name="Datos Financieros">
             </asp:Title>
         </Titles>
     </asp:Chart> 
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AMETConnection %>" SelectCommand="RPT_NOV_PedidosYRecuperosTotales" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    
     <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Width="527px" Height="360px">
         <Series>
             <asp:Series Name="Monto Real" XValueMember="Detalle" YValueMembers="valor" Legend="Monto Real" ChartArea="ChartArea1"></asp:Series>
            
             
         </Series>
         <ChartAreas>
             <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
         </ChartAreas>
         <Titles>
             <asp:Title Name="Datos Financieros">
             </asp:Title>
         </Titles>
     </asp:Chart> 
    
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMETConnection %>" SelectCommand="RPT_NOV_PedidosYRecuperosTotales" SelectCommandType="StoredProcedure">
         
     </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="140px" Width="520px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Periodo" HeaderText="Periodo" SortExpression="Periodo" />
                <asp:BoundField DataField="Detalle" HeaderText="Detalle" SortExpression="Detalle" />
                <asp:BoundField DataField="valor" HeaderText="Valor" SortExpression="Valor" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
    &nbsp;<div>
     &nbsp;
        <div class="auto-style2"><br />
           <asp:Button ID="Button1" runat="server" Text="<< Volver" CausesValidation="false" onclick="Volver" CssClass="btn btn-info" style="margin-left: 0"/>
        </div>
    </div>
    
 </div> 
    
 
</asp:Content>



<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style2 {
            margin-left: 46px;
        }
    </style>
</asp:Content>




