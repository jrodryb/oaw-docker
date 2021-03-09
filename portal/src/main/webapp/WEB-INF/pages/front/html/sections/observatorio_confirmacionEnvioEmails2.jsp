<!--
Copyright (C) 2012 INTECO, Instituto Nacional de Tecnolog�as de la Comunicaci�n, 
This program is licensed and may be used, modified and redistributed under the terms
of the European Public License (EUPL), either version 1.2 or (at your option) any later 
version as soon as they are approved by the European Commission.
Unless required by applicable law or agreed to in writing, software distributed under the 
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF 
ANY KIND, either express or implied. See the License for the specific language governing 
permissions and more details.
You should have received a copy of the EUPL1.2 license along with this program; if not, 
you may find it at http://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32017D0863
-->
<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.inteco.common.Constants"%>
<html:xhtml />
<html:javascript formName="TemplateRangeForm" />
<bean:parameter name="<%=Constants.ID_OBSERVATORIO%>" id="idObservatorio" />
<link rel="stylesheet" href="/oaw/js/tagbox/tagbox.css">
<link rel="stylesheet" href="/oaw/js/jqgrid/css/ui.jqgrid.css">
<link rel="stylesheet" href="/oaw/css/jqgrid.semillas.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/oaw/js/jqgrid/jquery.jqgrid.src.js"></script>
<script src="/oaw/js/tagbox/tagbox.js" type="text/javascript"></script>
<script>
	var script = document.createElement('script');
	var lang = (navigator.language || navigator.browserLanguage)
	script.src = '/oaw/js/jqgrid/i18n/grid.locale-' + lang.substring(0, 2)
			+ '.js';
	document.head.appendChild(script);
