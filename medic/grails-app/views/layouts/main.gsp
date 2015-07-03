<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>
	           <g:layoutTitle default="Grails"/>
	       </title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
	 	<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	
	<body>
		<div class="container">
	    	<div class="row clearfix">    	
		    	<nav class="navbar navbar-default">
				  <div class="container-fluid">
				    <div class="navbar-header">
				      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
				      <a class="navbar-brand" href="<g:createLink uri="/"/>">
				      	<i class="fa fa-home fa-fw"></i>
				      	<g:message code="medic.home.label" default="Home"/>
				      </a>
				    </div>
				    				
				    <!-- Collect the nav links, forms, and other content for toggling -->
				    <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse" >
				      <ul class="nav navbar-nav">
				        <li>
				          <a href="<g:createLink controller="patient" action="index"/>">
				          	<i class="fa fa-user fa-fw"></i>
				          	<g:message code="patient.label" default="Pacient"/>
						  </a>
				        </li>
				        
				        <li>
				          <a href="<g:createLink controller="appointment" action="index"/>">
				          	<i class="fa fa-calendar fa-fw"></i>
				          	<g:message code="appointment.label" default="Appointment"/>
						  </a>
				        </li>
				        
				        <li>
				          <a href="<g:createLink controller="diagnostic" action="index"/>">
				          	<i class="fa fa-stethoscope fa-fw"></i>
				          	<g:message code="diagnostic.label" default="Diagnostic"/>
				          </a>
				        </li>
				        
				        <li>
				          <a href="<g:createLink controller="prescription" action="index"/>">
				          	<i class="fa fa-medkit fa-fw"></i>
				          	<g:message code="prescription.label" default="Prescription"/>
				          </a>
				        </li>
				      </ul>				      
				    </div>
				  </div>
				</nav>
	        </div>
	        <div class="row clearfix">
	                    <g:layoutBody/>
	        </div>
	    </div>
	</div>



  
	</body>
</html>
