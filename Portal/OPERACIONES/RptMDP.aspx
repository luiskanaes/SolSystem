﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MPAdmin.master" AutoEventWireup="true" CodeFile="RptMDP.aspx.cs" Inherits="OPERACIONES_RptMDP" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-12">


            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%">
                <LocalReport EnableExternalImages="True">
                </LocalReport>
            </rsweb:ReportViewer>


        </div>

    </div>
</asp:Content>

