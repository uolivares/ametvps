<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proyecciones.aspx.cs" Inherits="A.ABMs.Proyecciones" %>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:chocolate"></span> <span class="glyphicon glyphicon-list" style="font-size: 25px; color:chocolate"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label> </h2>
    <hr style="border-color:#CCC;"/>
    <asp:Label ID="mensaje" runat="server" ForeColor="#000000"></asp:Label>
    <asp:Label ID="IdAfiliadoT" runat="server" Visible="true"></asp:Label>
    <asp:Label ID="accion" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="Lab_IdOrden" runat="server" Visible="false"></asp:Label>
<div>
   <center><h4><strong><asp:Label ID="lab_DatosAfiliado" runat="server"></asp:Label></strong></h4></center>
</div>
    <div>
     <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource_proyeccion" Width="1142px" Height="307px">
         <Series>
             <asp:Series Name="Series1" XValueMember="Periodo" YValueMembers="Total" Legend="Legend1"></asp:Series>
         </Series>
         <ChartAreas>
             <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
         </ChartAreas>
         <Titles>
             <asp:Title Name="Title1" Text="Proyección de Totales por Período">
             </asp:Title>
         </Titles>
     </asp:Chart> 
    
     <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource_proyeccion" Height="294px" Width="735px">
         <Series>
             <asp:Series ChartType="Bar" Name="Series1" XValueMember="Periodo" YValueMembers="Ordenes">
             </asp:Series>
         </Series>
         <ChartAreas>
             <asp:ChartArea Name="ChartArea1">
             </asp:ChartArea>
         </ChartAreas>
         <Titles>
             <asp:Title Name="Title1" Text="Proyección de cantidad de Ordenes por Período">
             </asp:Title>
         </Titles>
     </asp:Chart>
    
     <asp:SqlDataSource ID="SqlDataSource_proyeccion" runat="server" ConnectionString="<%$ ConnectionStrings:AMETConnection %>" SelectCommand="ORD_GET_Proyeccion" SelectCommandType="StoredProcedure">
         <SelectParameters>
             <asp:ControlParameter ControlID="IdAfiliadoT" Name="IdAfiliado" PropertyName="Text" Type="String" />
         </SelectParameters>
     </asp:SqlDataSource>
    &nbsp;<div>
     &nbsp;
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_proyeccion" Width="643px" CssClass="auto-style1" style="margin-left: 53px">
         <AlternatingRowStyle BackColor="#A4C1FF" />
         <Columns>
             <asp:BoundField DataField="Periodo" HeaderText="Periodo" ReadOnly="True" SortExpression="Periodo" DataFormatString="{0:d}" />
             <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" DataFormatString="{0:c}" />
             <asp:BoundField DataField="Ordenes" HeaderText="Ordenes" ReadOnly="True" SortExpression="Ordenes" />
         </Columns>
         <HeaderStyle BackColor="#418CF0" />
     </asp:GridView>
        <div >
            <hr style="border-color:#CCC;"/>
           <asp:Button ID="Button1" runat="server" Text="<< Volver" CausesValidation="false" onclick="Volver" CssClass="btn btn-info" style="margin-left: 0" Visible="false"/>
        </div>
    </div>
    
 </div> 
</asp:Content>