<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="A.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Iniciar Sesión</h2>
    <hr />
    <br />
<div class="row">
    <div class="col-md-8">
    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" 
        RenderOuterTable="false" DestinationPageUrl="~/Inicio/Default.aspx">
        <LayoutTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification"
                ValidationGroup="LoginUserValidationGroup" />
            <div class="accountInfo">
                <fieldset class="login">
                    <div class="form-group">
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Usuario:</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                CssClass="failureNotification" ErrorMessage="El nombre de usuario es obligatorio."
                                ToolTip="El nombre de usuario es obligatorio." ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Contraseña:</asp:Label>
                        <div class="col-md-10">
                        <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                            CssClass="failureNotification" ErrorMessage="La contraseña es obligatoria." ToolTip="La contraseña es obligatoria."
                            ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox ID="RememberMe" runat="server"  Visible="false"/>
                                <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline" Visible="false">Mantenerme conectado</asp:Label>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <br />
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Iniciar sesión" class="btn btn-primary"
                        ValidationGroup="LoginUserValidationGroup" />
                    </div>
                </div>
            </div>
        </LayoutTemplate>
    </asp:Login>
    </div>
</div>
</asp:Content>