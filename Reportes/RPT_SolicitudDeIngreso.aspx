<%@ Page Title="RRT_Solicitud" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RPT_SolicitudDeIngreso.aspx.cs" Inherits="A.RPT_SolicitudDeIngreso" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent"></asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:chocolate"></span> <span class="glyphicon glyphicon-list-alt" style="font-size: 25px; color:chocolate"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label></h2>
<asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>
<hr style="border-color:#CCC;"/>

        <asp:Label ID="IdAfiliadoT" visible="false" runat="server" Text="IdAfiliadoT"></asp:Label>
        <asp:Label ID="Padron" visible="false" runat="server" Text="Padron"></asp:Label>
        <asp:Label ID="IdTipoSabana" visible="false" runat="server" Text="A"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AMETConnection %>" SelectCommand="RPT_Afiliados" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="%" Name="apellido" Type="String" />
                <asp:Parameter DefaultValue="0" Name="idEstadoCivil" Type="Int32" />
                <asp:ControlParameter ControlID="Padron" DefaultValue="" Name="padron" PropertyName="Text" Type="String" />
                <asp:Parameter DefaultValue="%" Name="centro" Type="String" />
                <asp:Parameter DefaultValue="%" Name="sector" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>  
        <div>  
        <rsweb:reportviewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID"  HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="94%" Height="600px">
        <localreport reportpath="Reportes\RDLC\RPT_SolicitudDeIngreso.rdlc">
            <datasources>                
                <rsweb:reportdatasource DataSourceId="SqlDataSource2" Name="DS_Afiliado" />                 
            </datasources>
        </localreport>
        </rsweb:ReportViewer>
        </div>
        <div>
           <hr style="border-color:#CCC;"/>
           <asp:Button ID="Volver" runat="server" Text="<< Volver" CausesValidation="false" onclick="f_volver" CssClass="btn btn-info" style="margin-left: 0" Visible="false"/>
        </div>
</asp:Content>