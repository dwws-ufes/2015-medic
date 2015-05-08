
<%@ page import="br.ufes.inf.nemo.dwws.domains.Prescription" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'prescription.label', default: 'Prescription')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-prescription" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="navbar">
            <div class="nav">
                <ul class="nav">
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
		<div id="list-prescription" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
            <table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="medicine" title="${message(code: 'prescription.medicine.label', default: 'Medicine')}" />
					
						<th><g:message code="prescription.appointment.label" default="Appointment" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${prescriptionInstanceList}" status="i" var="prescriptionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${prescriptionInstance.id}">${fieldValue(bean: prescriptionInstance, field: "medicine")}</g:link></td>
					
						<td>${fieldValue(bean: prescriptionInstance, field: "appointment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${prescriptionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
