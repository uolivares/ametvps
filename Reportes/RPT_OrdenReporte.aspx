<%@ Page Title="RRT_Afiliados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RPT_OrdenReporte.aspx.cs" Inherits="A.RPT_OrdenReporte" %>

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
        <div class="col-md-2"><asp:Label ID="Lb_Padron" runat="server" Text="Padron">Padrón:</asp:Label>           
            <asp:TextBox ID="TextPadron" runat="server" Width="106px"></asp:TextBox></div>
         <div class="col-md-4"><asp:Label ID="Lb_TipoOrden" runat="server" Text="Label">Tipo de Orden:</asp:Label>
            <asp:DropDownList ID="DDTipoDeOrden" runat="server" Height="22px" Width="167px"></asp:DropDownList>
         </div>
           <div class="col-md-4"><asp:Label ID="Label1" runat="server" Text="Label">Estados:</asp:Label>
            <asp:DropDownList ID="DDEstados" runat="server" Height="22px" Width="167px"></asp:DropDownList>
         </div>
      </div><br />
     <div class="row ">
         <div class="col-md-3"><asp:Label ID="LabelFechaD" runat="server" Text="Padron">Fecha Desde:</asp:Label>  <asp:TextBox ID="FechaDesde" runat="server" Width="86px"></asp:TextBox><asp:ImageButton ID="imgPopup" ImageUrl="~/img/calendar.png" ImageAlign="Bottom" runat="server" />
                <cc1:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" TargetControlID="FechaDesde" Format="dd/MM/yyyy"></cc1:CalendarExtender>
            
         </div>
          <div class="col-md-3"> <asp:Label ID="LabelFechaH" runat="server" Text="Padron">Fecha Hasta:</asp:Label> <asp:TextBox ID="FechaHasta" runat="server" Width="89px"></asp:TextBox><asp:ImageButton ID="imgPopup2" ImageUrl="~/img/calendar.png" ImageAlign="Bottom" runat="server" />
                <cc1:CalendarExtender ID="Calendar2" PopupButtonID="imgPopup2" runat="server" TargetControlID="FechaHasta" Format="dd/MM/yyyy"></cc1:CalendarExtender>
             
         </div>
         <div class="col-md-1 align-self-end"><br /><asp:Button ID="Button1" runat="server" Text="Ver Reporte" class="btn btn-primary" OnClick="Button1_Click" /></div>
       </div>
     <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AMETConnection %>" SelectCommand="RPT_GET_ReporteOrdenes" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="FechaDesde" DbType="Date" DefaultValue="02-05-2023" Name="FD" PropertyName="Text" />
            <asp:ControlParameter ControlID="FechaHasta" DbType="Date" DefaultValue="02-05-2023" Name="FH" PropertyName="Text" />
            <asp:ControlParameter ControlID="DDTipoDeOrden" DefaultValue="%" Name="TipoOrden" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DDEstados" DefaultValue="%" Name="Estado" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="TextPadron" DefaultValue="%" Name="padron" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMETConnection %>" SelectCommand="RPT_GET_ReporteOrdenes" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="FechaDesde" DbType="Date" Name="FD" PropertyName="Text" />
                    <asp:ControlParameter ControlID="FechaHasta" DbType="Date" Name="FH" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DDTipoDeOrden" DefaultValue="CREDITO" Name="TipoOrden" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="TextPadron" Name="padron" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    </div>
        <rsweb:reportviewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID"  HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="100%" Height="600px">
        <localreport reportpath="Reportes\RDLC\RPT_Ordenes.rdlc">
            <datasources>                
                <rsweb:reportdatasource DataSourceId="SqlDataSource2" Name="DS_RPT_Ordenes" />
                
            </datasources>
        </localreport>
        </rsweb:ReportViewer>
   
</asp:Content>