
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
                <a href="${createLink(controller: controllerName, action: 'index')}">
                 ${message(code: controllerName + '.label', default: 'Appointment')}</a>
            </li>
        </ul>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>        
        
        <table id="table"
	  		   data-toggle="table"
	  		   data-click-to-select="true"
	  		   data-single-select="true"
			   data-url="${createLink(controller:controllerName, action:'index')}"
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
			    	<th data-field="taxCode"
			    		data-sortable="true"
			    		data-align="right"
			    		data-formatter="taxCodeFormatter">${message(code: 'patient.taxCode.label', default: 'Tax Code')}</th>
			        <th data-field="name"
			        	data-sortable="true"
			        	data-align="left">${message(code: 'patient.name.label', default: 'Name')}</th>
			        <th data-field="birthDate"
			        	data-sortable="true"
			        	data-align="right"
			        	data-formatter="dateFormatter">${message(code: 'patient.birthDate.label', default: 'Birth Date')}</th>
			        <th data-align="right">${message(code: 'default.operations.label', default: 'Operations')}</th>
			    </tr>
		    </thead>
		    <tbody>
                <g:each in="${appointmentInstanceList}" status="i" var="appointmentInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: appointmentInstance.patient, field: "taxCode")}</td>
                        <td>${fieldValue(bean: appointmentInstance.patient, field: "name")}</td>
                        <td>${formatDate(date: appointmentInstance.date, type: 'datetime', dateStyle:'MEDIUM', timeStyle:'SHORT')}</td>                        
                        <td>
                        	<a href="<g:createLink controller="${controllerName}" action="show" id="${fieldValue(bean: appointmentInstance, field: "id")}"/>"
                               title="${message(code: controllerName + '.show.label', default: 'Show')}">
                				<i class="fa fa-search"></i>
            				</a>
				            <a href="<g:createLink controller="${controllerName}" action="show" id="${fieldValue(bean: appointmentInstance, field: "id")}"/>"
				               title="${message(code: controllerName + '.edit.label', default: 'Edit')}">
                				<i class="fa fa-pencil"></i>
				            </a>
				            <a href="<g:createLink controller="${controllerName}" action="show" id="${fieldValue(bean: appointmentInstance, field: "id")}"/>"
				               title="${message(code: controllerName + '.delete.label', default: 'Delete')}">
                				<i class="fa fa-times"></i>
				            </a>
                        	<a href="<g:createLink controller="diagnostic" action="create" id="${fieldValue(bean: appointmentInstance, field: "id")}"/>"
                        	   title="${message(code: controllerName + '.add.diagnotic.label', default: 'Add Diagnostic')}">
                				<i class="fa fa-stethoscope"></i>
            				</a>
                        	
						</td>
                    </tr>
                </g:each>
               </tbody>
		</table>
	</body>
</html>
