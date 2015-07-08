
<%@ page import="br.ufes.inf.nemo.dwws.domains.Patient" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

        <ul class="breadcrumb">
            <li>
                <a href="${createLink(controller: 'patient', action: 'index')}">
                	${message(code: controllerName + '.label', default: 'Patient')}
                </a>
            </li>
            <li>
                <a href="${createLink(controller: 'patient', action: 'show', params: params)}">
                	${message(code: controllerName + '.label', default: 'Show')}
                </a>
            </li>
        </ul>


		<div id="show-patient" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>


            <div class="row clearfix">

                <div class="modal-body">
                    <g:form id="form" url="[resource:patientInstance, action:'save']" class="form-horizontal">
                        <fieldset>

                        <div class="form-group">
                            <label class="col-lg-5 control-label">
                                <g:message code="patient.taxCode.label" default="Tax Code" />
                                <span class="required-indicator">*</span>
                            </label>
                            <div class="col-lg-7">
                                <span class="uneditable-input" aria-labelledby="taxCode-label"><g:fieldValue bean="${patientInstance}" field="taxCode"/></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-5 control-label">
                                <g:message code="patient.name.label" default="Name" />
                                <span class="required-indicator">*</span>
                            </label>
                            <div class="col-lg-7">
                                <span class="uneditable-input" aria-labelledby="name-label"><g:fieldValue bean="${patientInstance}" field="name"/></span>
                            </div>
                        </div>

                        <div class="form-group" >
                            <label class="col-lg-5 control-label">
                                <g:message code="patient.birthDate.label" default="Birth Date" />
                                <span class="required-indicator">*</span>
                            </label>
                            <div class="col-lg-7">
                                <span class="uneditable-input" aria-labelledby="birthDate-label"><g:formatDate date="${patientInstance?.birthDate}" /></span>
                            </div>
                        </div>
                        </fieldset>
                    </g:form>
                </div>

                <div class="modal-footer">
                    <g:form url="[resource:patientInstance, action:'delete']" method="DELETE" id="form2">
                        <fieldset class="form-actions">
                            <a href="${createLink(controller: 'patient', action: 'edit', params: params)}" class="btn btn-default">${message(code: controllerName + '.edit.label', default: 'Edit')}</a>
                            <button type="submit" form="form2" class="btn btn-default" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">${message(code: controllerName + '.delete.label', default: 'Delete')}</button>
                            <a href="${createLink(controller: 'patient', action: 'index')}" class="btn btn-default">Ok</a>
                        </fieldset>
                    </g:form>
                </div>
            </div>
		</div>
	</body>
</html>
