<%@ Page Title="RRT_Sabana" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RPT_Sabana.aspx.cs" Inherits="A.RPT_Sabana" %>

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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMETConnection %>" SelectCommand="RPT_GET_SabanaDetalle" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="IdAfiliadoT" DefaultValue="" Name="IdAfiliado" PropertyName="Text" Type="Decimal" />
                <asp:ControlParameter ControlID="Text_mes" Name="Mes" PropertyName="Text" Type="Decimal" />
                <asp:ControlParameter ControlID="Text_Anio" Name="Anio" PropertyName="Text" Type="Decimal" />
                <asp:ControlParameter ControlID="CheckBoxCanceladas" DefaultValue="0" Name="filtraCancelados" PropertyName="Checked" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AMETConnection %>" SelectCommand="RPT_Afiliados" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="%" Name="apellido" Type="String" />
                <asp:Parameter DefaultValue="0" Name="idEstadoCivil" Type="Int32" />
                <asp:ControlParameter ControlID="Padron" DefaultValue="" Name="padron" PropertyName="Text" Type="String" />
                <asp:Parameter DefaultValue="%" Name="centro" Type="String" />
                <asp:Parameter DefaultValue="%" Name="sector" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AMETConnection %>" SelectCommand="RPT_NOV_UltimaNovedadPorAfiliado" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="IdAfiliadoT" Name="idAfiliado" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="Text_mes" Name="mesPeriodoParam" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="Text_Anio" Name="AnioPeriodoParam" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource> 
        <div>  
            <asp:Button ID="Button1" runat="server" OnClick="Call_Sabana_Actual" Text="Ver Sábana" Width="119px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label1" runat="server" Text="Label">a partir de Mes:</asp:Label> <asp:TextBox ID="Text_mes" runat="server" Width="39px"></asp:TextBox><asp:Label ID="Label2" runat="server" Text="Label">    Año:</asp:Label> <asp:TextBox ID="Text_Anio" runat="server" Width="59px"></asp:TextBox> <asp:Label ID="Lab_error_fecha" runat="server" Text="" ForeColor="Red"></asp:Label> 
            &nbsp;&nbsp;&nbsp; 
            <asp:CheckBox ID="CheckBoxCanceladas" runat="server" Checked="true"/>
            Filtrar Órdenes Canceladas<BR><BR>
            <%--<asp:Button ID="Btn_Sabana" runat="server" OnClick="Call_Sabana_Historico" Text="Ver Sábana" Width="119px"/>--%>   
            
            
        <rsweb:reportviewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID"  HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="100%" Height="600px">
        <localreport reportpath="Reportes\RDLC\RPT_Sabana.rdlc">
            <datasources>
                <rsweb:reportdatasource DataSourceId="SqlDataSource1" Name="DS_SabanaDetalle" />
                <rsweb:reportdatasource DataSourceId="SqlDataSource2" Name="DS_Afiliado" />
                  <rsweb:reportdatasource DataSourceId="SqlDataSource3" Name="DS_UltimaNovedadAfiliado" />
            </datasources>
        </localreport>
        </rsweb:ReportViewer>
        </div>
        <div>
           <hr style="border-color:#CCC;"/>
           <%--<asp:Button ID="Volver" runat="server" Text="<< Volver" CausesValidation="false" onclick="f_volver" CssClass="btn btn-info" style="margin-left: 0"/>--%>
        </div>
</asp:Content>
