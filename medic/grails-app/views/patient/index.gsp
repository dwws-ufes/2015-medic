
<%@ page import="br.ufes.inf.nemo.dwws.domains.Patient" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

        <ul class="breadcrumb">
            <li>
                <a href="${createLink(controller: 'patient', action: 'index')}"><g:message code="patient.label"/></a>
            </li>
        </ul>

        <div class="modal-header" align="center">
            <a id="btn_add" href="${createLink(controller: 'patient', action: 'create')}" class="btn btn-default">Adicionar</a>
            <a id="btn_edit" class="btn btn-default">Editar</a>
            <a id="btn_show" class="btn btn-default">Visualizar</a>
            <a id="btn_refresh" href="${createLink(controller: 'patient', action: 'index')}" class="btn btn-default">Recarregar</a>
            <a id="btn_delete" class="btn btn-default">Remove</a>

            <a id="btn_add_appointment" class="btn btn-default">Consulta</a>
        </div>


    <div class="modal-body">
            <div id="list-patient" class="content scaffold-list" role="main">
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <table id="table"
                       class="table table-striped table-bordered display"
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
                                style="width: 150px;">${message(code: 'patient.birthDate.label', default: 'Birth Date')}</th>
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
                                ${message(code: 'patient.birthDate.label', default: 'Birth Date')}
                            </th>

                        </tr>
                    </tfoot>
                    <tbody>
                    <g:each in="${patientInstanceList}" status="i" var="patientInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td id="id" hidden="">${fieldValue(bean: patientInstance, field: "id")}</td>

                            <td>${fieldValue(bean: patientInstance, field: "taxCode")}</td>

                            <td>${fieldValue(bean: patientInstance, field: "name")}</td>

                            <td><g:formatDate date="${patientInstance.birthDate}" type="date" style="MEDIUM"/></td>


                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <label id="entity_name" style="visibility: hidden;">Patient</label>
            </div>
		</div>
	</body>
</html>
