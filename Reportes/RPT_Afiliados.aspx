<%@ Page Title="RRT_Afiliados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RPT_Afiliados.aspx.cs" Inherits="A.RPT_Afiliados" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent"></asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:chocolate"></span> <span class="glyphicon glyphicon-list-alt" style="font-size: 25px; color:chocolate"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label></h2>
    <asp:Label ID="mensaje" runat="server" ForeColor="#0000ff"></asp:Label>
    <hr style="border-color:#CCC;"/>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMETConnection %>" SelectCommand="RPT_GET_EstadoCivil" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AMETConnection %>" SelectCommand="RPT_Afiliados" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxApellido" DefaultValue="%" Name="apellido" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DropDownListEstadoCivil" Name="idEstadoCivil" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
            <asp:ControlParameter ControlID="TextBoxPadron" DefaultValue="%" Name="padron" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxCentro" DefaultValue="%" Name="centro" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxSector" DefaultValue="%" Name="sector" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

      <div class="row ">
        <div class="col-md-6"><asp:Label ID="Lb_Apellido" runat="server" Text="Apellido">Apellido: </asp:Label><asp:TextBox ID="TextBoxApellido" runat="server" CssClass="form-control"></asp:TextBox></div>
         <div class="col-md-6"><asp:Label ID="Lb_EstadoCivil" runat="server" Text="Label">Estado Civil:</asp:Label>
            &nbsp;<asp:DropDownList ID="DropDownListEstadoCivil" runat="server" DataSourceID="SqlDataSource1" DataTextField="EstadoCivil" DataValueField="IdEstadoCivil" CssClass="form-control">
            </asp:DropDownList></div>
         <div class="col-md-6"><asp:Label ID="Lb_Padron" runat="server" Text="Label">Padrón:</asp:Label>&nbsp;<asp:TextBox ID="TextBoxPadron" runat="server" CssClass="form-control"></asp:TextBox></div>
         <div class="col-md-6"><asp:Label ID="Lab_Centro" runat="server" Text="Label">Centro:</asp:Label>&nbsp;<asp:TextBox ID="TextBoxCentro" runat="server" CssClass="form-control"></asp:TextBox></div>
         <div class="col-md-6"><asp:Label ID="Lab_Sector" runat="server" Text="Label">Sector:</asp:Label>&nbsp;<asp:TextBox ID="TextBoxSector" runat="server" CssClass="form-control"></asp:TextBox></div>
         <div class="col-md-6 align-self-end"><br /><asp:Button ID="Button1" runat="server" Text="Ver Reporte" class="btn btn-primary" OnClick="Button1_Click" /></div>
       </div>
     <br />
    <div>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID"  HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="100%">
        <localreport reportpath="Reportes\RDLC\RPT_Afiliados.rdlc">
            <datasources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource2" Name="DS_Template" />
            </datasources>
        </localreport>
    </rsweb:ReportViewer>
    </div>
</asp:Content>