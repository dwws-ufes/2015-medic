<%@ page import="br.ufes.inf.nemo.dwws.domains.Prescription" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'prescription.label', default: 'Prescription')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>

        <ul class="breadcrumb">
            <li>
                <a href="${createLink(controller: controllerName, action: 'index')}">
                	${message(code: controllerName + '.label', default: 'Prescription')}
                </a>
            </li>
            <li>
                <a href="${createLink(controller: controllerName, action: 'edit', params: params)}">
                	${message(code: controllerName + '.edit.label', default: 'Edit')}
                </a>
            </li>
        </ul>
        
        
        
        <div id="edit-prescription" class="content scaffold-edit" role="main">
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
                        </fieldset>
                    </g:form>
                    <g:form id="form" url="[resource:prescriptionInstance, action:'update']" method="PUT"  class="form-horizontal">
                        <g:hiddenField name="version" value="${prescriptionInstance?.version}" />
                        <fieldset class="form">
                            <g:render template="form"/>
                        </fieldset>
                    </g:form>
                </div>

                <div class="modal-footer">
                	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"/>${message(code: controllerName + '.medicines.label', default: 'Medicines')}</button>
                    <a href="${createLink(controller: controllerName, action: 'index')}" class="btn btn-default">${message(code: controllerName + '.cancel.label', default: 'Cancel')}</a>
                    <button type="submit" form="form" class="btn btn-primary">${message(code: controllerName + '.save.label', default: 'Save')}</button>
                </div>
            </div>
		</div>
		
		
		
		
		
				<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">${message(code: controllerName + '.medicines.label', default: 'Medicines')}</h4>
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
			    		data-align="right">${message(code: controllerName + '.medicine.label', default: 'Medicine')}</th>
			        <th data-field="drug"
			        	data-sortable="true"
			        	data-align="left">${message(code: controllerName + '.drug.label', default: 'Drug')}</th>
			        <th data-field="dosage"
			        	data-sortable="false"
			        	data-align="right">${message(code: controllerName + '.dosage.label', default: 'Dosage')}</th>
			        <th data-field="indication"
			        	data-sortable="false"
			        	data-align="right">${message(code: controllerName + '.indication.label', default: 'Indication')}</th>
			    </tr>
		    </thead>
		</table>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">${message(code: controllerName + '.close.label', default: 'Close')}</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="$('#medicine').val($('#table').bootstrapTable('getSelections')[0]['brand']);">Ok</button>
      </div>
    </div>
  </div>
</div>
	</body>
</html>
