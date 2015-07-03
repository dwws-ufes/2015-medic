<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>

        <ul class="breadcrumb">
            <li>
                <a href="${createLink(controller: controllerName, action: 'index')}">
                	<g:message code="${controllerName}.label"/>
                </a>
            </li>
            <li>
                <a href="${createLink(controller: controllerName, action: 'create')}">
                	<g:message code="${controllerName}.create.label"/>
                </a>
            </li>
        </ul>
        
        <div id="create-patient" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
		</div>
		
		<g:hasErrors bean="${patientInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${patientInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		
		<div class="row clearfix">
		    <div class="modal-body">
		        <g:form name="form" controller="${controllerName}" action="save" class="form-horizontal">
		        	<fieldset>
		                <g:render template="form"/>
		            </fieldset>		            
		        </g:form>
		    </div>
		    <div class="modal-footer">
		        <a href="${request.getHeader('referer')}"
		           class="btn btn-default">${message(code: 'default.button.cancel.label', default: 'Cancel')}</a>
		        <button type="submit"
		        		form="form"
		        		class="btn btn-primary">${message(code: 'default.button.save.label', default: 'Save')}</button>
		        <!-- <button type="submit"
		        		form="form"
		        		class="btn btn-primary"
		        		onclick="$('#form').get(0).setAttribute('action', 'delete');">Remover</button> -->
		    </div>
		</div>

	</body>
</html>
