
<%@ page import="br.ufes.inf.nemo.dwws.domains.Appointment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'appointment.label', default: 'Appointment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
        <ul class="breadcrumb">
            <li>
                <a href="${createLink(controller: 'appointment', action: 'index')}">Consulta</a>
            </li>
        </ul>

        <div class="modal-header" align="center">
            <!--<a id="btn_add" class="btn btn-default">Adicionar</a>-->
            <a id="btn_edit" class="btn btn-default">Editar</a>
            <a id="btn_show" class="btn btn-default">Visualizar</a>
            <a id="btn_refresh" href="${createLink(controller: 'appointment', action: 'index')}" class="btn btn-default">Recarregar</a>
            <a id="btn_delete" class="btn btn-default">Remove</a>

            <a id="btn_add_diagnostic" class="btn btn-default">Diagnóstico</a>
        </div>

        <div class="modal-body">
            <div id="list-patient" class="content scaffold-list" role="main">
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <table id="table"
                       class="table table-striped table-bordered dataTable"
                       cellspacing="0"
                       width="100%"
                       role="grid"
                       aria-describedby="appointment info"
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
                                aria-label="Name: activate to sort column descending">Paciente</th>

                            <th class="sorting_asc"
                                tabindex="0"
                                aria-controls="table"
                                rowspan="1"
                                colspan="1"
                                aria-sort="ascending"
                                aria-label="Name: activate to sort column descending"
                                style="width: 127px;">Data</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th rowspan="1" colspan="1" hidden="">
                                Código
                            </th>

                            <th rowspan="1" colspan="1">
                                CPF
                            </th>

                            <th rowspan="1" colspan="1">
                                Paciente
                            </th>

                            <th rowspan="1" colspan="1">
                                Data
                            </th>

                        </tr>
                    </tfoot>
                    <tbody>
                    <g:each in="${appointmentInstanceList}" status="i" var="appointmentInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td id="id" hidden="">${fieldValue(bean: appointmentInstance, field: "id")}</td>

                            <td>${fieldValue(bean: appointmentInstance.patient, field: "taxCode")}</td>

                            <td>${fieldValue(bean: appointmentInstance.patient, field: "name")}</td>

                            <td><g:formatDate date="${appointmentInstance.date}" type="datetime" dateStyle="MEDIUM" timeStyle="SHORT" /></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <label id="entity_name" style="visibility: hidden;">Appointment</label>
            </div>
        </div>
	</body>
</html>
