<%@ page import="br.ufes.inf.nemo.dwws.domains.Diagnostic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'diagnostic.label', default: 'Diagnostic')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>

        <ul class="breadcrumb">
            <li>
                <a href="${createLink(controller: 'diagnostic', action: 'index')}">Diagnóstico</a>
            </li>
            <li>
                <a href="${createLink(controller: 'diagnostic', action: 'edit', params: params)}">Editar</a>
            </li>
        </ul>

		<div id="edit-diagnostic" class="content scaffold-edit" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${diagnosticInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${diagnosticInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

            <div class="row clearfix">

                <div class="modal-body">
                    <g:form id="form1" url="[resource:diagnosticInstance, action:'save']" class="form-horizontal">
                        <fieldset>
                            <div class="form-group">
                                <label class="col-lg-5 control-label">
                                    <g:message code="patient.taxCode.label" default="Tax Code" />
                                    <span class="required-indicator">*</span>
                                </label>
                                <div class="col-lg-7">
                                    <span class="uneditable-input" aria-labelledby="taxCode-label"><g:fieldValue bean="${diagnosticInstance.appointment.patient}" field="taxCode"/></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-5 control-label">
                                    <g:message code="patient.name.label" default="Name" />
                                    <span class="required-indicator">*</span>
                                </label>
                                <div class="col-lg-7">
                                    <span class="uneditable-input" aria-labelledby="name-label"><g:fieldValue bean="${diagnosticInstance.appointment.patient}" field="name"/></span>
                                </div>
                            </div>

                            <div class="form-group" >
                                <label class="col-lg-5 control-label">
                                    Data da Consulta
                                </label>
                                <div class="col-lg-7">
                                    <span class="uneditable-input" aria-labelledby="date-label">
                                        <g:formatDate date="${diagnosticInstance.appointment.date}" type="datetime" dateStyle="MEDIUM" timeStyle="SHORT" />
                                    </span>
                                </div>
                            </div>
                        </fieldset>
                    </g:form>
                    <g:form id="form" url="[resource:diagnosticInstance, action:'update']" method="PUT"  class="form-horizontal">
                        <g:hiddenField name="version" value="${diagnosticInstance?.version}" />
                        <fieldset class="form">
                            <g:render template="form"/>
                        </fieldset>
                    </g:form>
                </div>

                <div class="modal-footer">
                    <a href="${createLink(controller: 'diagnostic', action: 'index')}" class="btn btn-default">Cancelar</a>
                    <button type="submit" form="form" class="btn btn-primary">Salvar</button>
                </div>
            </div>
		</div>
	</body>
</html>
