
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
        <ul class="breadcrumb">
            <li>
                <a href="${createLink(controller: controllerName, action: 'index')}">${message(code: controllerName + '.label', default: 'Appointment')}</a>
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
			        <th data-field="date"
			        	data-sortable="true"
			        	data-align="right"
			        	data-formatter="dateFormatter">${message(code: 'appointment.date.label', default: 'Birth Date')}</th>
			        <th data-field="disease"
			        	data-sortable="true"
			        	data-align="right">${message(code: 'diagnostic.disease.label', default: 'Disease')}</th>
			        <th data-field="medicine"
			        	data-sortable="true"
			        	data-align="right">${message(code: 'prescription.medicine.label', default: 'Medicine')}</th>
			        <th data-align="right">Operações</th>
			    </tr>
		    </thead>
		    <tbody>
                <g:each in="${prescriptionInstanceList}" status="i" var="prescriptionInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: prescriptionInstance.diagnostic.appointment.patient, field: "taxCode")}</td>
                        <td>${fieldValue(bean: prescriptionInstance.diagnostic.appointment.patient, field: "name")}</td>
                        <td>${formatDate(date: prescriptionInstance.diagnostic.appointment.date, type: 'datetime', dateStyle:'MEDIUM', timeStyle:'SHORT')}</td>  
                        <td>${fieldValue(bean: prescriptionInstance.diagnostic, field: "disease")}</td>  
                        <td>${fieldValue(bean: prescriptionInstance, field: "medicine")}</td>                    
                        <td>
							<a href="<g:createLink controller="${controllerName}" action="show" id="${fieldValue(bean: prescriptionInstance, field: "id")}"/>" title="Visualizar">
                				<i class="fa fa-search"></i>
            				</a>
				            <a href="<g:createLink controller="${controllerName}" action="show" id="${fieldValue(bean: prescriptionInstance, field: "id")}"/>" title="Editar">
                				<i class="fa fa-pencil"></i>
				            </a>
				            <a href="<g:createLink controller="${controllerName}" action="show" id="${fieldValue(bean: prescriptionInstance, field: "id")}"/>" title="Remover">
                				<i class="fa fa-times"></i>
				            </a>
						</td>
                    </tr>
                </g:each>
			</tbody>
		</table>
	</body>
</html>
