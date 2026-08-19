<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportesEjecutivos.aspx.cs" Inherits="A.ReportesEjecutivosA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .auto-style1 {
            height: 88px;
        }
        .auto-style2 {
            height: 13px;
        }
        .auto-style3 {
            height: 38px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2><span class="glyphicon glyphicon-share-alt" style="font-size: 27px; color:chocolate"></span> <span class="glyphicon glyphicon-list-alt" style="font-size: 25px; color:chocolate"></span>&nbsp;&nbsp;<asp:Label ID="Titulo" runat="server"></asp:Label></h2>
    <hr style="border-color:#CCC;"/>
    <table id="TablebOT" runat="server"  width="90%" align="center" >
            
         <tr>
             
            <td><h4>Mostrar Informe Financiero</h4></td>
            <td align="center">
                <asp:Button ID="Btn_Financiero" runat="server" Text=">> Ver informe Financiero" onclick="Btn_Financiero_Click" class="btn btn-info btn-lg"/>
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