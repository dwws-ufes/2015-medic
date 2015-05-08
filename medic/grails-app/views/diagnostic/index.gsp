
<%@ page import="br.ufes.inf.nemo.dwws.domains.Diagnostic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'diagnostic.label', default: 'Diagnostic')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
        <ul class="breadcrumb">
            <li>
                <a href="${createLink(controller: 'diagnostic', action: 'index')}">Diagnóstico</a>
            </li>
        </ul>

        <div class="modal-header" align="center">
            <a id="btn_edit" class="btn btn-default">Editar</a>
            <a id="btn_show" class="btn btn-default">Visualizar</a>
            <a id="btn_refresh" href="${createLink(controller: 'diagnostic', action: 'index')}" class="btn btn-default">Recarregar</a>
            <a id="btn_delete" class="btn btn-default">Remove</a>
        </div>

		<div id="list-diagnostic" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

            <table id="table"
                   class="table table-striped table-bordered dataTable"
                   cellspacing="0"
                   width="100%"
                   role="grid"
                   aria-describedby="patient info"
                   style="width: 100%;">
                <thead>
                <tr role="row">
                    <th class="sorting_asc"
                        tabindex="0"
                        aria-controls="table"
                        rowspan="1"
                        colspan="1"
                        aria-sort="ascending"
                        aria-label="Name: activate to sort column descending"
                        style="width: 127px;" hidden="">Código</th>

                    <th class="sorting"
                        tabindex="0"
                        aria-controls="table"
                        rowspan="1"
                        colspan="1"
                        aria-sort="ascending"
                        aria-label="Name: activate to sort column descending"
                        style="width: 127px;">${message(code: 'patient.taxCode.label', default: 'Tax Code')}</th>

                    <th class="sorting_asc"
                        tabindex="0"
                        aria-controls="table"
                        rowspan="1"
                        colspan="1"
                        aria-sort="ascending"
                        aria-label="Name: activate to sort column descending">${message(code: 'patient.name.label', default: 'Name')}</th>

                    <th class="sorting"
                        tabindex="0"
                        aria-controls="table"
                        rowspan="1"
                        colspan="1"
                        aria-sort="ascending"
                        aria-label="Name: activate to sort column descending"
                        style="width: 150px;">Data consulta</th>

                    <th class="sorting"
                        tabindex="0"
                        aria-controls="table"
                        rowspan="1"
                        colspan="1"
                        aria-sort="ascending"
                        aria-label="Name: activate to sort column descending"
                        style="width: 127px;">Diagnóstico</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th rowspan="1" colspan="1" hidden="">
                        Código
                    </th>

                    <th rowspan="1" colspan="1">
                        ${message(code: 'patient.taxCode.label', default: 'Tax Code')}
                    </th>

                    <th rowspan="1" colspan="1">
                        ${message(code: 'patient.name.label', default: 'Name')}
                    </th>

                    <th rowspan="1" colspan="1">
                        Data consulta
                    </th>

                    <th rowspan="1" colspan="1">
                        Diagnóstico
                    </th>
                </tr>
                </tfoot>
                <tbody>
                <g:each in="${diagnosticInstanceList}" status="i" var="diagnosticInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td id="id" hidden="">${fieldValue(bean: diagnosticInstance, field: "id")}</td>

                        <td>${fieldValue(bean: diagnosticInstance.appointment.patient, field: "taxCode")}</td>

                        <td>${fieldValue(bean: diagnosticInstance.appointment.patient, field: "name")}</td>

                        <td><g:formatDate date="${diagnosticInstance.appointment.date}" type="datetime" dateStyle="MEDIUM" timeStyle="SHORT"/></td>

                        <td>${fieldValue(bean: diagnosticInstance, field: "disease")}</td>


                    </tr>
                </g:each>
                </tbody>
            </table>
            <label id="entity_name" style="visibility: hidden;">Diagnostic</label>
		</div>
	</body>
</html>
