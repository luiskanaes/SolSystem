﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MPAdmin.master" AutoEventWireup="true" CodeFile="Minuta.aspx.cs" Inherits="OPERACIONES_Minuta" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        a.imjusttext {
            text-decoration: none;
        }

            a.imjusttext:hover {
                text-decoration: none;
                position: relative;
                top: 1px;
            }

        .ajax__tab_xp .ajax__tab_tab {
            color: black;
        }

        .custom-combobox {
            position: relative;
            display: inline-block;
            width: 100%;
        }

        .textbox {
            background: #F1F1F1 url(http://html-generator.weebly.com/files/theme/input-text-40.png) no-repeat;
            background-position: 5px -7px !important;
            padding: 10px 10px 10px 25px;
            width: 270px;
            border: 1px solid #CCC;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            -moz-box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
            -webkit-box-shadow: 0 1px 1px #CCC inset, 0 1px 0 #FFF;
            box-shadow: 0 1px 1px #CCC inset, 0 1px 0 #FFF;
        }

        .zoom {
            transition: 0.5s ease;
            -moz-transition: 0.5s ease; /* Firefox */
            -webkit-transition: 0.5s ease; /* Chrome - Safari */
            -o-transition: 0.5s ease; /* Opera */
        }

            .zoom:hover {
                transform: scale(1.5);
                -moz-transform: scale(1.5); /* Firefox */
                -webkit-transform: scale(1.5); /* Chrome - Safari */
                -o-transform: scale(1.5); /* Opera */
                -ms-transform: scale(1.5); /* IE9 */
            }

        .textbox:focus {
            background-color: #FFF;
            border-color: #E8C291;
            outline: none;
            -moz-box-shadow: 0 0 0 1px #e8c291 inset;
            -webkit-box-shadow: 0 0 0 1px #E8C291 inset;
            box-shadow: 0 0 0 1px #E8C291 inset;
        }

        .dropmenuScroll {
            height: 300px;
            max-height: 300px;
            overflow-y: scroll;
            position: absolute;
        }

        .custom-combobox-toggle {
            position: absolute;
            top: 0;
            bottom: 0;
            margin-left: -1px;
            padding: 0;
            width: 100%;
            /* support: IE7 */
            *height: 1.7em;
            *top: 0.1em;
        }

        .custom-combobox-input {
            margin: 0;
            padding: 0.75em;
            width: 67%;
            height: 100%;
        }


        /*Demo fix*/
        .custom-combobox a {
            height: 45px;
            width: 14px;
            margin-top: -6px;
        }

        .comboAuto {
            height: 45px;
            width: 14px;
            margin-top: -6px;
            margin: 0;
            padding: 0.75em;
            width: 67%;
            height: 100%;
        }

        .Tb table {
            width: 100%;
            border-collapse: collapse;
        }

        .Tb tr:nth-of-type(odd) {
            background: #f2f2f2;
        }

        .Tb tr:nth-of-type(even) {
            background: #fbfbfb;
        }

        .Tb th {
            background: #195183;
            color: white;
            font-weight: bold;
        }

        .Tb td, .Tb th {
            padding: 6px;
            border: 1px solid #ccc;
            text-align: left;
        }
        .LvColor{color: #0000FF;}

        @media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px) {


            .Tb table, .Tb thead, .Tb tbody, .Tb th, .Tb td, .Tb tr {
                display: block;
            }


                .Tb thead tr {
                    position: absolute;
                    top: -9999px;
                    left: -9999px;
                }

            .Tb tr {
                border: 1px solid #ccc;
            }

            .Tb td {
                border: none;
                border-bottom: 1px solid #eee;
                position: relative;
                padding-left: 50%;
            }

                .Tb td:before {
                    position: absolute;
                    top: 6px;
                    left: 6px;
                    width: 45%;
                    padding-right: 10px;
                    white-space: nowrap;
                }


                .Tb td:nth-of-type(1):before {
                    content: "Item";
                }

                .Tb td:nth-of-type(2):before {
                    content: "Dni";
                }

                .Tb td:nth-of-type(3):before {
                    content: "Participante";
                }

                .Tb td:nth-of-type(4):before {
                    content: "Cargo";
                }

                .Tb td:nth-of-type(5):before {
                    content: "Eliminar";
                }
        }


        @media only screen and (min-device-width : 320px) and (max-device-width : 480px) {
            .Tb body {
                padding: 0;
                margin: 0;
                width: 320px;
            }
        }

        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) {
            .Tb body {
                width: 495px;
            }
        }

        .auto-style2 {
            height: 25px;
        }
    </style>

    <script type="text/javascript">
        var Guardar;
        function DeseaGuardar() {
            window.document.Form1.txtOculto.value = Guardar;
            __doPostBack('btnComentario', '');
        }
        function Ejecutar() {
            //Agregamos el JS para pasar el parametro</span>
            var param = '';
            param = 'valor=' + window.document.Form1.TextBox1.value;
            WizardGeneral(200, 550, 'Default2.aspx', param);
        }

        document.onselectstart = function () { return false; }

        function submitButton(event) {
            if (event.which == 13) {
                $('#Button1').trigger('click');
            }
        }
        function doAlert(mensaje) {
            var msg = new DOMAlert(
            {
                title: 'Mensaje del Sistema :',
                text: '<br/>' + mensaje,
                skin: 'default',
                width: 300,
                height: 80,
                ok: { value: true, text: 'Aceptar', onclick: showValue },

            });
            msg.show();
        };

        $('.btnComentario').on('click', function () {
            swal({
                title: 'Multiple inputs',
                html: '<input id="swal-input1" class="swal2-input" autofocus><input id="swal-input2" class="swal2-input">',
                preConfirm: function () {
                    return new Promise(function (resolve) {
                        resolve([
                          $('#swal-input1').val(),
                          $('#swal-input2').val()
                        ]);
                    });
                }
            }).then(function (result) {
                swal(JSON.stringify(result));
            }).done();
        });

        function showValue(sender, value) {
            sender.close();

        }
        function pageLoad() {
            //Auto populate dropdown list.
            (function ($) {
                $.widget("custom.combobox", {
                    _create: function () {
                        this.wrapper = $("<span>")
                          .addClass("custom-combobox")
                          .insertAfter(this.element);

                        this.element.hide();
                        select = this.element.hide();
                        this._createAutocomplete(select);
                        this._createShowAllButton(select);
                        console.log(this.element.attr("id") + " : " + select.is(':focus'));
                    },

                    _createAutocomplete: function (select) {
                        var selected = this.element.children(":selected"),
                            select = this.element.hide(),
                          value = selected.val() ? selected.text() : "";
                        var disabled = select.is(':disabled');

                        this.input = $("<input>")
                          .appendTo(this.wrapper)
                          .val(value)
                          .attr("title", "")
                          .addClass("custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left")
                          .attr('disabled', disabled)
                          .autocomplete({
                              delay: 0,
                              minLength: 0,
                              source: $.proxy(this, "_source")
                          })
                           .focus(function () {

                           })
                          .tooltip({
                              tooltipClass: "ui-state-highlight"
                          });

                        this._on(this.input, {
                            autocompleteselect: function (event, ui) {
                                ui.item.option.selected = true;
                                this._trigger("select", event, {
                                    item: ui.item.option
                                });
                                __doPostBack('<%=Upnl.ClientID%>', this.element.attr("id"));
                                __doPostBack('<%=UpnlPersona.ClientID%>', this.element.attr("id"));
                                __doPostBack('<%=UpnlUsuarioComent.ClientID%>', this.element.attr("id"));

                            },
                            autocompletechange: "_removeIfInvalid"
                        });
                    },

                    _createShowAllButton: function (select) {
                        var input = this.input,
                          wasOpen = false;
                        var disabled = select.is(':disabled');
                        $("<a>")
                          .attr("tabIndex", -1)
                          .attr('disabled', disabled)
                          .appendTo(this.wrapper)
                          .button({
                              icons: {
                                  primary: "ui-icon-triangle-1-s"
                              },
                              text: false
                          })
                          .removeClass("ui-corner-all")
                          .addClass("custom-combobox-toggle ui-corner-right")
                          .mousedown(function () {
                              wasOpen = input.autocomplete("widget").is(":visible");
                          })
                          .click(function () {
                              if ($(this).attr('disabled')) {
                                  return false;
                              }
                              input.focus();

                              // Close if already visible
                              if (wasOpen) {
                                  return;
                              }

                              // Pass empty string as value to search for, displaying all results
                              input.autocomplete("search", "");
                          });
                    },

                    _source: function (request, response) {
                        var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
                        response(this.element.children("option").map(function () {
                            var text = $(this).text();
                            if (this.value && (!request.term || matcher.test(text)))
                                return {
                                    label: text,
                                    value: text,
                                    option: this
                                };
                        }));
                    },

                    _removeIfInvalid: function (event, ui) {

                        // Selected an item, nothing to do
                        if (ui.item) {
                            return;
                        }

                        // Search for a match (case-insensitive)
                        var value = this.input.val(),
                          valueLowerCase = value.toLowerCase(),
                          valid = false;
                        this.element.children("option").each(function () {
                            if ($(this).text().toLowerCase() === valueLowerCase) {
                                this.selected = valid = true;
                                return false;
                            }
                        });

                        // Found a match, nothing to do
                        if (valid) {
                            return;
                        }

                        // Remove invalid value
                        if (value != '') {
                            this.input
                              .val("")
                              .attr("title", "No se encontro ningun elemento: " + value)
                              .tooltip("open");
                            this.element.val("");
                            this._delay(function () {
                                this.input.tooltip("close").attr("title", "");
                            }, 2500);
                            this.input.data("ui-autocomplete").term = "";
                        } else {
                            this.input.val("");
                            this.element.val("");
                            this.input.data("ui-autocomplete").term = "";
                        }
                        __doPostBack('<%=Upnl.ClientID%>', this.element.attr("id"));


                        __doPostBack('<%=UpnlPersona.ClientID%>', this.element.attr("id"));

                        __doPostBack('<%=UpnlUsuarioComent.ClientID%>', this.element.attr("id"));

                    },

                    _destroy: function () {
                        this.wrapper.remove();
                        this.element.show();
                    }
                });
            })(jQuery);

            $(document).ready(function () {
                $("#<%= ddl.ClientID %>").combobox();
                $("#<%= ddlPersona.ClientID %>").combobox();
                <%-- $("#<%= ddlUsuarioComt.ClientID %>").combobox();--%>

            });
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="udpHojaGestion" runat="server">
        <ContentTemplate>
            <script type="text/javascript" language="javascript">
                var ModalProgress = '<%= ModalProgress.ClientID %>';
               
            </script>
            <script type="text/javascript" src="../js/jsUpdateProgress.js"></script>
            <h4>Acta de Reunión</h4>
            <hr />

            <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="2" VerticalStripWidth="" Width="100%">
                <cc1:TabPanel ID="TabPanel0" runat="server" HeaderText="Agenda">
                    <HeaderTemplate>
                        Agenda
                    </HeaderTemplate>
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-md-12">
                                <br />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:ImageButton ID="cbxLimpiarBandeja" runat="server" ImageUrl="~/imagenes/boton.limpiar.gif" OnClick="cbxLimpiarBandeja_Click" />
                            </div>

                            <div class="col-md-6" style="text-align: right; font-size: 0.8em; font-weight: bold;">
                                <asp:Label ID="txtOpciones" runat="server" Text="MOSTRAR POR:  "></asp:Label>
                                <asp:CheckBox ID="cbxcambiarTema" AutoPostBack="True" runat="server" Text="Temas" Checked="True" OnCheckedChanged="cbxcambiarTema_CheckedChanged" />
                                <asp:CheckBox ID="cbxcambiarMinuta" AutoPostBack="True" runat="server" OnCheckedChanged="cbxcambiar_CheckedChanged" Text="Minutas" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12" style="text-align: right; font-size: 0.8em; font-weight: bold;">
                                <asp:Label ID="lblEnviar" runat="server" Text="Enviar a :  "></asp:Label>
                                <asp:CheckBox ID="cbxTodos" AutoPostBack="True" runat="server" Text="Todos" OnCheckedChanged="cbxTodos_CheckedChanged"/>
                                <asp:CheckBox ID="cbxNinguno" AutoPostBack="True" runat="server"  Text="Ninguno" OnCheckedChanged="cbxNinguno_CheckedChanged" />
                            </div>
                        </div>
                        <div class="row" runat="server" id="tablaTemas1">
                            <center>

                                    <table id="tbl_Minuta2"  class ="Tb" aria-hidden="False">
                                    <thead>

                                        <tr align="center" style="text-align: center; width:50px; height:15px;">

                                            <th width="3%"  style="text-align:center;font-size:0.8em;font-weight:bold;" class="auto-style2" rowspan="2">
                                                N°
                                            </th>
                                            <th width="34%" style="text-align: center;"  class="auto-style2">
                                                <asp:Panel ID="panel7" runat="server" DefaultButton="btnFiltrar">
                                                <asp:TextBox ID="txtFiltro" placeholder="FILTRO DE BUSQUEDA DE TEMAS"
                                                     style="border-radius: 25px;display:inline-block;width:100%;margin:0 auto 0 auto; border: 2px solid #FFF;" runat="server" Font-Size="XX-Small" Font-Bold="True" ></asp:TextBox> 
                                                </asp:Panel>
                                                </th>
                                            <th width="6%">
                                                <asp:Panel ID="panelBanResponsable" runat="server" DefaultButton="btnFiltrar">
                                                    <asp:DropDownList ID="ddlBanResponsable" runat="server"  CssClass="ddl" style="border-radius: 25px;  border: 2px solid #FFF;padding-left:0%;padding-right:0%; padding:0px 0px;" Font-Size="0.614em" Font-Bold="True"></asp:DropDownList>
                                                </asp:Panel>
                                            </th>
                                            <th width="6%">
                                                <asp:Panel ID="panelBanDestino" runat="server" DefaultButton="btnFiltrar">
                                                    <asp:DropDownList ID="ddlBanDestino" runat="server"  CssClass="ddl" style="border-radius: 25px;  border: 2px solid #FFF;padding-left:0%;padding-right:0%; padding:0px 0px;" Font-Size="0.614em" Font-Bold="True"></asp:DropDownList>
                                                </asp:Panel>
                                            </th>
                                            <th width="7%">
                                                <asp:Panel ID="panelBanReunion" runat="server" DefaultButton="btnFiltrar">
                                                <asp:DropDownList ID="ddlBanTipoReunion" runat="server"  CssClass="ddl" style="border-radius: 25px;  border: 2px solid #FFF;padding-left:0%;padding-right:0%; padding:1px 5px;" Font-Size="0.614em" Font-Bold="True"></asp:DropDownList>
                                                </asp:Panel>    
                                            </th>
                                            <th width="7%" style="text-align: center;" class="auto-style2">
                                                <asp:Panel ID="panelRequerimiento" runat="server" DefaultButton="btnFiltrar">
                                                <asp:TextBox ID="txtBanRequerimiento" runat="server" Font-Size="0.614em" Font-Bold="True" Font-Overline="False" style="padding-left:0%;text-align: center;padding-right:0%;border-radius: 25px;  border: 2px solid #FFF;" Font-Underline="False" ></asp:TextBox>
                                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server" AcceptNegative="Left" DisplayMoney="Left" ErrorTooltipEnabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txtBanRequerimiento" BehaviorID="_content_txtRequerimiento_MaskedEditExtender2" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" />
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" PopupButtonID="ImgBntCalc" TargetControlID="txtBanRequerimiento" BehaviorID="_content_txtRequerimiento_CalendarExtender2" />
                                                </asp:Panel>
                                            </th>
                                            <th width="7%" style="text-align: center;" class="auto-style2">
                                                <asp:Panel ID="panelCierre" runat="server" DefaultButton="btnFiltrar">
                                                <asp:TextBox ID="txtBanCierre" runat="server" Font-Size="0.614em" Font-Bold="True" Font-Overline="False" style="padding-left:0%;text-align: center;padding-right:0%;border-radius: 25px;  border: 2px solid #FFF;" Font-Underline="False" ></asp:TextBox>
                                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender4" runat="server" AcceptNegative="Left" DisplayMoney="Left" ErrorTooltipEnabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txtBanCierre" BehaviorID="_content_txtRequerimiento_MaskedEditExtender2" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" />
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd/MM/yyyy" PopupButtonID="ImgBntCalc" TargetControlID="txtBanCierre" BehaviorID="_content_txtRequerimiento_CalendarExtender2" />
                                                </asp:Panel>
                                            </th>
                                            <th width="7%" style="text-align: center;" class="auto-style2">
                                                <asp:Panel ID="panelCompromiso" runat="server" DefaultButton="btnFiltrar">
                                                <asp:TextBox ID="txtBanCompromiso" runat="server" Font-Size="0.614em" Font-Bold="True" Font-Overline="False" style="padding-left:0%;text-align: center;padding-right:0%;border-radius: 25px;  border: 2px solid #FFF;" Font-Underline="False" ></asp:TextBox>
                                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender5" runat="server" AcceptNegative="Left" DisplayMoney="Left" ErrorTooltipEnabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txtBanCompromiso" BehaviorID="_content_txtRequerimiento_MaskedEditExtender2" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" />
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd/MM/yyyy" PopupButtonID="ImgBntCalc" TargetControlID="txtBanCompromiso" BehaviorID="_content_txtRequerimiento_CalendarExtender2" />
                                                </asp:Panel>
                                            </th>
                                            <th width="7%" style="text-align: center;" class="auto-style2">
                                                <asp:Panel ID="panelModificado1" runat="server" DefaultButton="btnFiltrar">
                                                <asp:TextBox ID="txtBanModificado" runat="server" Font-Size="0.614em" Font-Bold="True" Font-Overline="False" style="padding-left:0%;text-align: center;padding-right:0%;border-radius: 25px;  border: 2px solid #FFF;" Font-Underline="False" ></asp:TextBox>
                                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender" runat="server" AcceptNegative="Left" DisplayMoney="Left" ErrorTooltipEnabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txtBanModificado" BehaviorID="_content_txtRequerimiento_MaskedEditExtender2" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" />
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender" runat="server" Format="dd/MM/yyyy" PopupButtonID="ImgBntCalc" TargetControlID="txtBanModificado" BehaviorID="_content_txtRequerimiento_CalendarExtender2" />
                                                </asp:Panel>
                                            </th>
                                            <th width="9%" style="text-align: center;" class="auto-style2">
                                                <asp:Panel ID="panelEstado" runat="server" DefaultButton="btnFiltrar">                                                
                                               <asp:DropDownList ID="ddlEstadoFiltro" runat="server"  style="border-radius: 25px;  border: 2px solid #FFF;padding-left:0%;text-align: center;padding-right:0%;" Font-Size="0.6em" Font-Bold="True" CssClass="ddl"></asp:DropDownList>
                                                </asp:Panel>
                                            </th>
                                            
                                            <th width="8%" class="auto-style2" colspan="2">
                                                <asp:ImageButton ID="btnFiltrar" runat="server" ImageUrl="~/imagenes/boton.buscar.gif"  ToolTip="Actualizar Acuerdo" OnClick ="btnFiltrar_Click" ImageAlign="Top" style="padding-left:3px;padding-right:5px; " Height="28px" Width="100%"/>
                                            </th>
                                        </tr>                                        
                                        <tr  align="center" style="background-color: #195183; color: White; text-align: center; font-family: Arial, sans-serif; font-size: 13px; width:50px; height:15px;" class ="Tb">
                                            <th width="34%" style="text-align: center; font-size: 0.8em;font-weight: bold;">TEMA</th>
                                            <th width="6%" style="text-align: center; font-size: 0.8em;font-weight: bold;">RES.</th>
                                            <th width="6%" style="text-align: center; font-size: 0.8em;font-weight: bold;">DESTINO</th>
                                            <th width="7%" style="text-align: center; font-size: 0.8em;font-weight: bold;">REUNIÓN</th>
                                            <th width="7%" style="text-align: center; font-size: 0.8em;font-weight: bold;">F.REQ</th>
                                            <th width="7%" style="text-align: center; font-size: 0.8em;font-weight: bold;">F.CIERRE</th>
                                            <th width="7%" style="text-align: center; font-size: 0.8em;font-weight: bold;">F.COM</th>
                                            <th width="7%" style="text-align: center; font-size: 0.8em;font-weight: bold;">F.MOD</th>
                                            <th width="7%" style="text-align: center; font-size: 0.8em;font-weight: bold;">ESTADO</th>
                                           <th width="1%" style="text-align: center; font-size: 0.8em;font-weight: bold;">VER</th>
                                           <th width="7%" style="text-align: center; font-size: 0.8em;font-weight: bold;">
                                               <asp:ImageButton ID="btnEnviarMinuta" runat="server" ImageUrl="~/imagenes/boton.enviar.gif" ToolTip="Actualizar Acuerdo" OnClick ="EnviarCorreoMinuta" ImageAlign="Top" Width="100%"  style="float:inherit;"/>
                                           </th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView runat="server" ID="ListView4" DataKeyNames="codMinuta,codAcuerdo">
                                            <ItemTemplate>
                                                <tr style="font-family: Arial, sans-serif; font-size: 12px; border: double; border-width: 1px;">
                                                    <td style="text-align: center;font-size: 0.8em;">
                                                        <%#Eval("num") %>
                                                    </td>

                                                    <td style="font-size: 0.8em;">                                                       
                                                    <%# Eval("tema") %>   
                                                    </td>
                                                    <td style="text-align: left;text-align: center; font-size: 0.8em;">
                                                        <%#Eval("inicialResponsable") %>
                                                    </td>
                                                    <td style="text-align: left;text-align: center; font-size: 0.8em;">
                                                        <%#Eval("destino") %>
                                                    </td>
                                                    <td style="text-align: left; font-size: 0.8em;">
                                                        <%#Eval("registro") %>
                                                    </td>
                                                    </td>
                                                    <td style="text-align: center; font-size: 0.8em;">
                                                        <%#Eval("fechaRequerimiento") %>
                                                    </td >
                                                    <td style="text-align: center; font-size: 0.8em;">
                                                        <%#Eval("fechaCierre") %>
                                                    </td>
                                                    <td style="font-size: 0.8em;">
                                                        <%#Eval("fechaCompromiso") %>
                                                    </td>
                                                      <td style="font-size: 0.8em;">
                                                        <%#Eval("fechaActual") %>
                                                    </td>                                                  
                                                    <td  style="text-align: center; font-size: 0.8em;font-weight: bold;">
                                                        <%#Eval("estado") %>
                                                    </td>
                                                    <td  style="width:50px; height:15px;text-align:center;">
                                                        <asp:ImageButton ID="btnEditar" CssClass="zoom" runat="server" ImageUrl="~/imagenes/PencilAdd.png" CommandArgument='<%# Eval("codMinuta") %>' ToolTip="Seleccionar compromiso" OnClick ="SelectCompromisoTemas" ImageAlign="Top" Width="20px" ValidateRequestMode="Inherit"  style="float:inherit;"/>
                                                           
                                                                                                                      
                                                    </td>
                                                    <td  style="width:50px;text-align:center;"> 
                                                        <asp:CheckBox ID="cbxEnviarCorreo" runat="server"></asp:CheckBox>
                                                       
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </tbody>
                                </table>
                                </center>
                        </div>

                        <div class="row" runat="server" id="tablaMinutas02Div">
                            <center>

                                    <table id="tablaMinuta2"  style ="width :98%;" class ="Tb" aria-hidden="False">
                                    <thead>
                                        <tr  align="center" style="background-color: #195183; color: White; text-align:center;font-family: Arial, sans-serif; font-size: 13px; width:50px; height:15px;" class ="Tb">
                                            <th width="3%" style="text-align: center; font-size: 0.8em;font-weight: bold;" rowspan="2">N°</th>
                                            <th width="34%">
                                                <asp:Panel ID="panel8" runat="server" DefaultButton="btnBuscarminutas1">
                                                <asp:TextBox ID="txtMinAsunto" placeholder="FILTRO DE BUSQUEDA DE MINUTAS" runat="server"  style="border-radius: 25px;  border: 2px solid #FFF; display:inline-block;width:100%;margin:0 auto 0 auto; border: 2px solid #FFF;" Font-Size="XX-Small" Font-Bold="True"></asp:TextBox>
                                                </asp:Panel>
                                            </th>
                                            <th width="18%">
                                                <asp:Panel ID="panelEncargado" runat="server" DefaultButton="btnBuscarminutas1">
                                                <asp:TextBox ID="txtMinEncargado" runat="server" Font-Size="XX-Small" Font-Bold="True" style="border-radius: 25px;  border: 2px solid #FFF;"></asp:TextBox>
                                                </asp:Panel>    
                                                </th>
                                            <th width="10%"><asp:DropDownList ID="ddlMinReunion" runat="server"  CssClass="ddl" style="border-radius: 25px;  border: 2px solid #FFF; padding:2px 12px;" Font-Size="0.8em" Font-Bold="True"></asp:DropDownList></th>
                                            <th width="12%">
                                                <asp:Panel ID="panelLugar" runat="server" DefaultButton="btnBuscarminutas1">
                                                <asp:TextBox ID="txtMinLugar" runat="server" Font-Size="XX-Small" style="border-radius: 25px;  border: 2px solid #FFF;" Font-Bold="True"></asp:TextBox>
                                                </asp:Panel>
                                            </th>
                                            <th width="7%">
                                                <asp:Panel ID="panel9" runat="server" DefaultButton="btnBuscarminutas1">
                                                <asp:TextBox ID="txtMinFecha" runat="server" Font-Size="0.8em" Font-Bold="True" Font-Overline="False" style="padding-left:0%;text-align: center;padding-right:0%;border-radius: 25px;  border: 2px solid #FFF;" Font-Underline="False" ></asp:TextBox>
                                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender6" runat="server" AcceptNegative="Left" DisplayMoney="Left" ErrorTooltipEnabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txtMinFecha" BehaviorID="_content_txtRequerimiento_MaskedEditExtender2" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" />
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender5" runat="server" Format="dd/MM/yyyy" PopupButtonID="ImgBntCalc" TargetControlID="txtMinFecha" BehaviorID="_content_txtRequerimiento_CalendarExtender2" />
                                                </asp:Panel>
                                            </th>
                                            <th width="7%">
                                                <asp:Panel ID="panelModificado" runat="server" DefaultButton="btnBuscarminutas1">
                                                <asp:TextBox ID="txtMinfechaModificado" runat="server" Font-Size="0.8em" Font-Bold="True" Font-Overline="False" style="padding-left:0%;text-align: center;padding-right:0%;border-radius: 25px;  border: 2px solid #FFF;" Font-Underline="False" ></asp:TextBox>
                                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender7" runat="server" AcceptNegative="Left" DisplayMoney="Left" ErrorTooltipEnabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txtMinfechaModificado" BehaviorID="_content_txtRequerimiento_MaskedEditExtender2" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" />
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender6" runat="server" Format="dd/MM/yyyy" PopupButtonID="ImgBntCalc" TargetControlID="txtMinfechaModificado" BehaviorID="_content_txtRequerimiento_CalendarExtender2" />
                                                </asp:Panel>                                            
                                            </th>
                                            <th width="8%">
                                                <asp:DropDownList ID="ddlMinPeriodo" runat="server" CssClass="ddl" style="border-radius: 25px;  border: 2px solid #FFF;text-align: center;padding-left:0%;padding-right:0%;" Font-Size="0.8em" Font-Bold="True">
                                                            <asp:ListItem Value="0">-- TODO --</asp:ListItem>
                                                            <asp:ListItem Value="DIARIO">Diario</asp:ListItem>
                                                            <asp:ListItem Value="SEMANAL">Semanal</asp:ListItem>
                                                            <asp:ListItem Value="QUINCENAL">Quincenal</asp:ListItem>
                                                            <asp:ListItem Value="MENSUAL">Mensual</asp:ListItem>
                                                           </asp:DropDownList>
                                                </th>
                                            <th width="7%"><asp:ImageButton ID="btnBuscarminutas1" runat="server" ImageUrl="~/imagenes/boton.buscar.gif" 
                                                            ToolTip="Actualizar Acuerdo" ImageAlign="Top" Width="100%" Height="30px" style="float:inherit;" OnClick="btnBuscarminutas1_Click"/></th>

                                        </tr>
                                        
                                        <tr  align="center" style="background-color: #195183;color: White;text-align:center;font-family: Arial, sans-serif; font-size: 13px; width:50px; height:15px;" class ="Tb">
                                            <th width="34%" style="text-align: center; font-size: 0.8em;font-weight: bold;">ASUNTO MINUTA</th>
                                            <th width="18%" style="text-align: center; font-size: 0.8em;font-weight: bold;">ENCARGADO</th>
                                            <th width="10%" style="text-align: center; font-size: 0.8em;font-weight: bold;">REUNIÓN</th>
                                            <th width="12%" style="text-align: center; font-size: 0.8em;font-weight: bold;">LUGAR</th>
                                            <th width="6%" style="text-align: center; font-size: 0.8em;font-weight: bold;">F.CRE</th>
                                            <th width="6%" style="text-align: center; font-size: 0.8em;font-weight: bold;">F.MOD</th>
                                            <th width="8%" style="text-align: center; font-size: 0.8em;font-weight: bold;">PERÍODO</th>
                                            <th width="7%" style="text-align: center; font-size: 0.8em;font-weight: bold;">VER DETALLE</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView runat="server" ID="ListViewMinutaBandeja">
                                            <ItemTemplate>
                                                <tr style="font-family: Arial, sans-serif; font-size: 12px; border: double; border-width: 1px;">
                                                    <td style="text-align: center;font-size: 0.8em;">
                                                        <%#Eval("num") %>
                                                    </td>

                                                    <td style="font-size: 0.8em;">                                                       
                                                    <%# Eval("asunto") %>   
                                                    </td>

                                                    </td>
                                                    <td style="text-align: left; font-size: 0.8em;">
                                                        <%#Eval("nombres") %>
                                                    </td >
                                                    <td style="text-align: left; font-size: 0.8em;">
                                                        <%#Eval("registro") %>
                                                    </td>
                                                    <td style="font-size: 0.8em;">
                                                        <%#Eval("lugar") %>
                                                    </td>
                                                    <td style="text-align: center;font-size: 0.8em;">
                                                        <%#Eval("fechaCreacion") %>
                                                    </td>
                                                    <td style="text-align: center;font-size: 0.8em;">
                                                        <%#Eval("fechaAct") %>
                                                    </td>
                                                    
                                                    <td  style="text-align: center; font-size: 0.8em;font-weight: bold;">
                                                        <%#Eval("tipoFecha") %>
                                                    </td>
                                                    <td  style="width:50px; height:15px;text-align:center">
                                                        <asp:ImageButton ID="btnEditar" CssClass="zoom" runat="server" ImageUrl="~/imagenes/PencilAdd.png" CommandArgument='<%# Eval("codMinuta") %>' ToolTip="Seleccionar compromiso" OnClick ="SelectCompromisoMinuta" ImageAlign="Top" Width="20px" ValidateRequestMode="Inherit"  style="float:inherit;"/>
                                                           
                                                                                                                      
                                                    </td>
<%--                                                    <td  style="width:50px; height:15px;text-align:center">
                                                        <asp:ImageButton ID="btnEnviarMinuta" runat="server" ImageUrl="~/imagenes/boton.enviar.gif" CommandArgument='<%# Eval("id_minuta") %>' ToolTip="Actualizar Acuerdo" OnClick ="EnviarCorreoMinuta" ImageAlign="Top" Width="100%"  ValidateRequestMode="Inherit"  style="float:inherit;"/>
                                                    </td>--%>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </tbody>
                                </table>
                                </center>
                        </div>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Minuta">
                    <ContentTemplate>
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <%--<asp:ImageButton ID="btnGuardarHistorial" runat="server" ImageUrl="~/imagenes/boton.agregar.gif" OnClick="btnGuardarHistorial_Click" />--%>
                                <asp:ImageButton ID="btnLimpiar" runat="server" ImageUrl="~/imagenes/boton.limpiar.gif"  OnClick="btnNuevo_Click" />
                            </div>

                        </div>
                        <div class="row">

                            <div class="col-md-3">
                            </div>
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtContrato" runat="server" Visible="False"></asp:TextBox>

                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-3">
                                <label>Reunión</label>
                                <asp:DropDownList ID="ddlRegistro" runat="server" CssClass="ddl" OnSelectedIndexChanged="ddlRegistro_SelectedIndexChanged" Style="font-size: 0.8em;">
                                </asp:DropDownList>

                            </div>
                            <div class="col-md-3">
                                <label>Lugar(Sede)</label>
                                <asp:TextBox ID="txtLugarSede" runat="server" Style="font-size: 0.8em;"></asp:TextBox>

                            </div>
                            <div class="col-md-3">
                                <label>Fecha</label>
                                <asp:TextBox ID="txtFechaMinuta" runat="server" Style="font-size: 0.8em;"></asp:TextBox>
                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" AcceptNegative="Left" DisplayMoney="Left" ErrorTooltipEnabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txtFechaMinuta" BehaviorID="_content_MaskedEditExtender1" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" />
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="ImgBntCalc" TargetControlID="txtFechaMinuta" BehaviorID="_content_CalendarExtender1" />

                            </div>
                            <div class="col-md-3">
                                <label>Periodo</label>
                                <asp:DropDownList ID="ddlListaDeFechas" runat="server" CssClass="ddl" Style="font-size: 0.8em;">
                                    <asp:ListItem>--- Seleccionar Perido ---</asp:ListItem>
                                    <asp:ListItem Value="DIARIO">DIARIO</asp:ListItem>
                                    <asp:ListItem Value="SEMANAL">SEMANAL</asp:ListItem>
                                    <asp:ListItem Value="QUINCENAL">QUINCENAL</asp:ListItem>
                                    <asp:ListItem Value="MENSUAL">MENSUAL</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                            </div>
                        </div>
                        <div class="row">


                            <div class="col-md-3">

                                <label>Asunto</label>
                                <asp:TextBox ID="txtAsunto" runat="server" CssClass="auto-style3" Style="font-size: 0.8em;"></asp:TextBox>
                            </div>
                            <div class="col-md-3">

                                <label>Elaborado por:</label>
                                <asp:DropDownList ID="ddlPersonalAcargo" runat="server" CssClass="ddl" Style="font-size: 0.8em;"></asp:DropDownList>

                            </div>
                            <div class="col-md-3">

                                <label>Hora Inicio</label>
                                <asp:TextBox ID="txtHoraInicio" runat="server" Style="font-size: 0.8em;"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="StartTimeMaskedEdit_Inicio" runat="server" TargetControlID="txtHoraInicio"
                                    Mask="99:99" MaskType="Time" CultureName="en-US"
                                    InputDirection="RightToLeft" ErrorTooltipEnabled="True" BehaviorID="_content_StartTimeMaskedEdit_Inicio" Century="2000" CultureAMPMPlaceholder="AM;PM" CultureCurrencySymbolPlaceholder="$" CultureDateFormat="MDY" CultureDatePlaceholder="/" CultureDecimalPlaceholder="." CultureThousandsPlaceholder="," CultureTimePlaceholder=":"></cc1:MaskedEditExtender>
                                <cc1:MaskedEditValidator ID="Mensaje1" runat="server"
                                    ControlExtender="StartTimeMaskedEdit_Inicio" ControlToValidate="txtHoraInicio" IsValidEmpty="False"
                                    MaximumValue="23:59" MinimumValue="00:00" EmptyValueMessage="Enter Time"
                                    MaximumValueMessage="23:59" InvalidValueBlurredMessage="Hora no valida" MinimumValueMessage="Time must be grater than 00:00"
                                    EmptyValueBlurredText="*" ToolTip="Enter time between 00:00 to 23:59" ForeColor="Red" Font-Size="X-Small" ErrorMessage="Mensaje1"></cc1:MaskedEditValidator>
                            </div>
                            <div class="col-md-3">

                                <label>Hora Termino</label>
                                <asp:TextBox ID="txtHoraFin" runat="server" Style="font-size: 0.8em;"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" TargetControlID="txtHoraFin"
                                    Mask="99:99" MaskType="Time" CultureName="en-US"
                                    InputDirection="RightToLeft" ErrorTooltipEnabled="True" BehaviorID="_content_MaskedEditExtender2" Century="2000" CultureAMPMPlaceholder="AM;PM" CultureCurrencySymbolPlaceholder="$" CultureDateFormat="MDY" CultureDatePlaceholder="/" CultureDecimalPlaceholder="." CultureThousandsPlaceholder="," CultureTimePlaceholder=":"></cc1:MaskedEditExtender>
                                <cc1:MaskedEditValidator ID="Mensaje2" runat="server"
                                    ControlExtender="StartTimeMaskedEdit_Inicio" ControlToValidate="txtHoraFin" IsValidEmpty="False"
                                    MaximumValue="23:59" MinimumValue="00:00" EmptyValueMessage="Enter Time"
                                    MaximumValueMessage="23:59" InvalidValueBlurredMessage="Hora no valida" MinimumValueMessage="Time must be grater than 00:00"
                                    EmptyValueBlurredText="*" ToolTip="Enter time between 00:00 to 23:59" ForeColor="Red" Font-Size="X-Small" ErrorMessage="Mensaje2"></cc1:MaskedEditValidator>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <label>N° Registro</label>
                                <asp:TextBox ID="txtRegistro" runat="server" MaxLength="20" ReadOnly="True" Enabled="False" BackColor="#F0F0F0" BorderStyle="Dotted" Style="font-size: 0.8em;"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label>Centro Costo</label>
                                <asp:TextBox ID="txtCodigoProyecto" runat="server" Enabled="False" BackColor="#F0F0F0" BorderStyle="Dotted" Style="font-size: 0.8em;"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label>Obra</label>
                                <asp:TextBox ID="txtObra" runat="server" ReadOnly="True" BackColor="#F0F0F0" BorderStyle="Dotted" Style="font-size: 0.8em;"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label>Cliente</label>
                                <asp:TextBox ID="txtCliente" runat="server" Style="font-size: 0.8em;"></asp:TextBox>

                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label ID="lblCodigoMinuta" runat="server" Visible="False"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <br />
                                <center>
                                         <asp:Button ID="btnGuardar" runat="server"  Text="Guardar Acta"  OnClick="btnGuardar_Click" CausesValidation="False" />
                                    </center>
                                <br />
                            </div>
                            <div class="col-md-4">
                            </div>
                        </div>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="Participante">
                    <HeaderTemplate>
                        Participante
                    </HeaderTemplate>
                    <ContentTemplate>
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <label>Asunto</label>
                                <asp:TextBox ID="txtAsuntoReunion" runat="server" ReadOnly="True" BackColor="#F0F0F0" Style="font-size: 0.8em;"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label>Agregar Personal</label>
                                <asp:UpdatePanel runat="server" ID="Upnl" OnLoad="Upnl_Load">
                                    <ContentTemplate>
                                        <div style="font-size: 0.8em;">
                                            <asp:DropDownList ID="ddl" runat="server" Width="100%">
                                            </asp:DropDownList>
                                            <link rel="stylesheet" href="../Content/jquery-ui.css" />
                                            <script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
                                            <script type="text/javascript" src="../js/jquery-ui.js"></script>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-md-4">
                                <br />
                                <asp:Button ID="btnAgregar" runat="server" Text="Agregar Personal" OnClick="btnAgregar_Click" CausesValidation="False" />
                            </div>

                        </div>
                        <div class="row">
                            <div id="page-wrap">

                                <table id="tbl_rol" style="width: 100%" class="Tb">
                                    <thead>

                                        <tr align="center" style="background-color: #195183; color: White; text-align: center; font-family: Arial, sans-serif; font-size: 13px;">
                                            <th style="text-align: center;">Item</th>
                                            <th width="15%" style="text-align: center">Dni</th>
                                            <th width="60%" style="text-align: center">Participante</th>
                                            <th width="40%" style="text-align: center">Cargo</th>
                                            <th width="10%" style="text-align: center">Eliminar</th>


                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView runat="server" ID="lstRol" DataKeyNames="ID_DNI">
                                            <ItemTemplate>
                                                <tr style="font-family: Arial, sans-serif; font-size: 12px; border: double; border-width: 1px;">
                                                    <td style="font-size: 0.84em;">
                                                        <%#Eval("N") %>
                                                    </td>
                                                    <td style="font-size: 0.84em;">
                                                        <%#Eval("ID_DNI") %>
                                                          
                                                    </td>
                                                    <td style="text-align: left; font-size: 0.84em;">
                                                        <%#Eval("NOMBRE_COMPLETO") %>
                                                    </td>
                                                    <td style="font-size: 0.84em;">
                                                        <%#Eval("CARGO_DESCRIPCION") %>
                                                    </td>

                                                    <td>
                                                        <asp:ImageButton ID="btnEliminar" OnClick="EliminarPersonal" runat="server" CommandArgument='<%# Eval("ID_DNI") %>' ImageUrl="~/imagenes/delete.png" CausesValidation="False" />
                                                        <cc1:ConfirmButtonExtender ID="cbe" runat="server" DisplayModalPopupID="mpe" TargetControlID="btnEliminar"></cc1:ConfirmButtonExtender>
                                                        <cc1:ModalPopupExtender ID="mpe" runat="server" PopupControlID="pnlPopup" TargetControlID="btnEliminar"
                                                            OkControlID="btnYesx" CancelControlID="btnNox" BackgroundCssClass="modalBackground">
                                                        </cc1:ModalPopupExtender>
                                                        <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none;">
                                                            <div class="header">
                                                                Advertencia
                                                            </div>
                                                            <div class="body">
                                                                Desea Eliminar Registro?
                                                            </div>
                                                            <div class="footer" align="right">
                                                                <asp:Button ID="btnYesx" runat="server" Text="Si" CssClass="yes" />
                                                                <asp:Button ID="btnNox" runat="server" Text="No" CssClass="no" />
                                                            </div>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </tbody>
                                </table>


                            </div>
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="Acuerdo">
                    <HeaderTemplate>
                        Acuerdo
                    </HeaderTemplate>
                    <ContentTemplate>
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <asp:ImageButton ID="btnNuevoDetalles" runat="server" ImageUrl="~/imagenes/boton.limpiar.gif" OnClick="btnNuevoDetalles_Click" />
                                <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" DisplayModalPopupID="ModalPopupExtender1" TargetControlID="btnNuevoDetalles" ConfirmText="" BehaviorID="_content_ConfirmButtonExtender1"></cc1:ConfirmButtonExtender>
                                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="btnNuevoDetalles"
                                    OkControlID="btnYesD" CancelControlID="btnNoD" BackgroundCssClass="modalBackground" BehaviorID="_content_ModalPopupExtender1" DynamicServicePath="">
                                </cc1:ModalPopupExtender>
                                <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none">
                                    <div class="header">
                                        Advertencia
                                    </div>
                                    <div class="body">
                                        Desea registrar un nuevo tema?
                                    </div>
                                    <div class="footer" align="right">
                                        <asp:Button ID="btnYesD" runat="server" Text="Si" CssClass="yes" />
                                        <asp:Button ID="btnNoD" runat="server" Text="No" CssClass="no" />
                                    </div>
                                </asp:Panel>

                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblCodigoTemas" runat="server" Font-Size="X-Small" ForeColor="Black" Visible="False"></asp:Label>
                            </div>
                            <div class="col-md-4" style="text-align: right; font-size: 0.8em; font-weight: bold;">
                                <asp:Label ID="Label2" runat="server" Text="MOSTRAR POR: "></asp:Label>
                                <asp:Label ID="lblCodigoAcuerdo" runat="server" Font-Size="X-Small" ForeColor="Black" Visible="False"></asp:Label>
                                <asp:CheckBox ID="cbxFiltroCerrado" AutoPostBack="True" runat="server" Text="Cerrados" OnCheckedChanged="cbxFiltroCerrado_CheckedChanged" />
                                <asp:CheckBox ID="cbxFiltroVencidos" AutoPostBack="True" runat="server" Text="Vencidos" OnCheckedChanged="cbxFiltroVencidos_CheckedChanged" />
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <center>
                                    <table id="tbl_Minuta"  style ="width:98%;" class ="Tb" aria-hidden="False">
                                    <thead>
                                        <tr  align="center" style="background-color: #195183; color: White; text-align: center; font-family: Arial, sans-serif; font-size: 13px; width:50px; height:15px;" class ="Tb">
                                            <th width="1%" style="text-align: center; font-size: 0.83em;font-weight: bold;">
                                                <asp:LinkButton ID="lbnItem" runat="server"  OnClick="Ordenar_Click1">N°</asp:LinkButton>
                                            </th>
                                            <th width="11%" style="text-align: center; font-size: 0.83em;font-weight: bold;">
                                                <asp:LinkButton ID="lbnArea" runat="server" CssClass="imjusttext" OnClick="Ordenar_Click2">ÁREA </asp:LinkButton>
                                            </th>
                                            <th width="21%" style="text-align: center; font-size: 0.83em;font-weight: bold;">TEMA</th>
                                            <th width="5%" style="text-align: center; font-size: 0.83em;font-weight: bold;">
                                                <asp:LinkButton ID="lbnResponsable" runat="server"  OnClick="Ordenar_Click3">RES.</asp:LinkButton>
                                            </th>
                                            <th width="6%" style="text-align: center; font-size: 0.83em;font-weight: bold;">DESTINO</th>
                                            <th width="7%" style="text-align: center; font-size: 0.83em;font-weight: bold;">
                                                <asp:LinkButton ID="LinkButton1" runat="server"  OnClick="Ordenar_Click4">F.REQ</asp:LinkButton>
                                            </th>
                                            <th width="7%" style="text-align: center;; font-size: 0.83em;font-weight: bold;">
                                                <asp:LinkButton ID="LinkButton2" runat="server"  OnClick="Ordenar_Click5">F.CIERRE</asp:LinkButton>
                                            </th>
                                            <th width="7%" style="text-align: center; font-size: 0.83em;font-weight: bold;">
                                                <asp:LinkButton ID="LinkButton3" runat="server"  OnClick="Ordenar_Click6">F.COM</asp:LinkButton>
                                            </th>
                                            <th width="21%" style="text-align: center; font-size: 0.83em;font-weight: bold;">COMENTARIO</th>
                                            <th width="9%" style="text-align: center; font-size: 0.83em;font-weight: bold;">
                                                <asp:LinkButton ID="lbnEstado" runat="server"  OnClick="Ordenar_Click7">ESTADO</asp:LinkButton>
                                            </th>
                                           <th width="5%" style="text-align: center; font-size: 0.83em;font-weight: bold;"></th>

                                        </tr>
                                        <tr align="center" style="text-align: center; width:50px; height:15px;">
                                            <th width="1%" style="text-align: center;" class="auto-style2">

                                            </th>
                                            <th width="11%" style="text-align: center;" class="auto-style2">
                                                <asp:DropDownList ID="ddlArea" runat="server" CssClass="ddl" style="text-align: center;padding-left:0%;padding-right:0%;" Font-Size="0.6em" Font-Bold="True" ></asp:DropDownList>
                                            </th>
                                            <th width="21%" style="text-align: center" class="auto-style2">
                                                <asp:TextBox ID="txtTema" runat="server" Font-Size="XX-Small" Font-Bold="True"></asp:TextBox>
                                            </th>
                                            <th width="5%" style="text-align: center;font-size: 0.8em;" class="auto-style2">
                                                <asp:UpdatePanel runat="server" ID="UpnlPersona" OnLoad="Upnl_LoadPersonal">
                                                <ContentTemplate>
                                              
                                                <asp:DropDownList ID="ddlPersona" runat="server" ></asp:DropDownList>
                                                <link rel="stylesheet" href="../Content/jquery-ui.css" />
                                                <script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
                                                <script type="text/javascript" src="../js/jquery-ui.js"></script>
                                            
                                                </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </th>
                                            <th width="6%" style="text-align: center" class="auto-style2">
                                                <asp:DropDownList ID="ddlDestino" runat="server" style="padding-left:0%;padding-right:0%;" CssClass="ddl" Font-Size="0.6em" Font-Bold="True"></asp:DropDownList>
                                            </th>
                                            <th width="7%" style="text-align: center" class="auto-style2">
                                                <asp:TextBox ID="txtRequerimiento" runat="server" Font-Size="0.614em" Font-Bold="True" Font-Overline="False" style="padding-left:0%;text-align: center;padding-right:0%;" Font-Underline="False" ></asp:TextBox>
                                                <ajaxToolkit:MaskedEditExtender ID="txtRequerimiento_MaskedEditExtender2" runat="server" AcceptNegative="Left" DisplayMoney="Left" ErrorTooltipEnabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txtRequerimiento" BehaviorID="_content_txtRequerimiento_MaskedEditExtender2" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" />
                                                <ajaxToolkit:CalendarExtender ID="txtRequerimiento_CalendarExtender2" runat="server" Format="dd/MM/yyyy" PopupButtonID="ImgBntCalc" TargetControlID="txtRequerimiento" BehaviorID="_content_txtRequerimiento_CalendarExtender2" />
                                            </th>
                                            <th width="7%" style="text-align: center" class="auto-style2">
                                                
                                                <asp:TextBox ID="txtCompromisoCierre" runat="server" Font-Size="0.614em" style="padding-left:0%;padding-right:0%;text-align: center;"  Font-Bold="True"></asp:TextBox>
                                                <ajaxToolkit:MaskedEditExtender ID="txtCompromisoCierre_MaskedEditExtender" runat="server" AcceptNegative="Left" DisplayMoney="Left" ErrorTooltipEnabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txtCompromisoCierre" BehaviorID="_content_txtCompromisoCierre_MaskedEditExtender" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" />
                                                <ajaxToolkit:CalendarExtender ID="txtCompromisoCierre_CalendarExtender" runat="server" Format="dd/MM/yyyy" PopupButtonID="ImgBntCalc" TargetControlID="txtCompromisoCierre" BehaviorID="_content_txtCompromisoCierre_CalendarExtender" />
                                            </th>
                                            <th width="7%" style="text-align: center" class="auto-style2">
                                                
                                                <asp:TextBox ID="txtCompromisoCierre0" runat="server" Font-Bold="True" style="padding-left:0%;text-align: center;padding-right:0%;" Font-Size="0.614em"></asp:TextBox>
                                                <cc1:MaskedEditExtender ID="txtCompromisoCierre0_MaskedEditExtender" runat="server" AcceptNegative="Left" BehaviorID="_content_txtCompromisoCierre_MaskedEditExtender" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" DisplayMoney="Left" ErrorTooltipEnabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txtCompromisoCierre0" />
                                                <cc1:CalendarExtender ID="txtCompromisoCierre0_CalendarExtender" runat="server" BehaviorID="_content_txtCompromisoCierre_CalendarExtender" Format="dd/MM/yyyy" PopupButtonID="ImgBntCalc" TargetControlID="txtCompromisoCierre0" />
                                                
                                            </th>
                                            
                                            <th width="21%" class="auto-style2">
                                                <asp:TextBox ID="txtAcuerdo" runat="server" Font-Size="XX-Small" Font-Bold="True"></asp:TextBox>
                                            </th>
                                            <th width="9%" class="auto-style2">
                                                <asp:DropDownList ID="ddlEstados" runat="server" CssClass="ddl" style="padding-left:0%;padding-right:0%;" Font-Size="0.6em" Font-Bold="True" ></asp:DropDownList>
                                            </th>
                                            <th width="5%" class="auto-style2">
                                                <center>
                                                <asp:ImageButton ID="btnAgregarAll" runat="server" ImageUrl="~/imagenes/Item_Add.png"  ToolTip="Guardar" CausesValidation="False" OnClick="btnAgregarAll_Click" style="width: 32px" />
                                                </center>
                                            </th>
                                        </tr>

                                    </thead>
                                    <tbody>
                                        <asp:ListView runat="server" ID="ListView3" DataKeyNames="id_temas,id_detalle_acuerdo">
                                            <ItemTemplate>
                                                <tr style="font-family: Arial, sans-serif; font-size: 12px; border: double; border-width: 1px;" id="trItem">
                                                    <td style="text-align: center;font-size: 0.8em;" class='<%#GetBackColor(Eval("id_detalle_acuerdo"))%>'>
                                                        <%#Eval("N") %>
                                                    </td>
                                                    <td style="text-align: center;font-size: 0.8em;" class='<%#GetBackColor(Eval("id_detalle_acuerdo"))%>'>
                                                        <%#Eval("AREA") %>
                                                    </td>
                                                    <td style="font-size: 0.8em;" class='<%#GetBackColor(Eval("id_detalle_acuerdo"))%>'>                                                       
                                                    <%# Eval("dsc_nombre_tema") %>                                                     
                                                    </td>
                                                    <td style="text-align: center;font-size: 0.8em;" class='<%#GetBackColor(Eval("id_detalle_acuerdo"))%>'>
                                                        <%#Eval("Inicial") %>
                                                    </td>
                                                    <td style="text-align: center;font-size: 0.8em;" class='<%#GetBackColor(Eval("id_detalle_acuerdo"))%>'>
                                                        <%#Eval("DES_ASUNTO") %>
                                                    </td>
                                                    <td style="text-align: center; font-size: 0.8em;" class='<%#GetBackColor(Eval("id_detalle_acuerdo"))%>'>
                                                        <%#Eval("fch_fecha_requerimiento") %>
                                                    </td >
                                                    <td style="text-align: center; font-size: 0.8em;" class='<%#GetBackColor(Eval("id_detalle_acuerdo"))%>'>
                                                        <%#Eval("fch_fecha_original") %>
                                                    </td>
                                                    <td style="font-size: 0.8em;" class='<%#GetBackColor(Eval("id_detalle_acuerdo"))%>'>
                                                        <%#Eval("fch_compromiso") %>
                                                        
                                                    </td>
                                                    
                                                    <td style="font-size: 0.8em;"class='<%#GetBackColor(Eval("id_detalle_acuerdo"))%>'>
                                                        <asp:ImageButton CssClass="zoom" ID="btnComentario" runat="server" ImageUrl="~/imagenes/Item_Add.png"
                                                             CommandArgument='<%# Eval("id_temas") %>' ToolTip="Agregar Comentario" OnClick="RegistrarComentario"  
                                                            Width="15px" ValidateRequestMode="Inherit" 
                                                            onmouseover="this.style.opacity=1;this.filters.alpha.opacity=100"
                                                            onmouseout="this.style.opacity=0.4;this.filters.alpha.opacity=40"
                                                            style="position:absolute;z-index:1;opacity:0.30;filter:alpha(opacity=30);"/>

                                                       <asp:TextBox ID="txtComentarioMultilinia" wrap="true" Height="100%" AutoPostBack="True" Text='<%# Eval("comentario") %>' 
                                                            BackColor="#f2f2f2" runat="server" 
                                                           style="font-size: 0.9em;border-style: solid;border-width:0;border-top-width: 0px;padding:0 0 0 0;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;"  Rows="3" TextMode="MultiLine" Enabled="False"  EnableTheming="True" EnableViewState="True" MaxLength="700"></asp:TextBox>                                                        
                                                    </td>
                                                    <td  style="text-align: center; font-size: 0.8em;font-weight: bold;"class='<%#GetBackColor(Eval("id_detalle_acuerdo"))%>'>
                                                        <%#Eval("Des_estado") %>
                                                    </td>
                                                    <td  style="width:50px; height:15px;">
                                                        <asp:ImageButton ID="btnEditar" CssClass="zoom" runat="server" ImageUrl="~/imagenes/PencilAdd.png" CommandArgument='<%# Eval("id_detalle_acuerdo") %>' ToolTip="Actualizar Acuerdo" OnClick ="SeleccionarAcuerdoID" ImageAlign="Top" Width="15px" ValidateRequestMode="Inherit"  style="float:left;"/>
                                                        <asp:ImageButton ID="btnDelete" CssClass="zoom" runat="server" ImageUrl="~/imagenes/Error.png" CommandArgument='<%# Eval("id_detalle_acuerdo") %>' ToolTip="Eliminar Acuerdo" OnClick="EliminarAcuerdos" Width="15px" ImageAlign="Top" ValidateRequestMode="Inherit" style="float:right;"  />
                                                        <%--<asp:ImageButton ID="btnComentario" runat="server" ImageUrl="~/imagenes/requerimiento.png" CommandArgument='<%# Eval("id_detalle_acuerdo") %>' ToolTip="Agregar Comentario" OnClick="RegistrarComentario" ImageAlign="Top" Width="15px" ValidateRequestMode="Inherit"  style="float:left;"/>--%>
                                                        <cc1:ConfirmButtonExtender ID="cbeEdit" runat="server" DisplayModalPopupID="mpeEdit" TargetControlID="btnDelete"></cc1:ConfirmButtonExtender>
	                                                    <cc1:ModalPopupExtender ID="mpeEdit" runat="server" PopupControlID="pnlPopupEdit" TargetControlID="btnDelete"
	                                                    OkControlID="btnYesE" CancelControlID="btnNoE" BackgroundCssClass="modalBackground">
	                                                    </cc1:ModalPopupExtender>
	                                                    <asp:Panel ID="pnlPopupEdit" runat="server" CssClass="modalPopup" Style="display: none">
	                                                    <div class="header">
	                                                    Mensaje
	                                                    </div>
	                                                    <div class="body">
	                                                    Desea Eliminar Acuerdo?
	                                                    </div>
	                                                    <div class="footer" align="right">
	                                                    <asp:Button ID="btnYesE" runat="server" Text="Si" CssClass="yes" />
	                                                    <asp:Button ID="btnNoE" runat="server" Text="No" CssClass="no" />
	                                                    </div>
	                                                    </asp:Panel>	                                                        
                                                                                                                      
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </tbody>
                                </table>
                                </center>
                        </div>


                        <div class="row">

                            <asp:HiddenField ID="HidRegistro" runat="server" />
                            <cc1:ModalPopupExtender ID="ModalRegistro"
                                runat="server"
                                BackgroundCssClass="modalBackground"
                                PopupControlID="pnlPopup4"
                                PopupDragHandleControlID="pnlPopup4"
                                TargetControlID="HidRegistro" BehaviorID="_content_ModalRegistro" DynamicServicePath="">
                            </cc1:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup4" runat="server" CssClass="modalPopup" Width="25%">
                                <table class="style1">


                                    <caption>
                                        <div class="header">
                                            COMENTARIO
                                        </div>
                                    </caption>
                                    <tr>
                                        <td width="5%">&nbsp;</td>
                                        <td width="90%" style="font-weight: bold; text-align: center;">Registre su comentario</td>
                                        <td width="5%">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="5%">&nbsp;</td>
                                        <td width="90%" style="text-align: center; font-size: 0.8em;" class="comboAuto">

                                            <asp:UpdatePanel runat="server" ID="UpnlUsuarioComent" OnLoad="Upnl_UsuarioComent">
                                                <ContentTemplate>

                                                    <asp:DropDownList ID="ddlUsuarioComt" Font-Size="X-Small" Font-Bold="True" runat="server" CssClass="ddl"></asp:DropDownList>
                                                    <link rel="stylesheet" href="../Content/jquery-ui.css" />
                                                    <script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
                                                    <script type="text/javascript" src="../js/jquery-ui.js"></script>

                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                        </td>
                                        <td width="5%">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="5%">&nbsp;</td>
                                        <td width="90%">
                                            <center>
                                                <asp:TextBox ID="txtComentarioUser" width = "284px" runat="server" rows="3"  EnableTheming="True"  Font-Size="XX-Small" Font-Bold="True" TextMode="MultiLine" placeholder="Ingrese Comentario"></asp:TextBox>
                                                </center>
                                        </td>
                                        <td width="5%">&nbsp;</td>
                                    </tr>

                                    <tr>
                                        <td width="5%">&nbsp;</td>
                                        <td width="90%">
                                            <center>
                                                <asp:Button ID="btnAgregarComentario" runat="server" Text="Aceptar" OnClick="RegistrarComentario" />
                                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"/>
                                                </center>
                                        </td>
                                        <td width="5%">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="5%">&nbsp;</td>
                                        <td width="90%">&nbsp;</td>
                                        <td width="5%">&nbsp;</td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>

                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel5" runat="server" HeaderText="Resumen">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-md-3">
                                <label>Area</label>

                                <asp:DropDownList ID="ddlAreaReporte" runat="server" CssClass="ddl" Font-Size="8pt" Font-Bold="True"></asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                <label>Mes</label>

                                <asp:DropDownList ID="ddlMeses" runat="server" CssClass="ddl" Font-Size="8pt" Font-Bold="True">

                                    <asp:ListItem Value="1">TODOS</asp:ListItem>
                                    <asp:ListItem Value="2">ENERO</asp:ListItem>
                                    <asp:ListItem Value="3">FEBRERO</asp:ListItem>
                                    <asp:ListItem Value="4">MARZO</asp:ListItem>
                                    <asp:ListItem Value="5">ABRIL</asp:ListItem>
                                    <asp:ListItem Value="6">MAYO</asp:ListItem>
                                    <asp:ListItem Value="7">JUNIO</asp:ListItem>
                                    <asp:ListItem Value="8">JULIO</asp:ListItem>
                                    <asp:ListItem Value="9">AGOSTO</asp:ListItem>
                                    <asp:ListItem Value="10">SEPTIEMBRE</asp:ListItem>
                                    <asp:ListItem Value="11">OCTUBRE</asp:ListItem>
                                    <asp:ListItem Value="12">NOVIEMBRE</asp:ListItem>
                                    <asp:ListItem Value="13">DICIEMBRE</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                            <div class="col-md-3">
                                <label>Estado:</label>
                                <asp:DropDownList ID="ddlEstadoReporte" runat="server" CssClass="ddl" Font-Size="8pt" Font-Bold="True"></asp:DropDownList>

                            </div>
                            <div class="col-md-3">
                                <label>Año</label>
                                <asp:DropDownList ID="ddlAno" runat="server" CssClass="ddl" Font-Size="8pt" Font-Bold="True"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-3" style="margin-left: auto; margin-right: auto;">
                                <br />
                                <label>Total:</label>
                                <asp:TextBox ID="txtTotal" runat="server" MaxLength="20" ReadOnly="True" Enabled="False" BackColor="#F0F0F0" BorderStyle="Dotted" Font-Bold="True" Font-Size="Small"></asp:TextBox>

                            </div>
                            <div class="col-md-3" style="margin-left: auto; margin-right: auto;">
                                <br />
                                <br />
                                <asp:Button ID="btnMostrarReporte" runat="server" Width="100%" Height="37px" Text="Mostrar Reporte" OnClick="btnMostraReporte_Click" CausesValidation="False" />
                            </div>
                            <div class="col-md-3">
                                <br />
                            </div>
                            <div class="col-md-3">
                            </div>

                        </div>
                        <%--<div>
                            implementando acordion
                            <cc1:Accordion ID="Accordion1" runat="server" ContentCssClass="" HeaderCssClass="" HeaderSelectedCssClass="" TransitionDuration="250">
                                <Panes>
                                    <ajaxToolkit:AccordionPane runat="server" ID="PrimerPanel" Width="400px"
                                        AutoZise="none" FadeTransitions="true" TransitionDuration="300"
                                        FramesPerSecond="30" SelectedIndex="1" ContentCssClass="" HeaderCssClass="">
                                        <Header>
                                            <div style="background: #195183; color: white; font-weight: bold;">Resumen del reporte</div>
                                        </Header>
                                        <Content>
                                            <label>Total:</label>
                                            <asp:TextBox ID="txtTotal" runat="server" MaxLength="20" ReadOnly="True" Enabled="False" BackColor="#F0F0F0" BorderStyle="Dotted" Font-Bold="True" Font-Size="Small"></asp:TextBox>
                                            <br />
                                        </Content>
                                    </ajaxToolkit:AccordionPane>

                                    <ajaxToolkit:AccordionPane runat="server" ID="AccordionPane1" ContentCssClass="" HeaderCssClass="">
                                        <Header>
                                            <div style="background: #195183; color: white; font-weight: bold;">Prueba 02</div>
                                        </Header>
                                        <Content>
                                            Esto es la segunda prueba que se está realizando dentro de la minuta.
                                        </Content>
                                    </ajaxToolkit:AccordionPane>

                                    <ajaxToolkit:AccordionPane runat="server" ID="AccordionPane2" ContentCssClass="" HeaderCssClass="">
                                        <Header>
                                            <div style="background: #195183; color: white; font-weight: bold;">Prueba 03</div>
                                        </Header>
                                        <Content>
                                            Esto es la Tercera prueba que se está realizando dentro de la minuta.
                                        </Content>
                                    </ajaxToolkit:AccordionPane>
                                </Panes>
                            </cc1:Accordion>
                        </div>--%>

                        <div class="row">

                            <div class="col-md-12">
                                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1070px"></rsweb:ReportViewer>
                            </div>

                        </div>



                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel6" runat="server" HeaderText="Historial">
                    <ContentTemplate>
                        <div class="row" runat="server" id="tblHistorialDiv">
                            <center>

                                    <table id="tblHistorial"  class ="Tb" aria-hidden="False">
                                        <thead>
                                            <tr align="center" style="background-color: #195183; color: White; text-align: center; font-family: Arial, sans-serif; font-size: 13px; width:50px; height:15px;" class ="Tb">
                                            <th width="1%" style="text-align: center; font-size: 0.8em;font-weight: bold;">N°</th>
                                            <th width="20%" style="text-align: center; font-size: 0.8em;font-weight: bold;">MINUTA</th>
                                            <th width="6%" style="text-align: center; font-size: 0.8em;font-weight: bold;">ENCARGADO</th>
                                            <th width="6%" style="text-align: center; font-size: 0.8em;font-weight: bold;">REUNIÓN</th>
                                            <th width="7%" style="text-align: center; font-size: 0.8em;font-weight: bold;">LUGAR</th>
                                            <th width="7%" style="text-align: center; font-size: 0.8em;font-weight: bold;">F.EGISTRADO</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView runat="server" ID="ltvHistorial">
                                            <ItemTemplate>
                                                <tr style="font-family: Arial, sans-serif; font-size: 12px; border: double; border-width: 1px;">
                                                    <td style="text-align: center;font-size: 0.8em;">
                                                        <%#Eval("num") %>
                                                    </td>

                                                    <td style="font-size: 0.8em;">                                                       
                                                    <%# Eval("asunto") %>   
                                                    </td>
                                                    <td style="text-align: left;text-align: center; font-size: 0.8em;">
                                                        <%#Eval("nombres") %>
                                                    </td>
                                                    <td style="text-align: left;text-align: center; font-size: 0.8em;">
                                                        <%#Eval("registro") %>
                                                    </td>
                                                    <td style="text-align: left; font-size: 0.8em;">
                                                        <%#Eval("lugar") %>
                                                    </td>
                                                    </td>
                                                    <td style="text-align: center; font-size: 0.8em;">
                                                        <%#Eval("fechaCreacion") %>
                                                    </td >

                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </tbody>
                                </table>
                                </center>
                        </div>
                    </ContentTemplate>
                </cc1:TabPanel>
            </cc1:TabContainer>



        </ContentTemplate>

        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
    <asp:Panel ID="panelUpdateProgress" runat="server" CssClass="updateProgress">
        <asp:UpdateProgress ID="UpdateProg1" DisplayAfter="0" runat="server">
            <ProgressTemplate>
                <div style="position: relative; top: 30%; text-align: center;">
                    <img src="../images/loading.gif" style="vertical-align: middle" alt="Procesando" />

                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="ModalProgress" runat="server" TargetControlID="panelUpdateProgress"
        BackgroundCssClass="modalBackground" PopupControlID="panelUpdateProgress" />
</asp:Content>


