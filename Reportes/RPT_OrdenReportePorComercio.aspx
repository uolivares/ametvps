<%@ Page Title="RRT_Afiliados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RPT_OrdenReportePorComercio.aspx.cs" Inherits="A.RPT_OrdenReportePorComercio" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    </asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:chocolate"></span> <span class="glyphicon glyphicon-list-alt" style="font-size: 25px; color:chocolate"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label></h2>
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>
     
    <hr style="border-color:#CCC;"/>
    
      <div class="row ">
        <div class="col-md-2"><asp:Label ID="Lb_mes" runat="server" Text="Mes">Mes:</asp:Label>           
            <asp:textBox ID="TextMes" runat="server" Width="106px"></asp:textBox></div>

          <div class="col-md-2"><asp:Label ID="LabelAnio" runat="server" Text="Anio">Anio:</asp:Label>           
            <asp:TextBox ID="TextAnio" runat="server" Width="106px"></asp:TextBox></div>
            
         <div class="col-md-4"><asp:Label ID="Lb_Comercio" runat="server" Text="Label">Comercio:</asp:Label>
            <asp:DropDownList ID="DDComercio" runat="server" Height="22px" Width="167px" DataSourceID="SqlDataSource1" DataTextField="NomComercio" DataValueField="NomComercio"></asp:DropDownList>
         &nbsp;<asp:Button ID="Button1" runat="server" Text="Ver Reporte" class="btn btn-primary" OnClick="Button1_Click" />
         </div>
           <div class="col-md-4">
         </div>
      </div><br />
     <div class="row ">
         <div class="col-md-3">
            
         </div>
          <div class="col-md-3"> 
             
         </div>
         <div class="col-md-1 align-self-end"><br /></div>
       </div>
     <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AMETConnection %>" SelectCommand="RPT_GET_OrdenesPorComercio" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextMes" DefaultValue="2" Name="Mes" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextAnio" DefaultValue="2024" Name="Anio" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DDComercio" DefaultValue="OK PRESTAMOS" Name="Comercio" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMETConnection %>" SelectCommand="SELECT NomComercio, Expr1
FROM
(
    SELECT 'TODOS' AS NomComercio, 'TODOS' AS Expr1, 0 AS Orden

    UNION ALL

    SELECT NomComercio,
           NomComercio AS Expr1,
           1 AS Orden
    FROM Comercio
    WHERE BajaLogica = 0
) AS T
ORDER BY Orden, NomComercio;">
            </asp:SqlDataSource>
    </div>
        <rsweb:reportviewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID"  HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="100%" Height="600px">
        <localreport reportpath="Reportes\RDLC\RPT_OrdenesPorComercio.rdlc">
            <datasources>                
                <rsweb:reportdatasource DataSourceId="SqlDataSource2" Name="DS_RPT_OrdenesPorComercio" />
                
            </datasources>
        </localreport>
        </rsweb:ReportViewer>
   
</asp:Content>