</script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	var $jn = jQuery.noConflict();
	var paginadorTotal = '<bean:message key="cargar.semilla.observatorio.buscar.total"/>';

	var colNameId = '<bean:message key="colname.id"/>';
	var colNameName = '<bean:message key="colname.name"/>';
	var colNameRange = '<bean:message key="colname.range"/>';
	var colNameTemplate = '<bean:message key="colname.custom.message"/>';
	var colNameRemove = '<bean:message key="colname.remove"/>';

	var windowTitleRemove = '<bean:message key="range.observatory.modal.delete.title"/>';
	var saveButton = '<bean:message key="boton.aceptar"/>';
	var cancelButton = '<bean:message key="boton.cancelar"/>';
	var confirmRemoveMessage = '<bean:message key="range.observatory.modal.delete.confirm"/>';

	var lastUrl;
	var scroll;

	var gridSelRow;

	$(window)
			.on(
					'load',
					function() {
						var $jq = $.noConflict();
						var lastUrl;
						$
								.ajax(
										{
											url : '/oaw/secure/UraCustomTextObservatorio.do?action=all&idExObs='
													+ $('[name=idExObs]').val(),
											method : 'POST',
											cache : false
										})
								.success(
										function(response) {

											$('#urasFilter')
													.tagbox(
															{
																items : response.uras,
																searchIn : [ 'uraName' ],
																rowFormat : '<span class="name">{{uraName}}</span>',
																tokenFormat : '{{uraName}}',
																valueField : 'uraId',
																itemClass : 'user'
															});

										});
						

						$("#urasFilter")
								.on(
										"change",
										function() {
											reloadGrid('/oaw/secure/UraCustomTextObservatorio.do?action=find&idExObs='
													+ $('[name=idExObs]').val()
													+ "&uras="
													+ $('#urasFilter').val());
										});

						$("#customTextSelector")
								.on(
										"change",
										function() {
											var value = $(this).val();

											if (value == 0) {
												reloadGrid('/oaw/secure/UraCustomTextObservatorio.do?action=all&idExObs='
														+ $('[name=idExObs]')
																.val());
												$('#urasFilterGrid').show();
												$('#urasFilterForm').hide();
											}

											if (value == 1) {
												reloadGrid('/oaw/secure/UraCustomTextObservatorio.do?action=find&idExObs='
														+ $('[name=idExObs]')
																.val()
														+ "&uras="
														+ $('#urasFilter')
																.val());
												$('#urasFilterGrid').show();
												$('#urasFilterForm').show();
											}

											if (value == 2) {
												$('#urasFilterGrid').hide();
												$('#urasFilterForm').hide();
											}

										});

					});
	
	

	function reloadGrid(path) {
	
		lastUrl = path;

		// keep scroll
		scroll = $(window).scrollTop();

		$('#grid').jqGrid('clearGridData');
		
		
		
		$
				.ajax({
					url : path,
					dataType : "json",
					cache : false
				})
				.done(

						function(data) {

							ajaxJson = JSON.stringify(data.uras);

							total = data.paginador.total;
							
							$.extend(true, $.jgrid.icons, {
							    glyphIcon: {
							        nav: {
							            common: "",
							            edit: "glyphicon glyphicon-pencil",
							            add: "glyphicon glyphicon-plus",
							            del: "glyphicon glyphicon-trash",
							            search: "glyphicon glyphicon-search",
							            refresh: "glyphicon glyphicon-refresh",
							            view: "fa fa-lg fa-fw fa-file-o",
							            save: "glyphicon glyphicon-save",
							            cancel: "glyphicon glyphicon-ban-circle",
							            newbutton: "fa fa-lg fa-fw fa-external-link"
							        }
							    }
							});		

							

							$('#grid')
									.jqGrid(
											{
												editUrl : '/oaw/secure/UraCustomTextObservatorio.do?action=update',
												colNames : [ colNameId,
														colNameName,
														colNameRange,
														colNameTemplate,"" ],
												colModel : [
														{
															name : "id",
															hidden : true,
															sortable : false
														},
														{
															name : "ura.name",
															width : 20,
															editable : false,
															align : "center",
															sortable : true

														},
														{
															name : "range.name",
															width : 20,
															editable : false,
															align : "center",
															sortable : true

														},
														{
															name : "template",
															width : 50,
															editrules : {
																required : true,
															},
															edittype : 'custom',
															editoptions : {
																custom_element : templateEdit,
																custom_value : templateEditValue
															},
															formatter: templateFormatter,
															align : "left",
															sortable : false,

														},
														{ 
															name: "actions",
															template: "actions",
															formatoptions: {
																keys: true,
																delbutton: false,
															}
														 
														}, 

												],
												inlineEditing : {
													keys : true,
												},
												cmTemplate : {
													autoResizable : true,
													editable : true
												},
												//iconSet: "glyphIcon",
												viewrecords : false,
												autowidth : true,
												pgbuttons : false,
												pgtext : false,
												pginput : false,
												hidegrid : false,
												altRows : false,
												mtype : 'POST',

												onSelectRow : function(rowid,
														status, e) {

													var $self = $(this), savedRow = $self
															.jqGrid(
																	"getGridParam",
																	"savedRow");
													if (savedRow.length > 0
															&& savedRow[0].id !== rowid) {
														$self.jqGrid(
																"restoreRow",
																savedRow[0].id);
													}

													$self
															.jqGrid(
																	"editRow",
																	rowid,
																	{
																		focusField : e.target,
																		keys : true,
																		url : '/oaw/secure/UraCustomTextObservatorio.do?action=update',
																		restoreAfterError : false,
																		successfunc : function(
																				response) {
																			reloadGrid(lastUrl);
																		},
																		afterrestorefunc : function(
																				response) {
																			reloadGrid(lastUrl);
																		}

																	});

												},
												beforeSelectRow : function(
														rowid, e) {
													var $self = $(this), i, $td = $(
															e.target).closest(
															"td"), iCol = $.jgrid
															.getCellIndex($td[0]);

													if (this.p.colModel[iCol].name === "actions") {
														return false;
													}

													savedRows = $self.jqGrid(
															"getGridParam",
															"savedRow");
													for (i = 0; i < savedRows.length; i++) {
														if (savedRows[i].id !== rowid) {
															// save currently
															// editing row
															$self
																	.jqGrid(
																			'saveRow',
																			savedRows[i].id,
																			{
																				successfunc : function(
																						response) {
																					reloadGrid(lastUrl);
																				},
																				afterrestorefunc : function(
																						response) {
																					reloadGrid(lastUrl);
																				},
																				url : '/oaw/secure/UraCustomTextObservatorio.do?action=update',
																				restoreAfterError : false,
																			});

														}
													}
													return savedRows.length === 0;
												},
												gridComplete : function() {
													// Restaurar el scroll
													$(window).scrollTop(scroll);
												}
											}).jqGrid('navGrid').jqGrid("inlineNav");

							// Recargar el grid
							$('#grid').jqGrid('setGridParam', {
								data : JSON.parse(ajaxJson)
							}).trigger('reloadGrid');

							$('#grid').unbind("contextmenu");

							//ui-corner-all ui-pg-div ui-inline-edit
							$("#grid .ui-icon-pencil").removeClass('ui-icon ui-icon-pencil').addClass('glyphicon glyphicon-edit');
							$("#grid .ui-icon-disk").removeClass('ui-icon ui-icon-disk').addClass('glyphicon glyphicon-floppy-disk');
							$("#grid .ui-icon-cancel").removeClass('ui-icon ui-icon-cancel').addClass('glyphicon glyphicon-ban-circle');

							
							

							// Mostrar sin resultados
							if (total == 0) {
								$('#grid')
										.append(
												'<tr role="row" class="ui-widget-content jqgfirstrow ui-row-ltr"><td colspan="9" style="padding: 15px !important;" role="gridcell">Sin resultados</td></tr>');
							}

							// Paginador
							paginas = data.paginas;

							$('#paginador').empty();

							$('#paginador')
									.append(
											"<span style='float: left;clear: both; display: block; width: 100%; text-align: left;padding: 10px 5px;'><strong>"
													+ paginadorTotal
													+ "</strong> "
													+ data.paginador.total
													+ "</span>");

							// Si solo hay una p�gina no pintamos el paginador
							if (paginas.length > 1) {

								$
										.each(
												paginas,
												function(key, value) {
													if (value.active == true) {
														$('#paginador')
																.append(
																		'<a href="javascript:reloadGrid(\''
																				+ value.path
																				+ '\')" class="'
																				+ value.styleClass
																				+ ' btn btn-default">'
																				+ value.title
																				+ '</a>');
													} else {
														$('#paginador')
																.append(
																		'<span class="' + value.styleClass +
	                                            ' btn">'
																				+ value.title
																				+ '</span>');
													}

												});
							}
						}).error(function(data) {
					console.log("Error")
					console.log(data)
				});

	}
	


	function templateEdit(value, options) {
		var element = document.createElement('textarea');
		element.setAttribute("name", "templateEdit");
		element.setAttribute("id", "templateEdit");
		
		CKEDITOR.replace(element);
		
		//CKEDITOR.instances.templateEdit.setData(value);
		CKEDITOR.instances.templateEdit.setData($('#grid').getLocalRow(options.rowId).template);
		
		return element;
	}
	
	function templateEditValue(elem, operation, value) {

		if (operation === 'get') {
			return CKEDITOR.instances.templateEdit.getData();
		} else if (operation === 'set') {
			//CKEDITOR.replace('templateEdit');
			//CKEDITOR.instances.templateEdit.setData(value);
		}
	}

	function cellFormatter(cellvalue, options, rowObject) {
		if (cellvalue) {
			return cellvalue;
		} else {
			return "";
		}
	}	
	
	function templateFormatter(cellvalue, options, rowObject) {
		if (cellvalue && cellvalue.length > 100){
			return cellvalue.substr(0,100) + '...';
		}
		return cellvalue;
	}
