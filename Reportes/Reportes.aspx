<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="A.ReportesA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    </asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:chocolate"></span> <span class="glyphicon glyphicon-list-alt" style="font-size: 25px; color:chocolate"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label></h2>
    <hr style="border-color:#CCC;"/>
    <table id="TablebOT" runat="server"  width="90%" align="center" >
            <tr>
            <td>&nbsp;</td>
            <td align="center">
                <asp:Button ID="Button1" runat="server" Text=">> Reporte de Afiliados"  
                    class="btn btn-info btn-lg" onclick="Reporte_Afiliados"/>
                <br /> <br />
            </td>
            </tr>
             <tr>
                <td>&nbsp;</td>
                <td align="center">
                    <asp:Button ID="Button2" runat="server" Text=">> Reporte de Órdenes"  
                        class="btn btn-info btn-lg" onclick="Reporte_Ordenes"/>
                    <br />
                </td>
                </tr>
            <tr>
                <td>&nbsp;</td>
                <td align="center">
                    &nbsp;

                </td>
            </tr>                    
           <tr>
                <td>&nbsp;</td>
                <td align="center">
                    <asp:Button ID="Button3" runat="server" Text=">> Reporte de Órdenes por Comercio"  
                        class="btn btn-info btn-lg" onclick="Reporte_OrdenesPorComercio"/>
                    <br />
                </td>
                </tr>
     </table>
    <br />
    <table id="tblgv" runat="server"  width="100%">
            <tr>
            <td>
                
            </td>
            </tr>         
        </table>
    <asp:Label ID="lblRefresh" runat="server" Visible="False"></asp:Label>
</asp:Content>