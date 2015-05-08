
<%@ page import="br.ufes.inf.nemo.dwws.domains.Prescription" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'prescription.label', default: 'Prescription')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-prescription" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="navbar">
            <div class="nav">
                <ul class="nav">
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
		<div id="show-prescription" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list prescription">
			
				<g:if test="${prescriptionInstance?.medicine}">
				<li class="fieldcontain">
					<label id="medicine-label" class="property-label"><g:message code="prescription.medicine.label" default="Medicine" /></label>
					
						<span class="uneditable-input" aria-labelledby="medicine-label"><g:fieldValue bean="${prescriptionInstance}" field="medicine"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prescriptionInstance?.appointment}">
				<li class="fieldcontain">
					<label id="appointment-label" class="property-label"><g:message code="prescription.appointment.label" default="Appointment" /></label>
					
						<span class="uneditable-input" aria-labelledby="appointment-label"><g:link controller="appointment" action="show" id="${prescriptionInstance?.appointment?.id}">${prescriptionInstance?.appointment?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:prescriptionInstance, action:'delete']" method="DELETE">
                <fieldset class="form-actions">
					<g:link class="edit" action="edit" resource="${prescriptionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