</script>
<script src="/oaw/js/ckeditor/ckeditor.js"></script>
<div id="main">
	<div id="container_menu_izq">
		<jsp:include page="menu.jsp" />
	</div>
	<div id="container_der">
		<div id="migas">
			<p class="sr-only">
				<bean:message key="ubicacion.usuario" />
			</p>
			<ol class="breadcrumb">
				<li>
					<html:link forward="observatoryMenu">
						<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
						<bean:message key="migas.observatorio" />
					</html:link>
				</li>
				<li>
					<html:link forward="resultadosPrimariosObservatorio" paramName="idObservatorio"
						paramId="<%=Constants.ID_OBSERVATORIO%>">
						<bean:message key="migas.indice.observatorios.realizados.lista" />
					</html:link>
				</li>
				<li class="active">
					<bean:message key="migas.exportar" />
				</li>
			</ol>
		</div>
		<div id="cajaformularios">
			<form action="/oaw/secure/ConfigSendResultsByMailAction.do">
				<h2>
					<bean:message key="send.results.observatory.title" />
				</h2>
				<fieldset>
					<legend>
						<bean:message key="report.config.observatorios.templates.title" />
					</legend>
				</fieldset>
				<fieldset>
					<div class="row formItem">
						<label for="customTextSelector" class="control-label">
							<strong class="labelVisu">
								<bean:message key="indice.rastreo.send.database.confirm.select.custom.text" />
							</strong>
						</label>
						<div class="col-xs-6">
							<select id="customTextSelector" name="customTextSelector" class="form-control" required>
								<option value=""></option>
								<option value="0"><bean:message key="indice.rastreo.send.database.confirm.select.custom.option1" /></option>
								<option value="1"><bean:message key="indice.rastreo.send.database.confirm.select.custom.option2" /></option>
								<option value="2"><bean:message key="indice.rastreo.send.database.confirm.select.custom.option3" /></option>
							</select>
						</div>
					</div>
					<div class="formItem" id="urasFilterForm" style="display:none">
						<label for="url" class="control-label">
							<strong class="labelVisu">
								<bean:message key="report.config.uras.title" />
							</strong>
						</label>
						<input name="uras" autocapitalize="off" placeholder="<bean:message key="placeholder.tags" />" autofocus
							id="urasFilter" type="text" value="" />
					</div>
					<div class="formItem" id="urasFilterGrid">
						<table id="grid">
						</table>
					</div>
				</fieldset>
				<fieldset>
					<p>
						<strong class="labelVisu">
							<bean:message key="resultado.observatorio.rastreo.realizado.confirm.send" />
						</strong>
					</p>
					<p>
						<bean:message key="resultado.observatorio.rastreo.realizado.send.confirm.info" />
					</p>
				</fieldset>
				<div class="formButton">
					<input type="hidden" name="action" value="confirm" />
					<input type="hidden" name="idCartucho" value="<c:out value="${param.idCartucho}"/>" />
					<input type="hidden" name="id_observatorio" value="<c:out value="${param.id_observatorio}"/>" />
					<input type="hidden" name="idExObs" value="<c:out value="${param.idExObs}"/>" />
					<input type="submit" class="btn btn-primary btn-lg" value=<bean:message key="boton.aceptar" />>
					<html:link styleClass="btn btn-default btn-lg" forward="observatoryMenu">
						<bean:message key="boton.cancelar" />
					</html:link>
				</div>
			</form>
		</div>
		<!-- fin cajaformularios -->
	</div>
</div>