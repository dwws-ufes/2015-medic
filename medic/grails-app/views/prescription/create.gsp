<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'prescription.label', default: 'Prescription')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>	
	<body>
		<ul class="breadcrumb">
            <li>
                <a href="${createLink(controller: 'prescription', action: 'index')}">Prescrição</a>
            </li>
            <li>
                <a href="${createLink(controller: 'prescription', action: 'create')}">Adicionar</a>
            </li>
        </ul>

      <div id="create-prescription" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${prescriptionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${prescriptionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

            <div class="row clearfix">

                <div class="modal-body">
                    <g:form id="form1" url="[resource:prescriptionInstance, action:'save']" class="form-horizontal">
                        <fieldset>
                            <div class="form-group">
                                <label class="col-lg-5 control-label">
                                    <g:message code="patient.taxCode.label" default="Tax Code" />
                                    <span class="required-indicator">*</span>
                                </label>
                                <div class="col-lg-7">
                                    <span class="uneditable-input" aria-labelledby="taxCode-label"><g:fieldValue bean="${prescriptionInstance.diagnostic.appointment.patient}" field="taxCode"/></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-5 control-label">
                                    <g:message code="patient.name.label" default="Name" />
                                    <span class="required-indicator">*</span>
                                </label>
                                <div class="col-lg-7">
                                    <span class="uneditable-input" aria-labelledby="name-label"><g:fieldValue bean="${prescriptionInstance.diagnostic.appointment.patient}" field="name"/></span>
                                </div>
                            </div>

                            <div class="form-group" >
                                <label class="col-lg-5 control-label">
                                    Data da Consulta
                                </label>
                                <div class="col-lg-7">
                                    <span class="uneditable-input" aria-labelledby="date-label">
                                        <g:formatDate date="${prescriptionInstance.diagnostic.appointment.date}" type="datetime" dateStyle="MEDIUM" timeStyle="SHORT" />
                                    </span>
                                </div>
                            </div>

                            <div class="form-group" >
                                <label class="col-lg-5 control-label">
                                    Diagnóstico
                                </label>
                                <div class="col-lg-7">
                                    <span class="uneditable-input" aria-labelledby="date-label">
                                    	<g:fieldValue bean="${prescriptionInstance.diagnostic}" field="disease"/>
                                    </span>
                                </div>
                            </div>
                        </fieldset>
                    </g:form>
                    <g:form id="form" url="[resource:prescriptionInstance, action:'save']" class="form-horizontal">
                        <fieldset>
                            <g:render template="form"/>
                        </fieldset>
                    </g:form>
                </div>               
                

                <div class="modal-footer">
                	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"/>Medicamentos</button>
                    <a href="${request.getHeader('referer')}" class="btn btn-default">Cancelar</a>
                    <button type="submit" form="form" class="btn btn-primary">Salvar</button>
                </div>
            </div>
		</div>
		

		
		<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Medicamentos</h4>
      </div>
      <div class="modal-body">
        
		<table id="table"
	  		   data-toggle="table"
	  		   data-click-to-select="true"
	  		   data-single-select="true"
			   data-url="${createLink(controller:controllerName, action:'list')}"
			   data-method="get"
			   data-height="385"
			   data-side-pagination="client"
			   data-pagination="true"
			   data-page-list="[5, 10, 20, 50, 100, 200]"
			   data-search="true"
			   data-show-refresh="true"
			   data-show-columns="true"
			   data-show-toggle="true"
			   data-show-filter="true"
			   data-cache="false"
			   data-show-export="true">
		    <thead>
			    <tr>
			    	<th data-field="state" data-checkbox="true"></th>
			    	<th data-field="brand"
			    		data-sortable="true"
			    		data-align="right">Medicamento</th>
			        <th data-field="drug"
			        	data-sortable="true"
			        	data-align="left">Droga</th>
			        <th data-field="dosage"
			        	data-sortable="false"
			        	data-align="right">Dosage</th>
			        <th data-field="indication"
			        	data-sortable="false"
			        	data-align="right">Indication</th>
			    </tr>
		    </thead>
		</table>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="$('#medicine').val($('#table').bootstrapTable('getSelections')[0]['brand']);">Save changes</button>
      </div>
    </div>
  </div>
</div>
		
	
	</body>
</html>
