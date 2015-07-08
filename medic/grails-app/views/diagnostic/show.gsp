
<%@ page import="br.ufes.inf.nemo.dwws.domains.Diagnostic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'diagnostic.label', default: 'Diagnostic')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

        <ul class="breadcrumb">
            <li>
                <a href="${createLink(controller: controllerName, action: 'index')}">
                	${message(code: controllerName + '.label', default: 'Diagnostic')}
                </a>
            </li>
            <li>
                <a href="${createLink(controller: controllerName, action: 'show')}">
                	${message(code: controllerName + '.show.label', default: 'Show')}
                </a>
            </li>
        </ul>

        <div id="show-diagnostic" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <div class="row clearfix">

                <div class="modal-body">
                    <g:form id="form" url="[resource:diagnosticInstance, action:'save']" class="form-horizontal">
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
                                    <g:message code="appointment.date.label" default="Date" />
                                    <span class="required-indicator">*</span>
                                </label>
                                <div class="col-lg-7">
                                    <span class="uneditable-input" aria-labelledby="date-label"><g:formatDate date="${diagnosticInstance.appointment?.date}" /></span>
                                </div>
                            </div>

                            <div class="form-group" >
                                <label class="col-lg-5 control-label">
                                    Diagnóstico
                                    <span class="required-indicator">*</span>
                                </label>
                                <div class="col-lg-7">
                                    <span class="uneditable-input" aria-labelledby="date-label"><g:fieldValue bean="${diagnosticInstance}" field="disease"/></span>
                                </div>
                            </div>

                        </fieldset>
                    </g:form>
                </div>

                <div class="modal-footer">
                    <g:form url="[resource:diagnosticInstance, action:'delete']" method="DELETE" id="form2">
                        <fieldset class="form-actions">
                            <a href="${createLink(controller: 'diagnostic', action: 'edit', params: params)}" class="btn btn-default">${message(code: controllerName + '.edit.label', default: 'Edit')}</a>
                            <button type="submit" form="form2" class="btn btn-default" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">${message(code: controllerName + '.delete.label', default: 'Delete')}</button>
                            <a href="${createLink(controller: 'diagnostic', action: 'index')}" class="btn btn-default">Ok</a>
                        </fieldset>
                    </g:form>
                </div>
            </div>
		</div>
	</body>
</html>
